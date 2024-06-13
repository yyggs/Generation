# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

import wx


class LayoutContainer(object):
    """Represents a BoxSizer. It's children can be other
    LayoutContainers, wx.Window subclasses or Spacer subclasses. The
    first two cases can also be given as tuples of (object,
    proportion, flags).

    """

    def __init__(self, *args):
        self.children = args
        return

    def create(self):
        """Create the sizer hierarchy."""
        sizer = wx.BoxSizer(self.orient)

        for c in self.children:
            if isinstance(c, tuple):
                child = c[0]
                args = c[1:]
            else:
                child = c
                args = tuple()
                pass

            if isinstance(child, LayoutContainer):
                subElem = child.create()
            else:
                subElem = child
                pass

            if isinstance(subElem, StretchSpacer):
                sizer.AddStretchSpacer(prop=subElem.prop)
            elif isinstance(subElem, SquareSpacer):
                sizer.AddSpacer(subElem.size)
            elif isinstance(subElem, RectSpacer):
                sizer.Add(subElem.size)
            else:
                sizer.Add(subElem, *args)
                pass

            continue
        return sizer

    pass


class StretchSpacer(object):
    def __init__(self, prop=1):
        self.prop = prop
        return

    pass


class SquareSpacer(object):
    def __init__(self, size):
        self.size = size
        return

    pass


class RectSpacer(object):
    def __init__(self, x, y):
        self.size = (x, y)
        return

    pass


class V(LayoutContainer):
    orient = wx.VERTICAL
    pass


class H(LayoutContainer):
    orient = wx.HORIZONTAL
    pass
