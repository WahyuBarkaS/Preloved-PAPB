import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/tabs/home/detail_item_page.dart';
import 'package:get/get.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List dataItem = [
    {
      'image': '',
      'title': 'Blouse Jeni',
      'harga': 'Rp. 60.000,-',
      'category': 'Blouse'
    },
    {
      'image': '',
      'title': 'Coklat Nate',
      'harga': 'Rp. 50.000,-',
      'category': 'Coklat'
    },
    {
      'image': '',
      'title': 'Jeruk Eme',
      'harga': 'Rp. 50.000,-',
      'category': 'Jeruk'
    },
    {
      'image': '',
      'title': 'Blouse Shafa',
      'harga': 'Rp. 100.000,-',
      'category': 'Blouse'
    },
    {
      'image': '',
      'title': 'Blouse Dwita',
      'harga': 'Rp. 75.000,-',
      'category': 'Blouse'
    },
    {
      'image': '',
      'title': 'Blouse Cahya',
      'harga': 'Rp. 500.000,-',
      'category': 'Blouse'
    },
    {
      'image': '',
      'title': 'Daleman Fitri',
      'harga': 'Rp. 500.000,-',
      'category': 'Daleman'
    },
    {
      'image': '',
      'title': 'Kaos Reyhan',
      'harga': 'Rp. 500.000,-',
      'category': 'Kaos'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Wishlist'),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 4 / 6,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 20),
                    itemCount: dataItem.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailItem(item: dataItem[index]),
                                );
                              },
                              child: Container(
                                //Ganti jadi Gambar
                                //height: 200,
                                decoration: BoxDecoration(
                                    //color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset('assets/blouse.png'),
                              ),
                            ),
                            SizedBox(
                              //height: 10,
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(dataItem[index]['title']),
                            Text(
                              dataItem[index]['harga'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
