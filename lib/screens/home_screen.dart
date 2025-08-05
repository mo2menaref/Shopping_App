import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/widgets/dotsindicator.dart';
import 'package:shopping/utils/constants.dart';
import 'package:shopping/widgets/product_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    tabController = TabController(length: 5, vsync: this);
  }

  void _updateCurrentPageIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
    tabController.index = index;
    pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text("Our Products"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            "Featured Products",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Suwannaphum',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                PageView(
                  controller: pageViewController,
                  onPageChanged: (index) {
                    _updateCurrentPageIndex(index);
                  },
                  children: [
                    Card(child: Center(child: Image.asset('assets/images/watch1.jpg')),color: Colors.white,),
                    Card(child: Center(child: Image.asset('assets/images/backbag1.jpg')),color: Colors.white,),
                    Card(child: Center(child: Image.asset('assets/images/shirt2.jpg')),color: Colors.white,),
                    Card(child: Center(child: Image.asset('assets/images/shirt3.jpg')),color: Colors.white,),
                    Card(child: Center(child: Image.asset('assets/images/backbag3.jpg')),color: Colors.white,),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: PageIndicator(
                    tabController: tabController,
                    currentPageIndex: currentPageIndex,
                    onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: [
              ProductCard(
                title: "Modern Black Watch",
                content: 'A Modern Black Watch for Adults',
                imagePath: 'assets/images/watch3.jpg',
              ),
              ProductCard(
                title: "Black Bag",
                content: 'A back bag for Students and Programmers',
                imagePath: 'assets/images/backbag2.jpg',
              ),
              ProductCard(
                title: "T-shirt Wide",
                content: 'T-shirt Wide for Teenagers with all sizes',
                imagePath: 'assets/images/shirt1.jpg',
              ),
              ProductCard(
                title: "Sneaker Shoes",
                content: 'off-white Sneaker Shoes for Teenagers with all sizes',
                imagePath: 'assets/images/shoes1.jpg',
              ),
              ProductCard(
                title: "Sneaker Shoes",
                content: 'off-white Sneaker Shoes for Teenagers with all sizes',
                imagePath: 'assets/images/shoes2.jpg',
              ),
              ProductCard(
                title: "Black Bag",
                content: 'A back bag for Students and Programmers',
                imagePath: 'assets/images/shirt2.jpg',
              ),
              ProductCard(
                title: "Sneaker Shoes",
                content: 'Green Sneaker Shoes for Teenagers with all sizes',
                imagePath: 'assets/images/shoes3.jpg',
              ),
              ProductCard(
                title: "Sneaker Shoes",
                content: 'Black Sneaker Shoes for Teenagers with all sizes',
                imagePath: 'assets/images/shoes4.jpg',
              ),
              ProductCard(
                title: "T-shirt Wide",
                content: 'T-shirt Wide for Teenagers with all sizes',
                imagePath: 'assets/images/shirt3.jpg',
              ),
              ProductCard(
                title: "Sneaker Shoes",
                content: 'off-white Sneaker Shoes for Teenagers with all sizes',
                imagePath: 'assets/images/shoes5.jpg',
              ),
              ProductCard(
                title: "Black Bag",
                content: 'A back bag for Students and Programmers',
                imagePath: 'assets/images/backbag3.jpg',
              ),
              ProductCard(
                title: "Classic Watch",
                content: 'A back bag for Students and Programmers',
                imagePath: 'assets/images/watch2.jpg',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Hot Offers",
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Suwannaphum',
                ),
                textAlign: TextAlign.center,
            ),
          ),
          ListView.builder(itemBuilder: (BuildContext context, int index) { 

          },

          )
        ],
      ),
    );
  }
}
