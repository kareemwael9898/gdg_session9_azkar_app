import 'package:audioplayers/audioplayers.dart';
import 'package:azkar/app_strings.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key, required this.text});

  final String text;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  int counter = 0;
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> speak() async {
    switch (widget.text) {
      case AppStrings.subhan_allah_wabihamdih:
        await audioPlayer.play(AssetSource("subhan_allah_wabihamdih.mp3"));
        break;
      case AppStrings.subhan_allah_aleazim:
        await audioPlayer.play(AssetSource("subhan_allah_aleazim.mp3"));
        break;
      default:
        print("Audio not found for this Azkar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/quran.png"),
        Text(
          widget.text,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
        ),
        Text(
          '$counter',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 50,
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              iconSize: 50,
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              iconSize: 50,
              onPressed: () {
                setState(() {
                  speak();
                });
              },
              icon: Icon(Icons.hearing),
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}