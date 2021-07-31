import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Degree {
	late num g;
	late num p;
	late num s;

	late num dec;
	late num rad;

	/////////////////////////
	/// Constructors
	/////////////////////////
	Degree(this.dec) {
		g = num.parse(this.dec.toStringAsFixed(0));
		p = num.parse(((dec - g) * 60).toStringAsFixed(0));
		s = ((((dec - g) * 60) - p) * 60).round();

		rad = toRad(dec);
		//__adjustResult();
	}

	Degree.ses(this.g, this.p, this.s) {
		dec = (g > 0) ? g + (p / 60) + (s / 3600) : ((g * -1) + (p / 60) + (s / 3600)) * -1;

		rad = toRad(dec);
		//__adjustResult();
	}

	Degree.dec(this.dec) {
		g = num.parse(this.dec.toStringAsFixed(0));
		print('${g}');
		p = num.parse(((dec - g) * 60).toStringAsFixed(0));
		s = ((((dec - g) * 60) - p) * 60).round();

		rad = toRad(dec);
		//__adjustResult();
	}

	/////////////////////////
	/// Operators
	/////////////////////////
	@override
	bool operator ==(covariant Degree other) => other.dec == dec;
	Degree operator +(covariant Degree other) => Degree.dec(dec + other.dec);
	Degree operator -(covariant Degree other) => Degree.dec(dec - other.dec);
	Degree operator /(Degree other) {
		return Degree.dec(dec / other.dec);
	}
	bool operator <(covariant int other) => dec<other;

	/////////////////////////
	/// Getters
	/////////////////////////
	num get decimal => dec;
	num get radians => rad;

	/////////////////////////
	/// Conversions
	/////////////////////////
	double toDouble() => dec.toDouble();
	String decToString() => dec.toString();
	String sesToString() => '$g°$p\'$s\"';
	int round() => dec.round();

	/////////////////////////
	/// Static methods
	/////////////////////////
	static double toRad(num deg) => deg * Math.pi / 180;
	static double toDeg(num rad) => rad * 180 / Math.pi;

	/////////////////////////
	/// Debug functions
	/////////////////////////
	void __log(String constructorType) {
		debugPrint('''
------------------------
built with $constructorType
gradi=    $g
primi=    $p
secondi=  $s

decimale= $dec
------------------------''');
	}

	void __adjustResult() {
		if (s < 0 && p < 0 && g < 0) {
			s = s*-1;
			p = p*-1;
			g = g*-1;
			return;
		}
		if (s < 0) {
			s = 60 - s;
			p = p - 1;
		}
		if (p < 0) {
			p = 60 - p;
			g = g - 1;
		}
	}
}
