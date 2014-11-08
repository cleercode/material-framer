class Card extends Layer
	constructor: (options) ->
		options.backgroundColor ?= '#fff'
		options.shadowY ?= 2
		options.shadowBlur ?= 2
		options = _.extend options,
			borderRadius: 2
			shadowColor: 'rgba(0, 0, 0, 0.24)'

		super options
