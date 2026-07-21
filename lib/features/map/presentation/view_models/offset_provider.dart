import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class OffsetProvider extends Notifier<Offset?> {
  @override
  Offset? build() {
    state = null;
    return state;
  }

  void updateOffset(Offset? off) {
    if(off != null) {
      state = off;
    } else {
      state = null;
    }
  }

}

final offsetProvider = NotifierProvider<OffsetProvider, Offset?>(() {
  return OffsetProvider();
});