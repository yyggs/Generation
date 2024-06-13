# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

try:
    import wxversion

    wxversion.ensureMinimal("2.8")
except ImportError:
    pass
import wx

from .Model.Profile import Profile
from .Model.Pipeline import Pipeline

from .Controller.ProfileController import ProfileController
from .Controller.PipelineController import PipelineController

from .View.MainWindow import MainWindow


class SetupTool(wx.App):
    def __init__(self, args={}, profile=None, **kwargs):
        self.cmdLineArgs = args
        self.cmdLineProfileFile = profile

        wx.App.__init__(self, **kwargs)
        return

    def OnInit(self):
        # Model
        self.profile = Profile()

        self.pipeline = Pipeline()

        # Controller
        self.controller = ProfileController(self.profile)
        self.controller.Pipeline = PipelineController(self.pipeline, self.controller)

        # View
        self.view = MainWindow(self.controller)

        if self.cmdLineProfileFile is not None:
            # Load the profile
            self.profile.LoadFromFile(self.cmdLineProfileFile)
            pass

        # override any keys that have been set on cmdline.
        self.profile.UpdateAttributesBasedOnCmdLineArgs(self.cmdLineArgs)

        self.SetTopWindow(self.view)
        return True

    pass
