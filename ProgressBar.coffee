class ProgressBar extends Layer
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

# progressBar = new ProgressBar originY: 0, fillColor: '#ff5722', backgroundColor: '#ffccbc'
# progressBar.style.width = '100%'
