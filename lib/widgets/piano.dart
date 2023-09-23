import 'package:flutter/material.dart';
import 'package:piano/global/constants.dart';
import 'package:piano/widgets/piano_key.dart';

class Piano extends StatelessWidget {
  const Piano({super.key, required this.pressedKeys});

  final List<String> pressedKeys;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: notes
              .map(
                (note) => note.length == 2
                    ? const SizedBox.shrink()
                    : PianoKey(
                        note: note,
                        pressed: pressedKeys.contains(noteToKey[note]),
                      ),
              )
              .toList(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: notes.map(
            (note) {
              if (note.length == 1) {
                return const SizedBox.shrink();
              }
              double leftPadding = keyWidth * 0.5;
              if (note == "df") leftPadding = keyWidth * 0.75;
              if (note == "gf") leftPadding = keyWidth * 1.5;
              return Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: PianoKey(
                  note: note,
                  pressed: pressedKeys.contains(noteToKey[note]),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
