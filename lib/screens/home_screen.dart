import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/widgets/dotsindicator.dart';
import 'package:shopping/widgets/product_card.dart';
import 'package:shopping/widgets/hot_offer_item.dart';
import 'package:shopping/utils/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    tabController = TabController(length: 5, vsync: this);

    // Initialize fade in animation controller
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Start fade in animation when the page loads
    _fadeController.forward();
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
    _fadeController.dispose();
  }

  final List<HotOfferData> _hotOffers = [
  HotOfferData(
  desc: 'Amazing Deal! 50% off on all smartwatches.Tired of missing important notifications or fumbling for your phone during workouts? Elevate your daily routine with our cutting-edge smartwatch, now at an unprecedented 50% discount! This isn\'t just a timepiece it\'s your personal assistant, fitness tracker, and communication hub, all conveniently on your wrist. Imagine seamlessly tracking your heart rate, steps, and sleep patterns, receiving calls and messages without breaking your stride, and controlling your music effortlessly',
  imagePath: 'assets/images/hotoffers1.jpg',
  ),
  HotOfferData(
  desc: 'Is your old backpack struggling to keep up with your busy life, leaving your essentials disorganized and your shoulders aching? Upgrade to our ergonomically designed backpack, featured in our Back to School Special with unbeatable prices! Crafted for students, professionals, and adventurers alike, this backpack offers dedicated padded compartments for laptops and tablets, multiple organizational pockets for all your gadgets and accessories, and water-resistant material to protect your valuables. ',
  imagePath: 'assets/images/hotoffers2.jpg',
  ),
  HotOfferData(
  desc: 'Looking to refresh your wardrobe with comfortable, stylish basics that don\'t break the bank? Dive into our Weekend Flash Sale on trendy T-shirts and enjoy our \'Buy 2 Get 1 Free\' spectacular! These aren\'t just ordinary tees; they\'re made from premium, breathable cotton for all-day comfort, featuring modern cuts and a range of vibrant colors and unique designs to express your personality. Perfect for casual outings, layering, or simply lounging in style. Why settle for one when you can triple your style impact?',
  imagePath: 'assets/images/hotoffers3.jpg',
  ),
  HotOfferData(
  desc: 'Ready to step up your shoe game with footwear that blends cutting-edge style with ultimate comfort? Our latest sneaker collection is here, and for a limited time, you can snag a pair with an exclusive 20% discount! Designed for the modern individual, these sneakers feature innovative cushioning technology for superior support, durable materials for long-lasting wear, and a sleek, versatile aesthetic that transitions effortlessly from the gym to the street.',
  imagePath: 'assets/images/hotoffers4.jpg',
  ),
  HotOfferData(
  desc: 'Searching for that perfect statement piece that combines timeless elegance with everyday functionality? Discover our exclusive online offer on premium leather bags, meticulously crafted for every occasion. Imagine the rich feel of genuine leather, the attention to detail in every stitch, and the thoughtfully designed compartments that keep your essentials perfectly organized whether you\'re heading to a business meeting or a weekend getaway.',
  imagePath: 'assets/images/hotoffers5.jpg',
  ),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text("Our Products"),
      ),
      body: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: ListView(
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
                          Card(
                            child: Center(
                              child: Image.asset('assets/images/watch1.jpg'),
                            ),
                            color: Colors.white,
                          ),
                          Card(
                            child: Center(
                              child: Image.asset('assets/images/backbag1.jpg'),
                            ),
                            color: Colors.white,
                          ),
                          Card(
                            child: Center(
                              child: Image.asset('assets/images/shirt2.jpg'),
                            ),
                            color: Colors.white,
                          ),
                          Card(
                            child: Center(
                              child: Image.asset('assets/images/shirt3.jpg'),
                            ),
                            color: Colors.white,
                          ),
                          Card(
                            child: Center(
                              child: Image.asset('assets/images/backbag3.jpg'),
                            ),
                            color: Colors.white,
                          ),
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
                      content:
                          'off-white Sneaker Shoes for Teenagers with all sizes',
                      imagePath: 'assets/images/shoes1.jpg',
                    ),
                    ProductCard(
                      title: "Sneaker Shoes",
                      content:
                          'off-white Sneaker Shoes for Teenagers with all sizes',
                      imagePath: 'assets/images/shoes2.jpg',
                    ),
                    ProductCard(
                      title: "Black Bag",
                      content: 'A back bag for Students and Programmers',
                      imagePath: 'assets/images/shirt2.jpg',
                    ),
                    ProductCard(
                      title: "Sneaker Shoes",
                      content:
                          'Green Sneaker Shoes for Teenagers with all sizes',
                      imagePath: 'assets/images/shoes3.jpg',
                    ),
                    ProductCard(
                      title: "Sneaker Shoes",
                      content:
                          'Black Sneaker Shoes for Teenagers with all sizes',
                      imagePath: 'assets/images/shoes4.jpg',
                    ),
                    ProductCard(
                      title: "T-shirt Wide",
                      content: 'T-shirt Wide for Teenagers with all sizes',
                      imagePath: 'assets/images/shirt3.jpg',
                    ),
                    ProductCard(
                      title: "Sneaker Shoes",
                      content:
                          'off-white Sneaker Shoes for Teenagers with all sizes',
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
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final offer = _hotOffers[index];
                      return HotOfferItem(
                        desc: offer.desc,
                        imagePath: offer.imagePath,
                      );
                    },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
