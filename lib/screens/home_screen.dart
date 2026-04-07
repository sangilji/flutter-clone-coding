import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/states/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('五反田', style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UserProvider>().setUserAuth(false);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              context.read<UserProvider>().setUserAuth(false);
            },
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              context.read<UserProvider>().setUserAuth(false);
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: IndexedStack(index: _bottomSelectedIndex, children: [
        Container(
          color: Colors.accents[0],
        ),
        Container(
          color: Colors.accents[2],
        ),
        Container(
          color: Colors.accents[3],
        ),
        Container(
          color: Colors.accents[4],
        ),
      ],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomSelectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _bottomSelectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ten_k), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.ten_k), label: '近く商品'),
          BottomNavigationBarItem(icon: Icon(Icons.ten_k), label: 'チャット'),
          BottomNavigationBarItem(icon: Icon(Icons.ten_k), label: 'お客様情報'),
        ],
      ),
    );
  }
}
