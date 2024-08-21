import 'package:e_commerce_project/View/HomeView/HomeFragments/cart_screen.dart';
import 'package:e_commerce_project/View/HomeView/HomeFragments/favourite_screen.dart';
import 'package:e_commerce_project/View/HomeView/HomeFragments/home.dart';
import 'package:e_commerce_project/View/HomeView/HomeFragments/profile_screen.dart';
import 'package:e_commerce_project/View/ProductDetail/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var currentIndex = 0;

  final List<String> imagePaths = [
    "assets/iphone22.png",
    "assets/pants.png",
    "assets/iphone1.jpg",
    "assets/iphone1.jpg",
    "assets/iphone1.jpg",
    "assets/iphone1.jpg",
  ];

  final List<String> listImage = [
    "assets/fashion.png",
    "assets/phone.png",
    "assets/laptop.png",
    "assets/remote.png",
    "assets/remote.png",
    "assets/laptop.png",
    "assets/laptop.png"
  ];

  final List<String> sliderImage = [
    "assets/Mask _group.png",
    "assets/Mask _group.png",
    "assets/Mask _group.png"
  ];
  final List<String> title = [
    "Fashion",
    "Mobile",
    "Laptop",
    "Consoles",
    "Consoles",
    "Laptop",
    "Laptop",
  ];
  final List<Widget> _pages = [
    Home(),
    FavouriteScreen(),
    CartScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffF0F1F2),
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ],
          // borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: ListView.builder(
              itemCount: listOfIcons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: index == currentIndex
                          ? null
                          : MediaQuery.of(context).size.width / 7,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: index == currentIndex
                              ? const Color(0xffF0F1F2)
                              : null),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == currentIndex
                                    ? const Color(0xffFF6600)
                                    : null),
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(
                              listOfIcons[index],
                              width: 20,
                              height: 20,
                              color: index == currentIndex
                                  ? Colors.white
                                  : const Color(0xff666F75),
                            ),
                            // Icon(
                            //   '${listOfIcons[index]}',
                            //   size: 20,
                            //   color: index == currentIndex
                            //       ? Colors.white
                            //       : Color(0xff666F75),
                            // ),
                          ),
                          if (index == currentIndex)
                            const SizedBox(
                              width: 5,
                            ),
                          if (index == currentIndex)
                            Text(
                              index == currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                          if (index == currentIndex)
                            const SizedBox(
                              width: 5,
                            ),
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

  List<String> listOfStrings = [
    'Home',
    'Favorite',
    'Category',
    'Cart',
    'Profile'
  ];
  List<String> listOfIcons = [
    "assets/home.png",
    "assets/fav.png",
    "assets/category.png",
    "assets/cart.png",
    "assets/profile11.png",
  ];
}
