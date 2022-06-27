import 'package:flutter/material.dart';
import 'package:rorty_flutter/app/widgets/circular_dot_view.dart';
import 'package:rorty_flutter/data/model/dto/character/character_status.dart';

class CharacterStatusView extends StatelessWidget {
  final String status;

  const CharacterStatusView({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularDotView(
          isAlive: status == CharacterStatus.alive.status,
          isDead: status == CharacterStatus.dead.status,
        ),
        const SizedBox(width: 8),
        Text(
          status,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
