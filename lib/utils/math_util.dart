import 'dart:math';

/// Get all the vertices of a rectangle, given two vertices on main diagonal
/// and the width-height ratio.
///
/// The given two vertices must be top-right and bottom-left vertex of a rectangle.
///
/// The height-width ratio is equal to the length of right side divided by the
/// length of  bottom side .
RectangleVertices getRectangleAllVerticesFromMainDiagonal(
    Point topRight, Point bottomLeft, double heightWidthRatio) {
  Point o = (topRight + bottomLeft) * (1 / 2);
  double r = topRight.distanceTo(o);

  double topRightRadians = acos((topRight.x - o.x) / r);
  if (topRight.y < o.y) {
    topRightRadians = getSymmetricRadiansAboutXAxis(topRightRadians);
  }

  double arc_a = atan(heightWidthRatio);
  double arc_b = pi - 2 * arc_a;

  return RectangleVertices(
      Point(o.x + r * cos(topRightRadians + arc_b),
          o.y + r * sin(topRightRadians + arc_b)),
      topRight,
      bottomLeft,
      Point(o.x + r * cos(topRightRadians + arc_b + pi),
          o.y + r * sin(topRightRadians + arc_b + pi)));
}

/// Get the symmetric radians with respect to the x-axis.
///
/// radians must be in range [0, 2 * pi]
double getSymmetricRadiansAboutXAxis(double radians) {
  if (radians < 0 || radians > 2 * pi) {
    throw ArgumentError("radians must be in range [0, 2 * pi]");
  }
  return 2 * pi - radians;
}

double getSlopeOfSubDiagonalFromMainDiagonal(
    double slopeOfMainDiagonal, double heightWidthRatio) {
  double arc_alpha = atan(slopeOfMainDiagonal);
  double arc_a = atan(heightWidthRatio);
  return tan(arc_alpha - pi + 2 * arc_a);
}

class RectangleVertices {
  Point topLeft;
  Point topRight;
  Point bottomLeft;
  Point bottomRight;

  RectangleVertices(
      this.topLeft, this.topRight, this.bottomLeft, this.bottomRight);
}

/// Standard representation of a line
class Line {
  late double _a;
  late double _b;
  late double _c;

  Line(Point p1, Point p2) {
    double k = (p1.y - p2.y) / (p1.x - p2.x);
    if (k == double.infinity || k == double.negativeInfinity) {
      _a = 1;
      _b = 0;
      _c = (-1.0) * p1.x;
    } else {
      _a = k;
      _b = -1.0;
      _c = (-1.0) * k * p1.x + p1.y;
    }
  }

  /// Returns the distance from the given point to this line
  double distanceTo(Point point) {
    return (a * point.x + b * point.y + c).abs() / sqrt(pow(a, 2) + pow(b, 2));
  }

  /// Returns the intersection point with another line.
  /// Returns null if the intersection does not exists (if two lines are parallel).
  Point? intersection(Line otherLine) {
    double dem = b * otherLine.a - a * otherLine.b;
    if (dem == 0) {
      return null;
    }
    return Point((c * otherLine.b - b * otherLine.c) / dem,
        (a * otherLine.c - c * otherLine.a) / dem);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Line &&
          runtimeType == other.runtimeType &&
          _a == other._a &&
          _b == other._b &&
          _c == other._c;

  @override
  int get hashCode => _a.hashCode ^ _b.hashCode ^ _c.hashCode;

  double get a => _a;
  double get b => _b;
  double get c => _c;
}
