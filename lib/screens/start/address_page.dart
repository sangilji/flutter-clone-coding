import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  PageController controller;

  AddressPage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          minimum: EdgeInsets.all(16.0),
          child: TextFormField(
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
              hintStyle: TextStyle(color: Theme.of(context).hintColor),
            ),
          ),
        ),
        SafeArea(
          minimum: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                icon: Icon(CupertinoIcons.compass, color: Colors.white),
                label: Text(
                  '現在位置',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
