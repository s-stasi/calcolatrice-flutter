import 'dart:math' as Math;

toRad(num deg) {
	return deg * Math.pi / 180;
}

toDeg(num rad) {
	return rad * 180 / Math.pi;
}

primoProblema(num tc, num tas, num windAngle, num windVel) {
	

	// troviamo alpha
	num alpha;

	num changedWindAngle;
	if (windAngle <= 180) changedWindAngle = windAngle + 180;
	else changedWindAngle = windAngle - 180;

	if (windAngle < tc) alpha = tc - windAngle;
	else alpha = windAngle - tc;
	if (alpha > 180) alpha -= 360;

	// troviamo wca
	num wca = toDeg(Math.asin((windVel * Math.sin(toRad(alpha))) / tas));

	// troviamo gamma
	num gamma = 180 - alpha - wca;

	// troviamo gs
	num gs = ((tas * Math.sin(toRad(gamma))) / Math.sin(toRad(alpha)));

	num th;
	if(windAngle > tc) th = tc - wca;
	else if (windAngle < tc) th = tc + wca;
	else th = tc;

	var arr = [gs, th];
	return arr;
}