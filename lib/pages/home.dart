import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piano/global/coloors.dart';
import 'package:piano/global/constants.dart';
import 'package:piano/services/autio_player.dart';
import 'package:piano/widgets/piano.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> pressedKeys = [];

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        final key = event.logicalKey.keyLabel.toLowerCase();
        if (event is RawKeyDownEvent &&
            !pressedKeys.contains(key) &&
            keyToNote.keys.contains(key)) {
          setState(() => pressedKeys.add(key));
          AudioPlayerService.instance.play(keyToNote[key]!);
        } else if (event is RawKeyUpEvent) {
          setState(() => pressedKeys.remove(key));
        }
      },
      child: Scaffold(
        backgroundColor: Coloors.bgColor,
        body: Center(child: Piano(pressedKeys: pressedKeys)),
      ),
    );
  }
}
