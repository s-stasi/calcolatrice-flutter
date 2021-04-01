import 'dart:math' as Math;

import 'package:NAVTOOL/SecondaPag.dart';

toRad(num deg) {
	return deg * Math.pi / 180;
}

toDeg(num rad) {
	return rad * 180 / Math.pi;
}

primoProblema(num tc, num tas, num windAngle, num windVel) {
	num alpha;
  
  //sfalzo il vento
  if(windAngle < 180) windAngle +=180;
  else windAngle -=180;

  // troviamo alpha
	if (windAngle < tc) alpha = tc - windAngle;
	else alpha = windAngle - tc;
	if (alpha > 180) alpha = 360 - alpha;

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

secondoProblema(num th, num tas, num windAngle, num windVel) {
num originWInd;
num gamma;
num gs;
num wca;
num tc;

//salvo la variabile vento originario 
originWInd = windAngle;
 
//sfalzo il vento
if(windAngle < 180) windAngle +=180;
else windAngle -=180;

//trovo gamma
if(originWInd > th)gamma = originWInd - th;
else gamma = th - originWInd;
if(gamma > 180) gamma = 360 - gamma;

//trovo gs
gs = Math.sqrt(Math.pow(windVel,2)+Math.pow(tas, 2)-(2*windVel*tas*Math.cos(toRad(gamma))));

//trovo wca
wca = toDeg(Math.asin((windVel*Math.sin(toRad(gamma)))/gs));

//trovo tc
if(windAngle < th) tc = th + wca;
else tc = th - wca;

var arr = [tc, gs];
return arr;
}