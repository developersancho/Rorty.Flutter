import 'package:flutter/material.dart';

class LineView extends StatelessWidget {
  const LineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: Divider(
        height: 1,
        thickness: 1.0,
      ),
    );
  }
}
