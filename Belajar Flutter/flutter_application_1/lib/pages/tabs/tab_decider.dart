// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/tabs/home/home_page.dart';
import 'package:flutter_application_1/pages/tabs/keranjang/keranjang.dart';
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
                  Keranjang(),
                  WishlistPage(),
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
                    child: currentIndex == 0
                        ? Icon(Icons.home, color: Colors.amber)
                        : Icon(Icons.home_outlined, color: Colors.white),
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                  ),
                  InkWell(
                    child: currentIndex == 1
                        ? Icon(Icons.shopping_cart, color: Colors.amber)
                        : Icon(Icons.shopping_cart_outlined,
                            color: Colors.white),
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                  ),
                  InkWell(
                    child: currentIndex == 2
                        ? Icon(Icons.bookmark, color: Colors.amber)
                        : Icon(Icons.bookmark_outline, color: Colors.white),
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                  ),
                  InkWell(
                    child: currentIndex == 3
                        ? Icon(Icons.person, color: Colors.amber)
                        : Icon(Icons.person_outline, color: Colors.white),
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
