transformCurve = 'cubic-bezier(0.4, 0, 0.2, 1)' # fast out, slow in
enterCurve = 'cubic-bezier(0, 0, 0.2, 1)' # linear out, slow in
exitCurve = 'cubic-bezier(0.4, 0, 0.2, 1)' # fast out, linear in

Framer.Defaults.Animation = 
	curve: transformCurve
	time: 0.3

