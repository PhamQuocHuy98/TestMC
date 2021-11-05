import 'dart:ui';
import 'package:demo_mc/screens/discover/discover_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  List<Widget> listTab = [];

  @override
  void initState() {
    super.initState();
    listTab = [
      DiscoverScreen(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const SizedBox(),
      ),
      body: listTab[currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              //                    <--- top side
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: CustomItemBottomNav(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class CustomItemBottomNav extends StatefulWidget {
  final int currentIndex;
  final Function(int index) onTap;
  final Color activeColor;
  final Color inactiveColor;
  const CustomItemBottomNav({
    Key? key,
    this.currentIndex = 0,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.black,
    required this.onTap,
  }) : super(key: key);
  @override
  _CustomItemBottomNavState createState() => _CustomItemBottomNavState();
}

class _CustomItemBottomNavState extends State<CustomItemBottomNav> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 100),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(0);
              },
              child: const Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(1);
              },
              child: const Icon(
                CupertinoIcons.search,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(2);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xffFF00D6),
                    Color(0xffFF4D00),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: const Icon(Icons.add),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(3);
              },
              child: const Icon(
                CupertinoIcons.chat_bubble,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(4);
              },
              child: const Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
