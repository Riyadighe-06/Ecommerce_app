import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/item_details.dart';
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
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffF0F1F2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                    colors: [
                      const Color(0xff009FBC).withOpacity(0.20),
                      const Color(0xffFF6600).withOpacity(0.20),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            // color: Color(0xFFC3E703),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/options.png",
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/logo.png",
                              width: MediaQuery.of(context).size.width * 0.5,
                              // height: 180,
                              // width: 180,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                // color: Colors.grey.shade200
                              ),
                              child: Image.asset(
                                "assets/bell.png",
                                height: 15,
                                width: 15,
                              ),
                              // IconButton(
                              //     onPressed: () {},
                              //     icon: const Icon(
                              //       Icons.notifications_none,
                              //       size: 22,
                              //     )),
                            ),
                            Positioned(
                              right: 12,
                              top: 3,
                              child: Container(
                                // height: 10,
                                // width: 10,
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    // border: Border.all(
                                    //     color: Colors.white, width: 2.0),
                                    color: Color(0xffFF6600)),
                                child: const Text(""),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      // Adjust padding as needed
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade100,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 0, right: 0, top: 5, bottom: 5),
                                // Remove internal padding
                                border: InputBorder.none,
                                // Remove default border
                                hintText: "Search the entire shop",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: sliderImage.length,
                  itemBuilder: (BuildContext context, int index, int a) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        sliderImage[index],
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 100,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    aspectRatio: 10 / 5,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  left: 160,
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const SwapEffect(
                        radius: 10,
                        activeDotColor: Color(0xffFF6600),
                        dotColor: Colors.white,
                        dotWidth: 6,
                        dotHeight: 6,
                        spacing: 6),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Categories",
                                style: Theme.of(context).textTheme.headlineLarge
                                // TextStyle(
                                //   fontFamily: "sfprodisplay",
                                //   fontWeight: FontWeight.bold,
                                //   fontSize: 23,
                                // )
                                ),
                            const Spacer(),
                            const Text("See all",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Color(0xffff666F75),
                                )
                                // Theme.of(context).textTheme.headlineMedium
                                // TextStyle(color: Colors.grey)
                                ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward_ios,
                                      weight: 15, size: 12)),
                            ),
                          ],
                        ),
                        // const SizedBox(
                        //   height: 0,
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: SizedBox(
                          height: 120,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listImage.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Center(
                                            child: Image.asset(listImage[index],
                                                height: 100, width: 100),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        title[index],
                                        // "IPhone",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                        // TextStyle(
                                        //   fontFamily: "sfprodisplay",
                                        //   fontWeight: FontWeight.normal,
                                        //   fontSize: 15,
                                        // ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "You May Like",
                              style: TextStyle(
                                fontFamily: "sfprodisplay",
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (Buildcontext) =>
                                    const ItemDetails()));
                          },
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: imagePaths.length,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisExtent: 280,
                                    mainAxisSpacing: 10.0),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Container(
                                          // color: Colors.grey.shade200,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade200
                                                    .withOpacity(
                                                        0.5), // Shadow color with opacity
                                                spreadRadius:
                                                    5, // How much the shadow should spread
                                                blurRadius:
                                                    5, // How soft the shadow should be
                                                offset: const Offset(5,
                                                    5), // Offset in x and y direction
                                              ),
                                            ],
                                            image: DecorationImage(
                                              image: AssetImage(imagePaths[
                                                  index]), // Specify the image asset here
                                              fit: BoxFit
                                                  .cover, // This adjusts how the image fits within the Container
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: 180,
                                          width: 200,
                                          // child: Image.asset(
                                          //   imagePaths[index],
                                          //   height: 200,
                                          //   width: 200,
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ),
                                        Positioned(
                                          right: 10,
                                          top: 10,
                                          child: Container(
                                            // height: 10,
                                            // width: 10,
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                // color: Colors.grey.shade100
                                                color: Colors.white),
                                            child: const Icon(
                                                Icons.favorite_border),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Apple iPhone 15 Pro 126GB Natural Titanium",
                                      style: TextStyle(),
                                      maxLines: 2,

                                      // style:
                                      //   Theme.of(context).textTheme.headlineMedium,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "\$6699.00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "80000",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                Color(0xffff666F75),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Color(0xffff666F75),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ]),
              ),
            ]),
          ],
        ),
      ),
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
      /*bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Color(0xFFC3E703)),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
      ),*/
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
