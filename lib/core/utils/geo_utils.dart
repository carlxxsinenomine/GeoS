import 'dart:math' as math;

abstract final class GeoUtils {
  static double dist2(double x1, double y1, double x2, double y2) {
    final dx = x1 - x2;
    final dy = y1 - y2;
    return dx * dx + dy * dy;
  }

  static double distToSegment(
    double px,
    double py,
    double ax,
    double ay,
    double bx,
    double by,
  ) {
    final dx = bx - ax;
    final dy = by - ay;

    if (dx == 0 && dy == 0) return dist2(px, py, ax, ay);

    final t = ((px - ax) * dx + (py - ay) * dy) / (dx * dx + dy * dy);
    final tc = math.max(0.0, math.min(1.0, t));

    return dist2(px, py, ax + tc * dx, ay + tc * dy);
  }

  static bool pointInPolygon(double px, double py, List<List> ring) {
    bool inside = false;
    int j = ring.length - 1;

    for (int i = 0; i < ring.length; i++) {
      final xi = (ring[i][0] as num).toDouble();
      final yi = (ring[i][1] as num).toDouble();
      final xj = (ring[j][0] as num).toDouble();
      final yj = (ring[j][1] as num).toDouble();

      if ((yi > py) != (yj > py) &&
          px < (xj - xi) * (py - yi) / (yj - yi) + xi) {
        inside = !inside;
      }
      j = i;
    }

    return inside;
  }

  static double distanceToFeature(
    Map<String, dynamic> feature,
    double tapLon,
    double tapLat,
  ) {
    final geo = feature['geometry'] as Map<String, dynamic>;
    final type = geo['type'] as String;
    final coords = geo['coordinates'];

    switch (type) {
      case 'Point':
        final c = coords as List;
        return dist2(tapLon, tapLat, (c[0] as num).toDouble(),
            (c[1] as num).toDouble());

      case 'LineString':
        final pts = (coords as List).cast<List>();
        double minD = double.infinity;
        for (int i = 0; i < pts.length - 1; i++) {
          final d = distToSegment(
            tapLon, tapLat,
            (pts[i][0] as num).toDouble(), (pts[i][1] as num).toDouble(),
            (pts[i + 1][0] as num).toDouble(),
            (pts[i + 1][1] as num).toDouble(),
          );
          if (d < minD) minD = d;
        }
        return minD;

      case 'Polygon':
        final ring = ((coords as List)[0] as List).cast<List>();

        if (pointInPolygon(tapLon, tapLat, ring)) return 0;

        double minD = double.infinity;
        for (int i = 0; i < ring.length - 1; i++) {
          final d = distToSegment(
            tapLon, tapLat,
            (ring[i][0] as num).toDouble(), (ring[i][1] as num).toDouble(),
            (ring[i + 1][0] as num).toDouble(),
            (ring[i + 1][1] as num).toDouble(),
          );
          if (d < minD) minD = d;
        }
        return minD;

      default:
        return double.infinity;
    }
  }
}
