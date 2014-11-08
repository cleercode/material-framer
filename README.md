This is an unofficial set of snippets I use for prototyping material design in Framer.

## Examples

### Button
```
button = new Button 'Open dialog', backgroundColor: '#e91e63', width: 200, fit: true
```
```
button = new Button 'This button is auto-sized', fit: true
```


### Card
```
card = new Card x: 0, y: 0, width: 320, height: 200
```

### Ripple
```
card.on Events.TouchStart, (event) ->
	@ripple = new Ripple(event, card)
card.on Events.TouchEnd, ->
	@ripple.remove()
```

```
imageLayer.on Events.TouchStart, (event) ->
	@ripple = new TouchRipple(event, imageLayer, '#fff')
imageLayer.on Events.TouchEnd, ->
	@ripple.remove()
```
