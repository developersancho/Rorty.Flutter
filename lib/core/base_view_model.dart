import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final BuildContext context;
  bool isDisposing = false;

  BaseViewModel(this.context);

  Future initViewmodel() async {
    isDisposing = false;
    return Future.value();
  }

  void triggerNotify({bool force = false}) {
    if (!force && isDisposing) return;
    notifyListeners();
  }

  @override
  void dispose() {
    isDisposing = true;
    super.dispose();
  }
}
