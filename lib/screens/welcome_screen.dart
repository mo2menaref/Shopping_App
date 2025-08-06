import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping/widgets/custom_button.dart';
import 'package:shopping/widgets/dotsindicator.dart';
import 'package:shopping/utils/constants.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {


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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            onPageChanged: (index) {
              _updateCurrentPageIndex(index);
            },
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Image.asset(
                            'assets/images/woman_go_shopping_store_online.png',
                            width: 170,
                            height: 170,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 10),
                        Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmk4LGJrmReruOE2xqxJ8CJomp736As9GboA&s',
                          width: 170,
                          height: 170,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text('welcome',
                      style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.black,
                        fontSize: 30,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ).tr(),
                  ],
                ),
              ),
              Center( // Added Center widget for consistency
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/welcome.jpg',
                      width: 400,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 30),
                    Text(
                      tr('ready'),
                      style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.black,
                        fontSize: 20,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center( // Added Center widget for consistency
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopify_sharp, color: Colors.brown, size: 200),
                    SizedBox(height: 40),
                    ElevatedButton(
                      style: welcome_style,
                      onPressed: () {
                        Navigator.pushNamed(context, 'lock');
                      },
                      child: Text(tr('lets')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
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
    );
  }
}

