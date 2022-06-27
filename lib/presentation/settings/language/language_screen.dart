import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rorty_flutter/app/language/app_language_provider.dart';
import 'package:rorty_flutter/app/language/language_manager.dart';
import 'package:rorty_flutter/app/widgets/app_bar.dart';

class LanguageScreen extends StatelessWidget {
  static const route = '/language';

  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  RortyAppBarWithBack _buildAppBar() {
    return RortyAppBarWithBack(title: tr("app_language"));
  }

  Widget _buildBody(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text("languageChangeTitle".tr()),
          trailing: DropdownButton<Locale>(
            items: [
              DropdownMenuItem(
                  child: Text(LanguageManager.instance!.trLocale.countryCode!
                      .toUpperCase()),
                  value: LanguageManager.instance!.trLocale),
              DropdownMenuItem(
                  child: Text(LanguageManager.instance!.enLocale.countryCode!
                      .toUpperCase()),
                  value: LanguageManager.instance!.enLocale),
            ],
            onChanged: (value) {
              context.setLocale(value!);
              Provider.of<AppLanguageProvider>(context).changeLanguage(value);
            },
            value: context.locale,
          ),
          subtitle: Text("languageChangeSubtitle".tr())),
    );
  }
}
