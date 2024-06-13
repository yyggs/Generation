# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

"""Implementation of the Observer pattern.

Create a subclass of Observable to use.
"""
from collections.abc import MutableSequence
from copy import copy
from types import MethodType
import warnings
import numpy as np
from .Enum import Enum


class NoSuch(object):
    """Special None-like object for when an attribute did not exist."""

    pass


NoSuch = NoSuch()


# ChangeKinds = Enum("SETTING", "INSERTION", "REMOVAL", "REPLACEMENT")
ChangeTimes = Enum("BEFORE", "AFTER")


class NotifyOptions(object):
    def __init__(self, **kwargs):
        defaults = {
            "BEFORE_CHANGE": False,
            "AFTER_CHANGE": True  # ,
            # 'FOR_SETTING': True,
            # 'FOR_INSERTION': False,
            # 'FOR_REMOVAL': False,
            # 'FOR_REPLACEMENT': False,
        }

        for key, default in defaults.items():
            setattr(self, key, kwargs.pop(key, default))
            continue

        if len(kwargs):
            raise TypeError("Invalid keyword argument '%s'" % key)

        return

    pass


class Change(object):
    """Describe a change."""

    def __init__(self, time=None, obj=None, key=None, new=None, old=None, index=None):
        # if kind not in ChangeKinds:
        #     raise ValueError("Keyword argument 'kind' must be specified and one of %s" %
        #                      str(ChangeKinds))
        if time not in ChangeTimes:
            raise ValueError(
                "Keyword argument 'time' must be specified and one of %s"
                % str(ChangeTimes)
            )
        # self.kind = kind
        self.time = time
        self.obj = obj
        self.key = key
        self.new = new
        self.old = old
        self.index = index
        return

    pass


class Observable(object):
    """A base class/mixin to make attributes/properties of the user
    class observable. You should ensure that this base class' __new__
    is called before any other initialization. Just implementing the
    usual __init__ will take care of this.

    """

    _Args = {}

    def __new__(cls, *args, **kwargs):
        """Use __new__ to preempt user __init__ method."""
        # new = super(Observable, cls).__new__(cls, *args, **kwargs)
        new = object.__new__(cls)
        # Explicitly use object setattr to avoid our overrided one
        # that needs these attributes to have already been set!
        object.__setattr__(new, "_preObservers", {})
        object.__setattr__(new, "_postObservers", {})
        object.__setattr__(new, "_wrappers", {})
        object.__setattr__(new, "_dependencies", {})
        return new

    def __setattr__(self, name, newValue, **changeOpts):
        """Set the attribute in the usual fashion, but notify any
        observers of this attribute.
        """
        # # First get the old value, covering the case that it doesn't yet exist.
        # try:
        #     oldValue = getattr(self, name)
        #     if newValue is oldValue:
        #         # If the objects are the same, this isn't a change so
        #         # return.
        #         return
        # except AttributeError:
        #     # This attribute hasn't previously been set, so use our
        #     # special NoSuch object
        #     oldValue = NoSuch
        #     pass

        self.WillChangeValueForKey(name, **changeOpts)

        object.__setattr__(self, name, newValue)

        self.DidChangeValueForKey(name, **changeOpts)
        return

    def _notifyList(self, oMap, key, **changeOpts):
        try:
            # Get the set of observers
            attrObservers = oMap[key]
        except KeyError:
            # No observers have been set for attr
            attrObservers = {}
            pass

        if "." not in key:
            # Only for simple keys do I want to notify @ANY observers
            try:
                anyObservers = oMap["@ANY"]
            except KeyError:
                # No observers set for @ANY
                anyObservers = {}
                pass
            oList = {}
            oList.update(attrObservers)
            oList.update(anyObservers)
        else:
            oList = attrObservers
            pass

        # No observers, quit now
        if not len(oList):
            return

        opts = dict(obj=self, key=key)
        opts.update(changeOpts)
        # Construct a change object
        change = Change(**opts)

        for cb in oList.values():
            # Call each observer callback with the change object
            cb(change)
            continue
        return

    def GetValueForKey(self, keyPath):
        keyParts = keyPath.split(".", 1)
        if len(keyParts) == 1:
            return self._GetLocalValueForKey(keyPath)
        else:
            localKey, restOfKey = keyParts
            return self._GetLocalValueForKey(localKey).GetValueForKey(restOfKey)
        return

    def _GetLocalValueForKey(self, key):
        return getattr(self, key)

    def SetValueForKey(self, keyPath, value, **changeOpts):
        keyParts = keyPath.split(".", 1)
        if len(keyParts) == 1:
            self._SetLocalValueForKey(keyPath, value, **changeOpts)
        else:
            localKey, restOfKey = keyParts
            self._GetLocalValueForKey(localKey).SetValueForKey(
                restOfKey, value, **changeOpts
            )
            pass
        return

    def _SetLocalValueForKey(self, key, value, **changeOpts):
        self.__setattr__(key, value, **changeOpts)
        return

    def WillChangeValueForKey(self, key, **changeOpts):
        """Tell our observes that we're about to change."""
        changeOpts["time"] = ChangeTimes.BEFORE
        self._notifyList(self._preObservers, key, **changeOpts)
        return

    def DidChangeValueForKey(self, key, **changeOpts):
        """Tell our observers that we have just changed."""
        changeOpts["time"] = ChangeTimes.AFTER
        self._notifyList(self._postObservers, key, **changeOpts)
        return

    @staticmethod
    def _CallbackId(callback):
        if isinstance(callback, MethodType):
            # While functions are in general hashable, member
            # functions are iff the object itself is
            # hashable. Further, each time you get a new member
            # function, it won't have the same id() as other ones.
            #
            # Combine object identity with function hash to get a
            # reasonable key for the dict.
            obj = callback.__self__
            func = callback.__func__
            return hash((id(callback.__self__), callback.__func__))
        return id(callback)

    def AddObserver(self, keyPath, callback, options=NotifyOptions()):
        """Make 'callback' an observer of changes to the key path
        'keyPath'. The callback must be a callable taking one argument,
        which will be an Observer.Change object.
        """
        assert isinstance(keyPath, str)
        keyParts = keyPath.split(".", 1)

        # We always add an observer to the raw string
        self._AddObserverToLocalKey(keyPath, callback, options)
        if len(keyParts) == 2:
            try:
                wrap_for_key = self._wrappers[keyPath]
            except KeyError:
                wrap_for_key = self._wrappers[keyPath] = {}

            localKey, restOfKey = keyParts
            wrapper = ComplexKeyCallbackWrapper(
                self, localKey, restOfKey, callback, options
            )
            wrap_for_key[self._CallbackId(callback)] = wrapper
            # Make the wrapper observe the local part of the key path
            self._AddObserverToLocalKey(
                localKey,
                wrapper.LocalKeyPartChange,
                NotifyOptions(BEFORE_CHANGE=True, AFTER_CHANGE=True),
            )
            localValue = getattr(self, localKey)
            # And make it observe the sub-objects part of the key path
            localValue.AddObserver(restOfKey, wrapper.RestOfKeyChange, options)
            pass

        return

    def _AddObserverToLocalKey(self, keyPath, callback, options):
        for flag, obs in (
            (options.BEFORE_CHANGE, self._preObservers),
            (options.AFTER_CHANGE, self._postObservers),
        ):

            if flag:
                try:
                    attrObs = obs[keyPath]
                except KeyError:
                    attrObs = obs[keyPath] = {}
                    pass
                attrObs[self._CallbackId(callback)] = callback
                pass
            continue

        return

    def RemoveObserver(self, keyPath, callback):
        """Remove the observer from the list to be notified on change."""
        keyParts = keyPath.split(".", 1)
        # Always remove the raw string
        self._RemoveObserverFromLocalKey(keyPath, callback)
        if len(keyParts) == 2:
            localKey, restOfKey = keyParts
            # Get the wrapper
            wrap_for_key = self._wrappers[keyPath]
            wrapper = wrap_for_key[self._CallbackId(callback)]
            # Remove the wrapper from the local part
            self._RemoveObserverFromLocalKey(localKey, wrapper.LocalKeyPartChange)
            # And the from the sub-object
            localValue = getattr(self, localKey)
            localValue.RemoveObserver(restOfKey, wrapper.RestOfKeyChange)
            del wrap_for_key[self._CallbackId(callback)]

    def _RemoveObserverFromLocalKey(self, attr, observer):
        rm = False
        for timeObservers in (self._preObservers, self._postObservers):
            try:
                attrObs = timeObservers[attr]
                del attrObs[self._CallbackId(observer)]
            except KeyError:
                pass
            else:
                rm = True
            continue
        if not rm:
            warnings.warn(f"Attempting to remove observer from {self} key {attr}")
        return

    def AddDependency(self, ofAttr, onAttr):
        """Mark an attribute/property (ofAttr) as dependent on the
        value of another (onAttr). Thus when onAttr is changed, the
        observers of ofAttr will be notified.
        """
        try:
            depMap = self._dependencies[ofAttr]
        except KeyError:
            depMap = self._dependencies[ofAttr] = dict()
            pass

        if onAttr in depMap:
            # Trying to add a redundant dependency
            return
        depMap[onAttr] = Dependency(self, ofAttr, onAttr)

        self.AddObserver(
            onAttr,
            depMap[onAttr],
            options=NotifyOptions(BEFORE_CHANGE=True, AFTER_CHANGE=True),
        )
        return

    def __getnewargs__(self):
        """Must ensure that __new__ is called before the state is set.
        Do this by returning an empty tuple of arguments.
        """
        return ()

    def __getstate__(self):
        """Pickling interface"""
        dic = {}
        for attr in self._Args:
            # Pickling, so want the actual object. The Pickler will
            # deal with serialising the thing.
            dic[attr] = getattr(self, attr)
            continue
        return dic

    def __setstate__(self, state):
        """Unpickling interface"""
        self.__dict__.update(state)
        return

    def Yamlify(self):
        """Return the object in a state that is ready to be turned into YAML,
        i.e. lists and dicts of built in types only.
        """
        dic = {}
        for attr in self._Args:
            dic[attr] = self._YamlifyPart(getattr(self, attr))
            continue
        return dic

    def _YamlifyPart(self, part):
        try:
            # If it's complex, we should have provided this method
            return part.Yamlify()
        except AttributeError:
            # Wasn't provided, let's hope it was simple!
            if isinstance(part, float):
                # Store floats as hexadecial FP to avoid precision loss
                return part.hex()
            if isinstance(part, np.number):
                return part.tolist()
            return part

    def _Update(self, source, method, getter, checker, type_finder):
        # First, prepare a correctly ordered list of the attributes to copy.
        try:
            attrList = copy(self._CloneOrder)
        except AttributeError:
            attrList = []
            pass

        for k in self._Args:
            if k not in attrList:
                attrList.append(k)
                pass
            continue

        # Now copy them over
        for attr in attrList:
            val = getattr(self, attr)
            if isinstance(val, Observable):
                getattr(val, method)(getter(source, attr))
            else:
                if checker(source, attr):
                    newval = getter(source, attr)
                    # Floats can (should) be stored as hex FP
                    if isinstance(val, float) and isinstance(newval, str):
                        newval = float.fromhex(newval)
                    setattr(self, attr, newval)
                pass
            continue
        return

    def _FindType(self, attr, source):
        return type(self._Args[attr])

    def LoadFrom(self, dic):
        """Update the instance based on the data stored in a dictionary."""
        self._Update(
            dic, "LoadFrom", lambda d, k: d[k], lambda d, k: k in d, self._FindType
        )
        return

    def CloneFrom(self, other):
        """Update the instance based on another instance of the same class."""
        self._Update(
            other, "CloneFrom", getattr, hasattr, lambda attr, other: type(other)
        )
        return

    pass


class ComplexKeyCallbackWrapper(object):
    def __init__(self, obj, localKey, restOfKey, callback, options):
        self.obj = obj
        self.localKey = localKey
        self.restOfKey = restOfKey
        self.fullKey = localKey + "." + restOfKey
        self.callback = callback
        self.options = options
        return

    def LocalKeyPartChange(self, change):
        # This is a change of the first part of the key
        if change.time is ChangeTimes.BEFORE:
            # Notify
            self.obj.WillChangeValueForKey(self.fullKey)
            # Remove self from sub object's observers
            getattr(self.obj, self.localKey).RemoveObserver(
                self.restOfKey, self.RestOfKeyChange
            )
            pass
        if change.time is ChangeTimes.AFTER:
            # Notify
            self.obj.DidChangeValueForKey(self.fullKey)
            # Add self as sub object's observer
            getattr(self.obj, self.localKey).AddObserver(
                self.restOfKey, self.RestOfKeyChange, self.options
            )
            pass
        return

    def RestOfKeyChange(self, change):
        # The rest of the key's value changed, here we just forward
        # the notification.
        if change.time is ChangeTimes.BEFORE:
            self.obj.WillChangeValueForKey(self.fullKey)
            pass
        if change.time is ChangeTimes.AFTER:
            self.obj.DidChangeValueForKey(self.fullKey)
            pass


class Dependency(object):
    """Helper class for notification of dependent attributes."""

    def __init__(self, obj, ofAttr, onAttr):
        self.obj = obj
        self.ofAttr = ofAttr
        self.onAttr = onAttr
        return

    def __call__(self, change):
        """The object is the callback itself (i.e. it's a functor)."""
        if change.time is ChangeTimes.BEFORE:
            self.obj.WillChangeValueForKey(self.ofAttr)
            pass
        if change.time is ChangeTimes.AFTER:
            self.obj.DidChangeValueForKey(self.ofAttr)
            pass
        return

    pass


class ObservableList(Observable, MutableSequence):
    """A list whose member mutations can be observed. Do this by
    observing special attributes '@INSERTION', '@REMOVAL',
    '@REPLACEMENT'.

    """

    _Args = {"_ObservableList__contents": []}

    def __init__(self, iterable=None):
        if iterable is None:
            self.__contents = list()
        else:
            self.__contents = list(iterable)
            pass

        self.AddDependency("length", "@INSERTION")
        self.AddDependency("length", "@REMOVAL")
        return

    def __eq__(self, other):
        if isinstance(other, ObservableList):
            return self.__contents == other.__contents
        else:
            return self.__contents == other

    def __copy__(self):
        return type(self)(self.__contents)

    def __len__(self):
        return self.__contents.__len__()

    def __getitem__(self, index):
        return self.__contents.__getitem__(index)

    def __setitem__(self, index, obj):
        if index >= len(self) or index < -len(self):
            raise IndexError("ObservableList assignment index out of range")

        self.WillChangeValueForKey("@REPLACEMENT", index=index)
        self.__contents.__setitem__(index, obj)
        self.DidChangeValueForKey("@REPLACEMENT", index=index)

    def __delitem__(self, index):
        if index >= len(self) or index < -len(self):
            raise IndexError("ObservableList assignment index out of range")

        self.WillChangeValueForKey("@REMOVAL", index=index)
        self.__contents.__delitem__(index)
        self.DidChangeValueForKey("@REMOVAL", index=index)
        return

    def insert(self, index, object):
        """Insert object before index."""
        self.WillChangeValueForKey("@INSERTION", index=index)
        self.__contents.insert(index, object)
        self.DidChangeValueForKey("@INSERTION", index=index)
        return

    @property
    def length(self):
        return self.__len__()

    def __str__(self):
        return self.__contents.__str__()

    def __repr__(self):
        return self.__contents.__repr__()

    def __getstate__(self):
        return self.__contents

    def Yamlify(self):
        return [self._YamlifyPart(elem) for elem in self]

    def _Update(self, source, method, getter, checker, type_finder):
        # first clear our list
        while len(self):
            self.pop()
            continue
        # Copy in the new ones
        for obj in source:
            cls = type_finder("", obj)
            if issubclass(cls, Observable):
                newObj = cls()
                getattr(newObj, method)(obj)
            else:
                newObj = cls(obj)
                pass
            self.append(newObj)
            continue
        return

    pass


class ObservableListOf(ObservableList):
    """An Observable list whose elements must be of the appropriate type.

    Don't instaniate this class, subclass it and define the class attribute
    "ElementType".

    """

    @classmethod
    def CheckType(cls, elem):
        assert isinstance(elem, cls.ElementType), "Element of wrong type."
        return

    def __init__(self, iterable=None):
        if iterable is not None:
            # We have to take a copy, since the iterable could be e.g. a generator.
            itercopy = []
            for elem in iterable:
                self.CheckType(elem)
                itercopy.append(elem)
            iterable = itercopy

        return ObservableList.__init__(self, iterable)

    def __setitem__(self, index, obj):
        self.CheckType(obj)
        return ObservableList.__setitem__(self, index, obj)

    def insert(self, index, obj):
        self.CheckType(obj)
        return ObservableList.insert(self, index, obj)
