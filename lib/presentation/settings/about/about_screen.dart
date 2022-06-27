import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rorty_flutter/app/widgets/app_bar.dart';

class AboutScreen extends StatelessWidget {
  static const route = '/about';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  RortyAppBarWithBack _buildAppBar() {
    return RortyAppBarWithBack(title: tr("abouts"));
  }

  Widget _buildBody(BuildContext context) {
    return Center(child: Text("AboutScreen"));
  }
}
