# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

import wx

from .ToolPanel import ToolPanel
from .VtkViewPanel import VtkViewPanel


class MainWindow(wx.Frame):
    def __init__(self, controller):
        wx.Frame.__init__(self, None, title="HemeLB Setup Tool")
        self.appController = controller

        # self._InitMenu()
        # self._InitStatusBar() # A Statusbar in the bottom of the window

        # Going to have a vertically split window; tools on the left,
        # render window on the right.
        self.splitter = wx.SplitterWindow(self)

        self.toolPanel = ToolPanel(controller, self.splitter)
        self.vtkPanel = VtkViewPanel(controller.Pipeline, self.splitter)
        self.splitter.SplitVertically(self.toolPanel, self.vtkPanel)

        self.Show(True)

        return

    def _InitMenu(self):
        """Do stuff for the menu."""
        filemenu = wx.Menu()

        # wx.ID_ABOUT and wx.ID_EXIT are standard IDs provided by wxWidgets.
        filemenu.Append(wx.ID_ABOUT, "&About", " Information about this program")
        filemenu.AppendSeparator()
        filemenu.Append(wx.ID_EXIT, "E&xit", " Terminate the program")

        # Creating the menubar.
        menuBar = wx.MenuBar()
        menuBar.Append(filemenu, "&File")  # Adding the "filemenu" to the MenuBar
        self.SetMenuBar(menuBar)  # Adding the MenuBar to the Frame content.

        return

    pass
