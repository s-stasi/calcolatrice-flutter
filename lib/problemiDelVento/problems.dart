import 'package:flutter/foundation.dart';
import 'dart:math' as Math;

toRad(num deg) {
	return deg * Math.pi / 180;
}

toDeg(num rad) {
	return rad * 180 / Math.pi;
}

primoProblema(num tc, num tas, num windAngle, num windVel) {
	num alpha;
  
  num wao= windAngle;
  //sfalzo il vento
  if(windAngle < 180) windAngle +=180;
  else windAngle -=180;
  debugPrint('windAngle: $windAngle');

  // troviamo alpha
	if (windAngle < tc) alpha = tc - windAngle;
	else alpha = windAngle - tc;
	if (alpha > 180) alpha = 360 - alpha;
  debugPrint('alpha: $alpha');

	// troviamo wca
	num wca = toDeg(Math.asin((windVel * Math.sin(toRad(alpha))) / tas));
  debugPrint('wca: $wca');

	// troviamo gamma
	num gamma = 180 - alpha - wca;
  debugPrint('gamma: $gamma');

	// troviamo gs
	num gs = (tas * Math.sin(toRad(gamma)));
  gs = gs / Math.sin(toRad(alpha));
  debugPrint('gs: $gs');

	num th;
	if(windAngle > tc) th = tc - wca;
	else if (windAngle < tc) th = tc + wca;
	else th = tc;
  debugPrint('th: $th');
  
  num th1;
  if (wao>gamma)th1= wao - gamma;
  else th1 = gamma + wao;
  debugPrint('th1: $th1');

  num th2;
  th2 = 360 - (gamma - wca);
  debugPrint('th2: $th2');
 
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