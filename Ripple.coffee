// `origin` is an object containing the global x and y coordinates of the ripple, such as a touch event

class Ripple extends Layer
	constructor: (origin, container, color='#000') ->
		@container = container
		@relativeOrigin =
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
			superLayer:@
			backgroundColor: color
			opacity: 0.25
			width: 1
			height: 1
			x: @relativeOrigin.x
			y: @relativeOrigin.y
			borderRadius: '50%'
		
		@grow()
		
	grow: ->
		radius = (Math.max @container.width, @container.height) * 2

		@ink.animate
			properties:
				width: radius * 2
				height: radius * 2
				x: @relativeOrigin.x - radius
				y: @relativeOrigin.y - radius
	
	remove: ->
		animation = @ink.animate
			properties:
				opacity: 0

		animation.on Events.AnimationEnd, =>
			@destroy()
