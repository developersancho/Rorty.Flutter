import 'package:flutter/material.dart';

class CircularDotView extends StatelessWidget {
  final bool isAlive;
  final bool isDead;

  const CircularDotView({
    Key? key,
    required this.isAlive,
    required this.isDead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isAlive) {
      return _greenDot();
    } else if (isDead) {
      return _redDot();
    } else {
      return _greyDot();
    }
  }

  Widget _redDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }

  Widget _greenDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
    );
  }

  Widget _greyDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }
}
