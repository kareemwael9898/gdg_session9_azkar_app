import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key, required this.text});
  final String text;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  int counter=0;
  FlutterTts flutterTts = FlutterTts();
  void speak(String text) async{
   await flutterTts.setLanguage("ar");
   await flutterTts.setPitch(1.0);
   await flutterTts.setSpeechRate(0.5);
   await flutterTts.speak(text);


  }

  @override
  Widget build(BuildContext context) {
    print("ppppppp");
    return  Column(
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
                      counter =0;
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
                      speak(widget.text);
                    });
                  },
                  icon: Icon(Icons.hearing),
                ),
              ],
            )
          ],
        );
  }
}

//set state 

// 0 1 2 3 