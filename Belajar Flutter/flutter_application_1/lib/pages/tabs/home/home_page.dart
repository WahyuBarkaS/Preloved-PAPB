import 'package:flutter/material.dart';

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
    }
  ];

  List dataCategory = [];

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

  String categorySelected = '';

  int currentSlider = 0;

  @override
  void initState() {
    categorySelector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.png',
          height: 20,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              SizedBox(
                height: 150,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentSlider = value;
                      });
                    },
                    itemCount: dataCarousel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.asset(dataCarousel[index]),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
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
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Icon(Icons.tune)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            icon: Icon(Icons.auto_awesome_outlined),
                            onPressed: () {
                              setState(() {
                                categorySelected = '';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('For you')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            icon: Icon(Icons.auto_awesome_outlined),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Blouse';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Bid')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            icon: Icon(Icons.auto_awesome_outlined),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Coklat';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Dress')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            icon: Icon(Icons.auto_awesome_outlined),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Jeruk';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Skirt')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            icon: Icon(Icons.photo),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Daleman';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Jeans')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          CategoryButton(
                            icon: Icon(Icons.photo),
                            onPressed: () {
                              setState(() {
                                categorySelected = 'Daleman';
                                categorySelector();
                              });
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('T-shirt')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3.2 / 5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: dataCategory.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //Ganti jadi Gambar
                            height: 200,
                            decoration: BoxDecoration(
                                //color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset('assets/blouse.png'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(dataCategory[index]['title']),
                          Text(
                            dataCategory[index]['harga'],
                            style: TextStyle(fontWeight: FontWeight.bold),
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
  final Icon icon;
  final VoidCallback onPressed;
  const CategoryButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Center(child: icon),
      ),
    );
  }
}
