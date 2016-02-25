An unofficial module for prototyping material design in Framer.

## Instructions
1. Drop `material.coffee` in the `modules` directory of your Framer project. This requires [Framer Studio v1.11.1](http://framerjs.tumblr.com/post/113265323127/introducing-modules-and-more) or higher.
2. Add `material = require 'material'` to the top of your prototype file.

## Examples
```
material = require 'material'

Framer.Defaults.Animation = 
	curve: material.transformCurve
	time: 0.3

button1 = new material.Button 'Open dialog', backgroundColor: '#e91e63', width: 200
button2 = new material.Button 'This button is auto-sized', fit: true

card = new material.Card width: 320, height: 200

progressBar = new material.ProgressBar originY: 0, fillColor: '#ff5722', backgroundColor: '#ffccbc'
progressBar.style.width = '100%'

# this ripple is based on a tap position
card.on Events.TouchStart, (event) ->
	origin =
		x: event.offsetX + @screenFrame.x
		y: event.offsetY + @screenFrame.y
	ripple = new material.Ripple origin: event, container: card, color: '#fff'
	Framer.Device.screen.once Events.TouchEnd, () =>
		ripple.remove()

# this ripple is centered on the toolbar icon but contained in the toolbar
toolbarIcon.on Events.TouchStart, ->
	origin =
		x: @screenFrame.x + @width / 2
		y: @screenFrame.y + @height / 2
	ripple = new material.Ripple origin: origin, container: toolbar, radius: 96
	Framer.Device.screen.once Events.TouchEnd, () =>
		ripple.remove()
```
