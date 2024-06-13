# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

from ..Bindings.ListController import ListController, HasListKeys
from .IoletController import IoletController
from ..Model.Iolets import Inlet, Outlet


class IoletListController(ListController):
    def __init__(self, delegate):
        ListController.__init__(
            self, delegate, SelectionControllerClass=IoletController.New
        )
        self.nInlets = 0
        self.nOutlets = 0
        return

    def AddInlet(self):
        self.nInlets += 1
        self.append(
            Inlet(
                Name="Inlet%d" % (self.nInlets),
                Radius=self.GetValueForKey("DefaultIoletRadius"),
            )
        )
        return

    def AddOutlet(self):
        self.nOutlets += 1
        self.append(
            Outlet(
                Name="Outlet%d" % (self.nOutlets),
                Radius=self.GetValueForKey("DefaultIoletRadius"),
            )
        )
        return

    def RemoveIolet(self):
        # TODO: Make sure PlacedIolet's widget + actor are removed from the scene.
        if self.SelectedIndex is None:
            return
        del self[self.SelectedIndex]
        return

    pass


class HasIoletListKeys(HasListKeys):
    """Mixin for ObjectController subclasses with IoletList keys."""

    BindFunctionDispatchTable = ((IoletListController, "BindList"),)

    def DefineIoletListKey(self, name):
        """Typically used in the subclass __init__ method to easily
        mark a key as being a List and hence needing a ListController
        to manage it.
        """
        setattr(self, name, IoletListController(getattr(self.delegate, name)))
        return

    pass
