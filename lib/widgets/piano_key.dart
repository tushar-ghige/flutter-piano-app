import 'package:flutter/material.dart';
import 'package:piano/global/coloors.dart';
import 'package:piano/global/constants.dart';
import 'package:piano/services/autio_player.dart';

class PianoKey extends StatelessWidget {
  const PianoKey({
    super.key,
    required this.note,
    required this.pressed,
  });

  final String note;
  final bool pressed;

  @override
  Widget build(BuildContext context) {
    bool isAccidental = note.length == 2;
    return Material(
      color: pressed
          ? Coloors.activeKeyColor
          : isAccidental
              ? Coloors.accidentalKeyColor
              : Coloors.keyColor,
      child: InkWell(
        highlightColor: Coloors.activeKeyColor,
        onTapDown: (_) => AudioPlayerService.instance.play(note),
        child: Container(
          height: isAccidental ? keyHeight * 0.6 : keyHeight,
          width: isAccidental ? keyWidth / 2 : keyWidth,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Coloors.borderColor, width: 2),
          ),
          padding: const EdgeInsets.only(bottom: 24),
          child: Visibility(
            visible: !isAccidental,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                note.toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
