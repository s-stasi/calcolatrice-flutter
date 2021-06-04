var qnhPaint = Paint()
	..color = Colors.black
	..strokeWidth = 4; // Not useful 'cause it's a cuse it's a path
var qnhPath = Path();
qnhPath.moveTo(0, 200);

for(var i = 0; i <= 400; i++) {
	path.lineTo(0+i, 15 * Math.sin(toRad(i)));
}

for(var i = 400; i >= 0; i--) {
	path.lineTo(i - 5, 15 * Math.sin(toRad(i)));
}

qnhPath.close();