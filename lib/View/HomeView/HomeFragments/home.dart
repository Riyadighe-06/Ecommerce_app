import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/Models/Banner_Model.dart';
import 'package:e_commerce_project/Models/CategoryList_Modal.dart';
import 'package:e_commerce_project/Models/GetProductList_Model.dart';
import 'package:e_commerce_project/Models/Login_Model.dart';
import 'package:e_commerce_project/Services/Api_Services.dart';
import 'package:e_commerce_project/DataBaseHelper/db_helper.dart';
import 'package:e_commerce_project/View/ProductDetail/item_details.dart';
import 'package:e_commerce_project/shared_preference/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bool isFavorite = false;

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
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;
  int? id;

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    BannerListModelMethod();
    CategoryListModelMethod();
    ListModelMethod();
    _refreshData();
  }

  Future<void> _addData() async {
    await SQLHelper.createData(imagePaths.toString());
    _refreshData();
    print("Item Added");
  }

  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, imagePaths.toString());
    _refreshData();
  }

  Future _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text("Item Remove"),
    ));
    _refreshData();
  }

  late ListModel listModel;
  late LoginModel loginModel;
  late List<ListElement> list = [];
  late CategoryListModel categoryListModel;
  late List<Category> categoryList = [];
  late BannerListModel bannerListModel;
  late List<Bannerr> bannerList = [];
  bool isLoadingBanner = false;
  void ListModelMethod() async {
    String? token = await SharedPreferance.GetToken();
    // Future<String?> token = SharedPreferance.GetToken();
    print("loginModel ${token}");
    if (token != null) {
      listModel = await ApiServices.productList(token: token);
      if (listModel.status == true) {
        for (var i = 0; i < listModel.data!.list!.length; i++) {
          list.add(listModel.data!.list![i]);
        }
      }
      setState(() {});
    } else {
      print("Token is null");
      // Handle the case when token is null
    }
  }

  void CategoryListModelMethod() async {
    String? token = await SharedPreferance.GetToken();
    // Future<String?> token = SharedPreferance.GetToken();
    print("loginModel ${token}");
    if (token != null) {
      categoryListModel = await ApiServices.categoryList(token: token);
      if (categoryListModel.status == true) {
        for (var i = 0; i < categoryListModel.data!.category!.length; i++) {
          categoryList.add(categoryListModel.data!.category![i]);
        }
      }
      setState(() {});
    } else {
      print("Token is null");
      // Handle the case when token is null
    }
  }

  void BannerListModelMethod() async {
    setState(() {
      isLoadingBanner = true;
    });
    String? token = await SharedPreferance.GetToken();
    // Future<String?> token = SharedPreferance.GetToken();
    print("loginModel ${token}");
    if (token != null) {
      bannerListModel = await ApiServices.bannerList(token: token);
      if (bannerListModel.status == true) {
        for (var i = 0; i < bannerListModel.data!.banner!.length; i++) {
          bannerList.add(bannerListModel.data!.banner![i]);
        }
      }
    } else {
      print("Token is null");
      // Handle the case when token is null
    }
    setState(() {
      isLoadingBanner = false;
    });
  }

  void showTopSnackBar(
    context,
    String message, {
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 130,
          left: 10,
          right: 10),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  isLoadingBanner
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Stack(
                          children: [
                            CarouselSlider.builder(
                              itemCount: bannerList.length,
                              itemBuilder:
                                  (BuildContext context, int index, int a) {
                                Bannerr dataBannerListElements =
                                    bannerList[index];
                                return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        image: dataBannerListElements.image !=
                                                    null &&
                                                dataBannerListElements
                                                    .image!.isNotEmpty
                                            ? NetworkImage(dataBannerListElements
                                                .image!) // Show only the first image
                                            : AssetImage(
                                                    'assets/placeholder.png') // Use a local placeholder image
                                                as ImageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                    // Image.asset(
                                    //   sliderImage[index],
                                    //   fit: BoxFit.fill,
                                    // ),
                                    );
                              },
                              options: CarouselOptions(
                                height: 100,
                                enlargeCenterPage: true,
                                autoPlay: true,
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
                                count: bannerList.length,
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
                    height: 5,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge
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
                                        icon: const Icon(
                                            Icons.arrow_forward_ios,
                                            weight: 15,
                                            size: 12)),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 0,
                              // ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: SizedBox(
                                height: 120,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categoryList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Category dataCategoryListElements =
                                          categoryList[index];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                    child: Image(
                                                        image: dataCategoryListElements
                                                                        .image !=
                                                                    null &&
                                                                dataCategoryListElements
                                                                    .image!
                                                                    .isNotEmpty
                                                            ? NetworkImage(
                                                                dataCategoryListElements
                                                                    .image!) // Show only the first image
                                                            : AssetImage(
                                                                    'assets/placeholder.png')
                                                                as ImageProvider,
                                                        height: 100,
                                                        width:
                                                            100 // Use a local placeholder image
                                                        )
                                                    // Image.asset(
                                                    //     listImage[index],
                                                    //     height: 100,
                                                    //     width: 100),
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              dataCategoryListElements.title ??
                                                  "",
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
                                  itemCount: list.length,
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 30.0,
                                          mainAxisExtent: 266,
                                          mainAxisSpacing: 30.0),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    ListElement dataListElements = list[index];
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Container(
                                                // color: Colors.grey.shade200,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors
                                                          .grey.shade200
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
                                                    image: dataListElements
                                                                    .images !=
                                                                null &&
                                                            dataListElements
                                                                .images!
                                                                .isNotEmpty
                                                        ? NetworkImage(
                                                            dataListElements
                                                                .images!
                                                                .take(4)
                                                                .first) // Show only the first image
                                                        : AssetImage(
                                                                'assets/placeholder.png')
                                                            as ImageProvider, // Use a local placeholder image
                                                    onError: (exception,
                                                        stackTrace) {
                                                      print(
                                                          "Failed to load image: $exception");
                                                    },
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                height: 200,
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
                                                child: InkWell(
                                                  onTap: () async {
                                                    String token =
                                                        await SharedPreferance
                                                                .GetToken() ??
                                                            ""; // Get the token
                                                    String productId = list[
                                                                index]
                                                            .id ??
                                                        ""; // Assuming each product has an ID
                                                    if (list[index]
                                                            .isWishListed ==
                                                        true) {
                                                      // Call remove wishlist API
                                                      await ApiServices
                                                          .removeWishList(
                                                        token: token,
                                                        wishlistId: list[index]
                                                            .id, // Assuming you have a wishlistId
                                                        productId: productId,
                                                      );
                                                      list[index].isWishListed =
                                                          false;
                                                      showTopSnackBar(context,
                                                          "Item removed from wishlist");
                                                    } else {
                                                      // Call add wishlist API
                                                      await ApiServices
                                                          .addWishList(
                                                        token: token,
                                                        productId: productId,
                                                      );
                                                      list[index].isWishListed =
                                                          true;
                                                      showTopSnackBar(context,
                                                          "Item added to wishlist");
                                                    }
                                                    /*if (list[index]
                                                            .isWishListed ==
                                                        true) {
                                                      //removewishlist api call hogi
                                                      list[index].isWishListed =
                                                          false;
                                                    } else {
                                                      //addwishlist api call hogi
                                                      list[index].isWishListed =
                                                          true;
                                                    }*/
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    // height: 10,
                                                    // width: 10,
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 2.0),
                                                        // color: Colors.grey.shade100
                                                        color: Colors.white),
                                                    child: Icon(
                                                      list[index].isWishListed ==
                                                              true
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color: list[index]
                                                                  .isWishListed ==
                                                              true
                                                          ? Colors.red
                                                          : Colors.black,
                                                      // Icons.favorite_border
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${dataListElements.name}",
                                            style: TextStyle(),
                                            maxLines: 2,
                                            // style:
                                            //   Theme.of(context).textTheme.headlineMedium,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${dataListElements.priceRange?.last?.price}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                                maxLines: 2,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "${dataListElements.priceRange?.first.price}",
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor:
                                                      Color(0xffff666F75),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: Color(0xffff666F75),
                                                ),
                                              ),
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
          ),
        ],
      ),
    );
  }
}
