import 'dart:math' as Math;

class Degree {
  late num g;
  late num p;
  late num s;

  late num dec;

  /////////////////////////
  /// Constructors
  /////////////////////////
  Degree.ses(this.g, this.p, this.s) {
    dec = (g > 0)
        ? g + (p / 60) + (s / 3600)
        : ((g * -1) + (p / 60) + (s / 3600)) * -1;
  }

  Degree.dec(this.dec) {
    g = num.parse(dec.toString().split('.')[0]);
    p = num.parse(((dec - g) * 60).toString().split('.')[0]);
    s = ((((dec - g) * 60) - p) * 60).round();
  }

  /////////////////////////
  /// Operators
  /////////////////////////
  @override
  bool operator ==(covariant Degree other) => other.dec == dec;
  Degree operator +(covariant Degree other) => Degree.decimal(dec + other.dec);
  Degree operator -(covariant Degree other) => Degree.decimal(dec - other.dec);

  /////////////////////////
  /// Getters
  /////////////////////////
  num get decimal => dec;
  String get sessagesimal => '$g°$p\'$s\"';
}
