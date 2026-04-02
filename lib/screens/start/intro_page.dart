import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              width: 300,
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
                  onPressed: () => {},
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
  }
}
