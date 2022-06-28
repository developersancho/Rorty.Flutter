import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rorty_flutter/app/utils/constants.dart';
import 'package:rorty_flutter/app/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 8,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/ic_profile.png"),
                              fit: BoxFit.cover))),
                  const SizedBox(height: 8),
                  const Text("Mr.Sanchez",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: 8),
                  const Text("Android Developer"),
                  const SizedBox(height: 8),
                  const Text(
                    "Developed By @developersancho",
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      launchUrlString(githubLink);
                    },
                    child: const Text(githubLink,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      launchUrlString(mediumLink);
                    },
                    child: const Text(mediumLink,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
