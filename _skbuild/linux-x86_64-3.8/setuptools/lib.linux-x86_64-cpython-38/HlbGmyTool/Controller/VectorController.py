# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

from ..Bindings.ObjectController import ObjectController

# from ..View.VectorCtrl import VectorCtrlMapper


class VectorController(ObjectController):
    """Controller for HlbGmyTool.Model.Vector objects."""

    def __init__(self, delegate):
        ObjectController.__init__(self, delegate)
        return

    pass


class HasVectorKeys(object):
    """Mixin for ObjectController subclasses with Vector keys."""

    BindFunctionDispatchTable = ((VectorController, "BindVector"),)

    def BindVector(self, top, key, mapper):
        """Each component of the vector should be appropriately bound."""
        for coord in ("x", "y", "z"):
            # Get the key path to the component and bind the part of
            # the VectorCtrl to that path
            top.BindValue(key + "." + coord, mapper.CreateSubMapper(coord))
            continue
        return

    def DefineVectorKey(self, name):
        """Typically used in the subclass __init__ method to easily
        mark a key as being a Vector and hence needing a
        VectorController to manage it.
        """
        setattr(self, name, VectorController(getattr(self.delegate, name)))
        return

    pass
