# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

"""This module contains a simple implementation of the Bindings
pattern for MVC applications, using that in Cocoa as its
inspiration. See:

http://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CocoaBindings/CocoaBindings.html

for details.

Basically your Model object(s) must inherit from Observable and have
public attributes/properties (my convention is to start these with an
upper case letter) that will be bound to View items. It can also
contain methods that we want to trigger from elsewhere.

Your Controller should be an ObjectController or a subclass and when
instantiated you should pass it the model object it is in charge of
exposing.

Your view should then Bind to keys of the controller which will then
keep the model variables in sync with the widgets.

 ________                __________               ______
|Model   |<---\         |Controller|             |Widget|<----|
|--------|     \        |----------|             |------|     |
|FileName|      \-------|delegate  |             |      |     |
|        |       \      |bindings  |----                      |
                  |     |          |    |                     |
                  |                     |                     |
                  |                     ---------------- ...  |
                  |      ____________   |      |      |       |
                  |     |Binding     |<-|      |      |       |
                  |     |------------|                        |
                  |  |--|modelMapper |                        |
                  |  |  |widgetMapper|-----|                  |
                  |  |  |translator  |-|   |                  |
                  |  |  |            | |   |                  |
                  |  |                 |   |                  |
                  |  |                 |   |                  |
                  |  |   __________    |   |                  |
                  |  |  |Translator|<--|   |                  |
                  |  |  |----------|       |                  |
                  |  |  |          |       |                  |
                  |  |                     |                  |
                  |  |                     |                  |
                  |  |                     |                  |
                  |  |   _______________   |   ____________   |
                  |  |->|Observingmapper|  |->|WidgetMapper|  |
                  |     |---------------|     |------------|  |
                  |-----|model          |     |widget      |--|
                        |key ='FileName'|     |            |
                        |               |

1) Initialisation

model = Model()
controller = ObjectController(model)
view = View(controller)

def View.__init__(self, controller):
    self.text = wx.TextCtrl(...)
    controller.BindValue('FileName',
                         WxWidgetMapper(self.text, 'Value', wx.EVT_TEXT))


2) Something alters either end.

 - any Mappers are notified (Observing ones through my simple Observer
   pattern implementation, WxWidget ones through WX events, VTK ones
   through VTK observation)
 
 - each tells its Binding
 
 - the Binding then gets the new value through the Mapper
 
 - passes it throught the Translator
 
 - sets the resulting value on the other Mapper


"""


class BindingError(Exception):
    pass


if __name__ == "__main__":
    from test import test

    test()
