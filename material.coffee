exports.transformCurve = 'cubic-bezier(0.4, 0, 0.2, 1)' # fast out, slow in
exports.enterCurve = 'cubic-bezier(0, 0, 0.2, 1)' # linear out, slow in
exports.exitCurve = 'cubic-bezier(0.4, 0, 0.2, 1)' # fast out, linear in


exports.Button = class Button extends Layer
	constructor: (text, options={}) ->
		options.backgroundColor ?= '#03a9f4'
		options.color ?= '#fff'
		options.shadowY ?= 2
		options.shadowBlur ?= 2
		options = _.extend options,
			borderRadius: 2
			height: 36
			shadowColor: 'rgba(0, 0, 0, 0.24)'

		super options

		@style.font = '500 14px/36px Roboto'
		@style.textTransform = 'uppercase'
		@style.textAlign = 'center'
		@html = text
		
		if options.fit
			@style.display = 'inline-block'
			@style.width = 'auto'
			@style.minWidth = '88px'
			@style.padding = '0 8px'

exports.Card = class Card extends Layer
	constructor: (options={}) ->
		options.backgroundColor ?= '#fff'
		options.shadowY ?= 2
		options.shadowBlur ?= 2
		options = _.extend options,
			borderRadius: 2
			shadowColor: 'rgba(0, 0, 0, 0.24)'

		super options


exports.ProgressBar = class ProgressBar extends Layer
	constructor: (options={}) ->
		options.backgroundColor ?= 'rgba(0, 0, 0, 0.12)'
		options.height ?= 4
		options.originY ?= 1
		options.scaleY ?= 0

		super options

		@fill = new Layer
			superLayer: @
			backgroundColor: options.fillColor || '#03a9f4'
			scaleX: 0
			originX: 0
		@fill.style.width = '100%'
		@fill.style.height = '100%'

	animateTo: (fill, time) =>
		@fill.scaleX = 0
		@animate properties: scaleY: 1
		fillAnimation = new Animation
			layer: @fill
			properties: scaleX: fill
			time: time || 1
		containerAnimation = new Animation
			layer: @
			properties: scaleY: 0
		fillAnimation.on Events.AnimationEnd, -> containerAnimation.start()
		fillAnimation.start()
		containerAnimation


exports.Ripple = class Ripple extends Layer
	constructor: (options={}) ->
		options.container ?= Framer.Device.screen
		options.origin ?= x: options.container.midX, y: options.container.midY
		options.radius ?= Math.max options.container.width, options.container.height
		options.color ?= '#000'

		super
			backgroundColor: null
			width: options.container.width
			height: options.container.height
			x: options.container.screenFrame.x
			y: options.container.screenFrame.y
			clip: true
			
		@placeBefore options.container

		@ink = new Layer
			superLayer: @
			backgroundColor: options.color
			opacity: 0.25
			width: options.radius * 2
			height: options.radius * 2
			midX: options.origin.x - options.container.screenFrame.x
			midY: options.origin.y - options.container.screenFrame.y
			borderRadius: '50%'
			scale: 0
		
		@grow()

		
	grow: ->
		@ink.animate properties: scale: 1
	
	remove: ->
		animation = @ink.animate properties: opacity: 0
		animation.on Events.AnimationEnd, => @destroy()


# via https://www.facebook.com/groups/framerjs/permalink/580709592056116/
scaledScreenFrame = ->
	frame = Framer.Device.screen.screenFrame
	frame.width  *= Framer.Device.screen.screenScaleX()
	frame.height *= Framer.Device.screen.screenScaleY()
	
	frame.x += (Framer.Device.screen.width -  frame.width)  * Framer.Device.screen.originX
	frame.y += (Framer.Device.screen.height - frame.height) * Framer.Device.screen.originY

	return frame

exports.eventToOrigin = (event) ->
	x: (event.x - scaledScreenFrame().x) / Framer.Device.screen.screenScaleX()
	y: (event.y - scaledScreenFrame().y) / Framer.Device.screen.screenScaleY()
