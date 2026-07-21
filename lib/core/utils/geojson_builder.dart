import 'dart:convert';

import 'package:maplibre/maplibre.dart';

import '../../features/map/data/models/draw_mode.dart';
import '../../features/map/domain/entities/geofence_info_entity.dart';

abstract final class GeoJsonBuilder {
  static Map<String, dynamic> pointFeature(
    Geographic p, {
    bool preview = false,
    int id = -1,
    GeofenceInfoEntity? info,
  }) =>
      {
        'type': 'Feature',
        'properties': {
          'type': 'point',
          'preview': preview,
          'selected': false,
          'featureId': id,
          ..._infoProps(info),
        },
        'geometry': {
          'type': 'Point',
          'coordinates': [p.lon, p.lat],
        },
      };

  static Map<String, dynamic> lineFeature(
    List<Geographic> pts, {
    bool preview = false,
    int id = -1,
    GeofenceInfoEntity? info,
  }) =>
      {
        'type': 'Feature',
        'properties': {
          'type': 'line',
          'preview': preview,
          'selected': false,
          'featureId': id,
          ..._infoProps(info),
        },
        'geometry': {
          'type': 'LineString',
          'coordinates': pts.map((p) => [p.lon, p.lat]).toList(),
        },
      };

  static Map<String, dynamic> polygonFeature(
    List<Geographic> pts, {
    bool preview = false,
    int id = -1,
    GeofenceInfoEntity? info,
  }) {
    final ring = [
      ...pts.map((p) => [p.lon, p.lat]),
      [pts.first.lon, pts.first.lat],
    ];
    return {
      'type': 'Feature',
      'properties': {
        'type': 'polygon',
        'preview': preview,
        'selected': false,
        'featureId': id,
        ..._infoProps(info),
      },
      'geometry': {
        'type': 'Polygon',
        'coordinates': [ring],
      },
    };
  }

  /// Converts a [GeofenceInfoEntity] into a flat map of GeoJSON properties.
  /// Returns an empty map when [info] is null (e.g. for preview features).
  static Map<String, dynamic> _infoProps(GeofenceInfoEntity? info) {
    if (info == null) return {};
    return {
      if (info.name != null) 'name': info.name,
      if (info.description != null) 'description': info.description,
      if (info.isActive != null) 'isActive': info.isActive,
      if (info.color != null) 'color': info.color,
      if (info.municipality != null) 'municipality': info.municipality,
      if (info.province != null) 'province': info.province,
      if (info.user != null) 'user': info.user,
    };
  }

  static String buildFeatureCollection({
    required List<Map<String, dynamic>> features,
    required int selectedIndex,
    required List<Geographic> previewPoints,
    required DrawMode drawMode,
  }) {
    final all = <Map<String, dynamic>>[];

    for (int i = 0; i < features.length; i++) {
      final f = Map<String, dynamic>.from(features[i]);
      final props = Map<String, dynamic>.from(f['properties'] as Map);
      props['selected'] = i == selectedIndex;
      f['properties'] = props;
      all.add(f);
    }

    if (previewPoints.isNotEmpty) {
      switch (drawMode) {
        case DrawMode.point:
          for (final p in previewPoints) {
            all.add(pointFeature(p, preview: true));
          }
          break;

        case DrawMode.line:
          if (previewPoints.length >= 2) {
            all.add(lineFeature(previewPoints, preview: true));
          } else {
            all.add(pointFeature(previewPoints.first, preview: true));
          }
          break;

        case DrawMode.polygon:
          if (previewPoints.length >= 3) {
            all.add(polygonFeature(previewPoints, preview: true));
          } else {
            for (final p in previewPoints) {
              all.add(pointFeature(p, preview: true));
            }
          }
          break;

        case DrawMode.none:
        case DrawMode.select:
          break;
      }
    }

    return jsonEncode({'type': 'FeatureCollection', 'features': all});
  }
}
