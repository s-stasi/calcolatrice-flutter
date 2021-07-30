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
	Degree(double dec) {
			g = num.parse(dec.toString().split('.')[0]);
			p = num.parse(((dec - g) * 60).toString().split('.')[0]);
			s = ((((dec - g) * 60) - p) * 60).round();

			rad = toRad(dec);
	}

	Degree.ses(this.g, this.p, this.s) {
		dec = (g > 0) ? g + (p / 60) + (s / 3600) : ((g * -1) + (p / 60) + (s / 3600)) * -1;

		rad = toRad(dec);
	}

	Degree.dec(this.dec) {
		g = num.parse(dec.toString().split('.')[0]);
		p = num.parse(((dec - g) * 60).toString().split('.')[0]);
		s = ((((dec - g) * 60) - p) * 60).round();

		rad = toRad(dec);
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
}
