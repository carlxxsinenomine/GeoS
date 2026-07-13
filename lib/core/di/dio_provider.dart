import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/core/network/network_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl:NetworkConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30)
    )
  )..interceptors.add(
    PrettyDioLogger(
      compact: false,
      logPrint: (obj) => log(obj.toString(), name: 'GeoS API'),
    )
  );

  return dio;
});