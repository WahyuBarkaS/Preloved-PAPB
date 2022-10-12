import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/tabs/home/detail_item_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataCarousel = [
    'assets/fashion-banner.png',
    'assets/gambar2.jpg',
    'assets/gambar3.jpg',
  ];
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

  List dataCategory = [];

  PageController controllerCarousel =
      PageController(viewportFraction: 1, keepPage: true);

  categorySelector() {
    dataCategory.clear();
    dataItem.forEach((element) {
      if (element['category'] == categorySelected) {
        dataCategory.add(element);
      } else if (categorySelected == '') {
        dataCategory.add(element);
      }
    });
  }

  autoScroll() {
    Future.delayed(Duration(seconds: 3), () {
      controllerCarousel.animateToPage(
          currentSlider == (dataCarousel.length - 1) ? 0 : currentSlider + 1,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear);
      autoScroll();
    });
  }

  String categorySelected = '';

  int currentSlider = 0;

  @override
  void initState() {
    autoScroll();
    categorySelector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.search,
        //     color: Colors.grey,
        //   ),
        //   onPressed: () {},
        // ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        shadowColor: Color(0xffC9DEEB).withOpacity(0.33),
        title: Image.asset(
          'assets/logo.png',
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart_outlined,
          //     color: Colors.grey,
          //   ),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.2
                        : 400,
                child: PageView.builder(
                    controller: controllerCarousel,
                    onPageChanged: (value) {
                      setState(() {
                        currentSlider = value;
                      });
                    },
                    itemCount: dataCarousel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.asset(
                          dataCarousel[index],
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: dataCarousel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == currentSlider
                                ? Colors.amber
                                : Colors.grey),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Cari barang yang anda inginkan",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Container(
                    //height: 40,
                    height: MediaQuery.of(context).size.height * 0.05,
                    //width: 40,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Icon(Icons.search),
                    ),
                  )
                ],
              ),
              SizedBox(
                //height: 20,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            selected: categorySelected == '' ? true : false,
                            image: Image.asset(
                              'assets/star.png',
                              //height: 25,
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            onPressed: () {
                              setState(() {
                                categorySelected = '';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            //height: 5,
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('For you')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            selected:
                                categorySelected == 'Blouse' ? true : false,
                            image: Image.asset(
                              'assets/bid.png',
                              //height: 25,
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Blouse';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            //height: 5,
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('Bid')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            selected:
                                categorySelected == 'Coklat' ? true : false,
                            image: Image.asset(
                              'assets/dress.png',
                              //height: 25,
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Coklat';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            //height: 5,
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('Dress')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            selected:
                                categorySelected == 'Jeruk' ? true : false,
                            image: Image.asset(
                              'assets/skirt.png',
                              //height: 25,
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Jeruk';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            //height: 5,
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('Skirt')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            selected:
                                categorySelected == 'Daleman' ? true : false,
                            image: Image.asset(
                              'assets/jeans.png',
                              //height: 25,
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Daleman';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            //height: 5,
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('Jeans')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            selected: categorySelected == 'Kaos' ? true : false,
                            image: Image.asset(
                              'assets/tshirt.png',
                              //height: 25,
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Kaos';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            //height: 5,
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('T-shirt')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                //height: 20,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 4 / 6,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20),
                  itemCount: dataCategory.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                DetailItem(item: dataCategory[index]),
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
                          Text(dataCategory[index]['title']),
                          Text(
                            dataCategory[index]['harga'],
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final Image image;
  final bool selected;
  final VoidCallback onPressed;
  const CategoryButton(
      {Key? key,
      required this.image,
      required this.onPressed,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: selected ? Colors.amber : Colors.grey,
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: image),
      ),
    );
  }
}
