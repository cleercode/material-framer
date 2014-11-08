class Button extends Layer
	constructor: (text, options) ->
		options.backgroundColor ?= '#03A9F4'
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
