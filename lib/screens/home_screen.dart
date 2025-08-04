import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/widgets/dotsindicator.dart';
import 'package:shopping/utils/constants.dart';

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
    tabController = TabController(length: 3, vsync: this);
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
            child:  Stack(
              children: [
                PageView(
                  controller: pageViewController,
                  onPageChanged: (index) {
                    _updateCurrentPageIndex(index);
                  },
                  children: [
                    Card(child: Center(child: Text('Page '))),
                    Card(child: Center(child: Text('Page '))),
                    Card(child: Center(child: Text('Page '))),
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

        ],
      ),
    );
  }
}
