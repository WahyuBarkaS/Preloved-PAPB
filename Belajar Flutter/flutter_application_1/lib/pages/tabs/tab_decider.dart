// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/tabs/home/home_page.dart';
import 'package:flutter_application_1/pages/tabs/wishlist/wishlist_page.dart';

class TabDecider extends StatefulWidget {
  const TabDecider({Key? key}) : super(key: key);

  @override
  State<TabDecider> createState() => _TabDeciderState();
}

class _TabDeciderState extends State<TabDecider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: currentIndex,
                children: [
                  HomePage(),
                  WishlistPage(),
                  HomePage(),
                  HomePage(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.home,
                      color: currentIndex == 0 ? Colors.amber : Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                  ),
                  InkWell(
                    child: Icon(Icons.bookmark_outline,
                        color: currentIndex == 1 ? Colors.amber : Colors.white),
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                  ),
                  InkWell(
                    child: Icon(Icons.notifications_outlined,
                        color: currentIndex == 2 ? Colors.amber : Colors.white),
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                  ),
                  InkWell(
                    child: Icon(Icons.person_outline,
                        color: currentIndex == 3 ? Colors.amber : Colors.white),
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
