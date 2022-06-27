import 'package:flutter/material.dart';
import 'package:rorty_flutter/presentation/characters/list/characters_screen.dart';
import 'package:rorty_flutter/presentation/episodes/list/episodes_screen.dart';
import 'package:rorty_flutter/presentation/locations/list/locations_screen.dart';
import 'package:rorty_flutter/presentation/settings/settings_screen.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<Widget> pages = <Widget>[
    const CharactersScreen(),
    const EpisodesScreen(),
    const LocationsScreen(),
    const SettingsScreen()
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Widget getPages() => pages.elementAt(selectedIndex);
}
