import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/utils/logger.dart';

class AddressPage extends StatelessWidget {
  PageController controller;

  AddressPage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              prefixIconConstraints: BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: '地域名を書いてください。',
              hintStyle: TextStyle(color: Theme
                  .of(context)
                  .hintColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Theme
                      .of(context)
                      .primaryColor,
                ),
                icon: Icon(CupertinoIcons.compass, color: Colors.white),
                label: Text(
                  '現在位置',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ExtendedImage.asset('images/img.png'),
                    title: Text('address $index'),
                    subtitle: Text('detail $index'),
                    trailing:Icon(Icons.more),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
