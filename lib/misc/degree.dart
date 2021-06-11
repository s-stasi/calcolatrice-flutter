import 'dart:math' as Math;

class Degree {
  int? degree;
  int? first;
  int? second;
  double? decimal;

  Degree();

  Degree.sess(this.degree, this.first, this.second) {
    toDecimal();
  }

  Degree.decimal(this.decimal);

  toDecimal() {
    decimal = degree + (first / 60);
  }

  toSessagesimal() {
    tmp = (decimal * 100).round();
    tmp = tmp / 100;
    first = tmp - (tmp.round());
    degree = tmp.round();
    first = (first * 60).round();
    second = first - (first.round());
    second = (second * 60).round();
    dec = (dec - first).round();
  }

  get decimal => decimal;
  get sess => []
}
