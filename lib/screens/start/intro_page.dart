import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  PageController controller;

  IntroPage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        final image = size.width-32;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'ニンジンマーケット',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                SizedBox(
                  width: image,
                  height: image,
                  child: ExtendedImage.asset(
                    'images/start_image.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  '周りの人と直取引',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Text(
                  'ニンジンマーケットは直取引マーケットです。\n地域を設定して始めましょう！',
                  style: TextStyle(fontSize: 13),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: (){
                        controller.animateToPage(1, duration: Duration(milliseconds: 700), curve: Curves.easeOut);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        '地域を設定してスタート',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
