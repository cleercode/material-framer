// `origin` is an object containing the global x and y coordinates of the ripple, such as a touch event

class Ripple extends Layer
	constructor: (origin, container, color='#000') ->
		radius = (Math.max container.width, container.height) * 2
		relativeOrigin =
			x: origin.x - container.x
			y: origin.y - container.y
		
		super
			backgroundColor: 'transparent'
			width: container.width
			height: container.height
			x: container.x
			y: container.y
			clip: true
			
		@placeBefore container

		@ink = new Layer
			superLayer: @
			backgroundColor: color
			opacity: 0.25
			width: radius * 2
			height: radius * 2
			x: relativeOrigin.x - radius
			y: relativeOrigin.y - radius
			borderRadius: '50%'
			scale: 0
		
		@grow()
		
	grow: ->
		@ink.animate properties: scale: 1
	
	remove: ->
		animation = @ink.animate properties: opacity: 0
		animation.on Events.AnimationEnd, => @destroy()
