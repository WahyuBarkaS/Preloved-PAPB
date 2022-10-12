// ignore_for_file: unnecessary_import, unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/tabs/keranjang/chekout.dart';
import 'package:get/get.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  bool? check1 = false;
  int _counter = 0;
  void _increasecounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  void _decreasecounter() {
    setState(() {
      _counter = _counter - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xffC9DEEB).withOpacity(0.33),
                          blurRadius: 10,
                          offset: const Offset(0, 4))
                    ]),
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(children: [
                  // ignore: prefer_const_constructors
                  Expanded(flex: 2, child: Container()),
                  // ignore: prefer_const_constructors
                  Expanded(
                      flex: 10,
                      child: const Center(
                          child: Text(
                        'KERANJANG',
                        style: TextStyle(
                            // ignore: unnecessary_const
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 24),
                      ))),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ])),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.red,
                            value: check1,
                            onChanged: (bool? value) {
                              setState(() {
                                check1 = value;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/blouse.png',
                        height: 100,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Blouse Jeni',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rp. 60.000,-',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _decreasecounter(),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.remove,
                            color: Colors.grey,
                          )),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                            child: Text(
                          '$_counter',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        )),
                      ),
                      GestureDetector(
                        onTap: () => _increasecounter(),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.add,
                            color: Colors.grey,
                          )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total :',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                        ),
                        Text(
                          'Rp. 60.000,-',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(Checkout()),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Checkout',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
