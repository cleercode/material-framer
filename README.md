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

card.on Events.TouchStart, (event) ->
	@ripple = new material.Ripple(event, card)
card.on Events.TouchEnd, ->
	@ripple.remove()
```