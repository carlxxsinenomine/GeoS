import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/app/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:geos/firebase_options.dart';

/// https://medium.com/flutter-community/using-flutter-with-firebase-a-developers-guide-09c88258015f
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Pass all uncaught error to Crachlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(ProviderScope(child: MyApp()));
}
