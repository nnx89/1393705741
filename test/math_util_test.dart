import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:whoshere/utils/math_util.dart';

double delta = 1E-10;

void main() {
  test('test getSlopeOfSubDiagonalFromMainDiagonal', () {
    expect(getSlopeOfSubDiagonalFromMainDiagonal(1, 1) * 1, closeTo(-1, delta));
    expect(getSlopeOfSubDiagonalFromMainDiagonal(double.infinity, 1),
        closeTo(0, delta));
    expect(getSlopeOfSubDiagonalFromMainDiagonal(double.negativeInfinity, 1),
        closeTo(0, delta));
  });

  test("test getRectangleAllVerticesFromMainDiagonal", () {
    RectangleVertices rect =
        getRectangleAllVerticesFromMainDiagonal(Point(2, 2), Point(0, 0), 1);
    expect(rect.topLeft.x, closeTo(0, delta));
    expect(rect.topLeft.y, closeTo(2, delta));
    expect(rect.bottomRight.x, closeTo(2, delta));
    expect(rect.bottomRight.y, closeTo(0, delta));

    // test symmetric rotation
    rect =
    getRectangleAllVerticesFromMainDiagonal(Point(0, 0), Point(2, 2), 1);
    expect(rect.bottomRight.x, closeTo(0, delta));
    expect(rect.bottomRight.y, closeTo(2, delta));
    expect(rect.topLeft.x, closeTo(2, delta));
    expect(rect.topLeft.y, closeTo(0, delta));
  });

  test("test getSymmetricRadiansAboutXAxis", () {
    // First quarter
    expect(getSymmetricRadiansAboutXAxis(pi / 3), closeTo(pi * 5 / 3, delta));

    // Second quarter
    expect(getSymmetricRadiansAboutXAxis(pi * 2 / 3), closeTo(pi * 4 / 3, delta));

    // Third quarter
    expect(getSymmetricRadiansAboutXAxis(pi * 4 / 3), closeTo(pi * 2 / 3, delta));

    // Fourth quarter
    expect(getSymmetricRadiansAboutXAxis(pi * 5 / 3), closeTo(pi / 3, delta));

  });

  test("test Line init", () {
    Line l1 = Line(Point(0, 0), Point(1, 1));
    Line l2 = Line(Point(2, 2), Point(4, 4));
    expect(l1 == l2, equals(true));
  });

  test("test vertical Line init", () {
    Line l1 = Line(Point(0, 0), Point(0, 1));
    Line l2 = Line(Point(0, 2), Point(0, 4));
    expect(l1 == l2, equals(true));
  });

  test("test Line distanceTo", () {
    Line l1 = Line(Point(0, 0), Point(0, 1));
    expect(l1.distanceTo(Point(2.2, 2.2)), equals(2.2));
  });

  test("test Line intersection", () {
    Line l1 = Line(Point(0, 0), Point(1, 1));
    Line l2 = Line(Point(2, 2), Point(4, 4));
    expect(l1.intersection(l2), equals(null));

    l1 = Line(Point(0, 0), Point(1, 1)); // y=x
    l2 = Line(Point(1, 0), Point(1, 1)); // x=1
    expect(l1.intersection(l2), equals(Point(1, 1)));
  });
}
