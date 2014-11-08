class Card extends Layer
	constructor: (options) ->
		options.backgroundColor ?= '#fff'
		options.shadowY ?= 2
		options.shadowBlur ?= 2
		options = _.extend options,
			borderRadius: '2px'
			shadowColor: 'rgba(0, 0, 0, 0.24)'
			shadowY: elevation * 2
			shadowBlur: elevation * 2

		super options
