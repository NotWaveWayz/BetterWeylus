/*
	This example is designed to show how to use the default Neutron template
	page. Because it uses the default template, it is also the simplest example
	to use and tweak as a beginner.
	
	It is also designed to show how you would apply your own theming to the
	template without having to modify it directly, by applying CSS styling to
	the built-in template title bar elements.
*/

#NoEnv
SetBatchLines, -1
CoordMode, Mouse, Screen

; Include the Neutron library
#Include Neutron.ahk

; Create a Neutron Window with the given content and save a reference to it in
; the variable `neutron` to be used later.

neutron := new NeutronWindow()
neutron.Load("gui.html")
neutron.Gui("+LabelNeutron")

; Show the GUI, with an initial size of 640 x 480. Unlike with a normal GUI
; this size includes the title bar area, so the "client" area will be slightly
; shorter vertically than if you were to make this GUI the normal way.
neutron.Show()

return

; The built in GuiClose, GuiEscape, and GuiDropFiles event handlers will work
; with Neutron GUIs. Using them is the current best practice for handling these
; types of events. Here, we're using the name NeutronClose because the GUI was
; given a custom label prefix up in the auto-execute section.
NeutronClose:
ExitApp
return


Clicked(neutron, event)
{
	; event.target will contain the HTML Element that fired the event.
	; Show a message box with its inner text.
	MsgBox, % "You clicked: " event.target.innerText
}

Submit(neutron, event)
{
	event.preventDefault()
	
	formData := neutron.GetFormData(event.target)
	
	; You can access all of the form fields by iterating over the FormData
	; object. It will go through them in the order they appear in the HTML.
	out := "Access all fields by iterating:`n"
	for name, value in formData
		out .= name ": " value "`n"
	out .= "`n"
	MsgBox, %out%
}

DynamicContent()
{
	; This function isn't called by Neutron, so we'll have to grab the global
	; Neutron window variable instead of using one from a Neutron event.
	global neutron
	
	; Get the mouse position
	MouseGetPos, x, y
	
	; Update the page with the new position
	neutron.doc.getElementById("ahk_x").innerText := x
	neutron.doc.getElementById("ahk_y").innerText := y
}

^F5::neutron.Load("..\b.html")