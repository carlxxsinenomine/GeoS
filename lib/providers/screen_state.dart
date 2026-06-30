
import 'package:geos/models/nav_mode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_state.g.dart';

@riverpod
class ScreenState extends _$ScreenState {
  @override
  NavMode build() {
    return NavMode.home;
  }
}