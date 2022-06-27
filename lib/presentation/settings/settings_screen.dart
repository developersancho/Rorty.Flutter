import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rorty_flutter/app/theme/app_color.dart';
import 'package:rorty_flutter/app/theme/app_theme_provider.dart';
import 'package:rorty_flutter/app/widgets/app_bar.dart';
import 'package:rorty_flutter/app/widgets/line_view.dart';
import 'package:rorty_flutter/presentation/settings/about/about_screen.dart';
import 'package:rorty_flutter/presentation/settings/language/language_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
        builder: (context, AppThemeProvider themeNotifier, child) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context, themeNotifier),
      );
    });
  }

  RortyAppBar _buildAppBar() {
    return RortyAppBar(
      title: tr("settings"),
    );
  }

  Widget _buildBody(BuildContext context, AppThemeProvider appThemeProvider) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildThemeView(tr("theme_mode"), appThemeProvider, context),
                // GestureDetector(
                //     behavior: HitTestBehavior.opaque,
                //     onTap: () => _navigateLanguage(context),
                //     child: _buildRowView(tr("app_language"), "", true, true)),
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _navigateAbout(context),
                    child: _buildRowView(tr("abouts"), "", true, true)),
                _buildRowView(tr("app_version"), "1.0.0", false, false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThemeView(
      String key, AppThemeProvider appThemeProvider, BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      key,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlutterSwitch(
                      width: 52.0,
                      height: 26.0,
                      padding: 1.0,
                      switchBorder: Border.all(
                        color: AppColor.Red700,
                        width: 1.0,
                      ),
                      toggleColor: AppColor.Red700,
                      activeColor: AppColor.Transparent,
                      inactiveColor: AppColor.Transparent,
                      activeIcon: Icon(
                        Icons.nightlight_round,
                        color: AppColor.CardDark,
                      ),
                      inactiveIcon: Icon(
                        Icons.wb_sunny,
                        color: AppColor.CardLight,
                      ),
                      value: appThemeProvider.isDark,
                      onToggle: (value) {
                        appThemeProvider.isDark = value;
                      })
                ],
              ),
            ),
            const LineView()
          ],
        ),
      ),
    );
  }

  Widget _buildRowView(
      String key, String value, bool showDivider, bool showArrow) {
    return Card(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      key,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        value,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        softWrap: false,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                      if (showArrow)
                        IconButton(
                          iconSize: 18,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          onPressed: () {
                            print("ccc");
                          },
                        ),
                    ],
                  )
                ],
              ),
            ),
            if (showDivider) const LineView()
          ],
        ),
      ),
    );
  }

  _navigateLanguage(BuildContext context) {
    context.pushNamed(LanguageScreen.route);
  }

  _navigateAbout(BuildContext context) {
    context.pushNamed(AboutScreen.route);
  }
}
