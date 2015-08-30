$(document).ready(function() {

	toggle=0;
	function dblclick() {
		if (toggle==0) {
			var sc=99999; toggle=1;
		} else {
			var sc=0; toggle=0;
		}
		window.scrollTo(0,sc);
	}
	if (document.layers) {
		document.captureEvents(Event.ONDBLCLICK);
	}
	document.ondblclick=dblclick;


	var IE = document.all?true:false;
	if (!IE) document.captureEvents(Event.MOUSEMOVE)
	document.onmousemove = getMouseXY;
	var tempX = 0;
	var tempY = 0;
	function getMouseXY(e) {
		if (IE) { // grab the x-y pos.s if browser is IE
			tempX = event.clientX + document.body.scrollLeft;
			tempY = event.clientY + document.body.scrollTop;
		} else { // grab the x-y pos.s if browser is NS
			tempX = e.pageX;
			tempY = e.pageY;
		}
		if (tempX < 0){tempX = 0;}
		if (tempY < 0){tempY = 0;}
		return true;
	}
});