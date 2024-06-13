# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

from ..Util.Observer import Observable
from .Translators import UnitTranslator


class Mapper(object):
    def __init__(self, translator=UnitTranslator()):
        self.translator = translator
        return

    def SetTranslator(self, trans):
        self.translator = trans
        return

    def SetBinding(self, b):
        self.binding = b
        return

    def HandleUpdate(self, ignored=None, alsoIgnored=None):
        self.binding.MapperWasUpdated(self)
        return

    def Get(self):
        ans = self._Get()
        ans = self.translator.Untranslate(ans)
        return ans

    def Set(self, val):
        self.Unobserve()
        val = self.translator.Translate(val)
        self._Set(val)
        self.Observe()

    pass


class ReadOnlyMapper(Mapper):
    def Set(self, val):
        raise ValueError("This is a readonly mapper")

    pass


class WriteOnlyMapper(Mapper):
    def Get(self):
        raise ValueError("This is a writeonly mapper")

    def Observe(self):
        return

    def Unobserve(self):
        return

    pass


class SimpleWriteOnlyMapper(WriteOnlyMapper):
    def __init__(self, target, key, translator=UnitTranslator()):
        super().__init__(translator=translator)
        self.target = target
        self.key = key

    def _Set(self, val):
        self.target.SetValueForKey(self.key, val)


class SimpleObservingMapper(Mapper):
    def __init__(self, model, key, translator=UnitTranslator()):
        assert isinstance(model, Observable)
        # Test for the presence of the key
        val = model.GetValueForKey(key)
        Mapper.__init__(self, translator=translator)
        self.model = model
        self.key = key
        return

    def Observe(self):
        self.model.AddObserver(self.key, self.HandleUpdate)
        return

    def Unobserve(self):
        self.model.RemoveObserver(self.key, self.HandleUpdate)
        return

    def _Get(self):
        return self.model.GetValueForKey(self.key)

    def _Set(self, val):
        self.model.SetValueForKey(self.key, val)
        return

    pass
