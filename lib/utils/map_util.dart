import 'dart:math';
import 'dart:ui';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import './math_util.dart';

/// Convert geo coordinate system (latitude and longitude) to screen coordinate
/// system
///
/// mapSize is the screen resolution of the map display area in pixels.
///
/// Returns the screen coordinates with respect to the southwest bounds
/// of the map. Positive direction is from southwest to northeast.
Point convertGeoCoordToScreenCoord(
    BMFCoordinate geo, BMFCoordinateBounds bounds, Size mapSize) {
  RectangleVertices rect = getRectangleAllVerticesFromMainDiagonal(
      _bmfCoordToPoint(bounds.northeast),
      _bmfCoordToPoint(bounds.southwest),
      mapSize.height / mapSize.width);
  Point geoPoint = _bmfCoordToPoint(geo);
  Line lineLeft = Line(rect.bottomLeft, rect.topLeft);
  Line lineBottom = Line(rect.bottomLeft, rect.bottomRight);
  double x = lineLeft.distanceTo(geoPoint);
  double y = lineBottom.distanceTo(geoPoint);
  Point geoVector = geoPoint - rect.bottomLeft;
  if (geoVector.x < 0) {
    x = -x;
  }
  if (geoVector.y < 0) {
    y = -y;
  }
  double factor = mapSize.height / rect.bottomLeft.distanceTo(rect.topLeft);
  return Point(x * factor, y * factor);
}

Point _bmfCoordToPoint(BMFCoordinate coord) {
  return Point(coord.longitude, coord.latitude);
}
