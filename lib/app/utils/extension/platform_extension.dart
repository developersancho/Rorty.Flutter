import 'dart:io';
import 'package:flutter/foundation.dart';

extension Target on Object {
  bool isAndroid() {
    return Platform.isAndroid;
  }

  bool isIOS() {
    return Platform.isIOS;
  }

  bool isLinux() {
    return Platform.isLinux;
  }

  bool isWindows() {
    return Platform.isWindows;
  }

  bool isMacOS() {
    return Platform.isMacOS;
  }

  bool isFuchsia() {
    return Platform.isFuchsia;
  }

  bool isWeb() {
    return kIsWeb;
  }
}
