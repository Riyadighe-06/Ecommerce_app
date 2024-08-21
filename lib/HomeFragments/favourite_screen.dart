import 'package:e_commerce_project/Models/WishList_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Models/GetProductList_Model.dart';
import '../Models/Login_Model.dart';
import '../Services/Api_Services.dart';
import '../db_helper.dart';
import '../item_details.dart';
import '../shared_preference/shared_pref.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var currentIndex = 0;
  bool isFavorite = false;
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;

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
    wishListModelMethod();
    _refreshData();
  }

  Future<void> _addData() async {
    await SQLHelper.createData(imagePaths.toString());
    _refreshData();
    print("Data Added");
  }

  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, imagePaths.toString());
    _refreshData();
  }

  Future _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text("Data Deleted"),
    ));
    _refreshData();
  }

  final List<String> imagePaths = [
    "assets/iphone22.png",
    "assets/pants.png",
    "assets/iphone22.png",
    "assets/pants.png",
    "assets/iphone22.png",
    "assets/pants.png",
  ];

  List<String> listOfStrings = [
    'Home',
    'Favourite',
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

  late WishListModel wishListModel;
  late LoginModel loginModel;
  late List<Wishlist> wishlist = [];
  late List<ListElement> list = [];

  void wishListModelMethod() async {
    String? token = await SharedPreferance.GetToken();
    // Future<String?> token = SharedPreferance.GetToken();
    print("loginModel ${token}");
    if (token != null) {
      wishListModel = await ApiServices.wishList(token: token);
      if (wishListModel.status == true) {
        for (var i = 0; i < wishListModel.data!.wishlist!.length; i++) {
          wishlist.add(wishListModel.data!.wishlist![i]);
        }
      }
      setState(() {});
    } else {
      print("Token is null");
      // Handle the case when token is null
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        padding: const EdgeInsets.all(9),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            "assets/back.png",
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
                          Text(
                            "Favourite",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 30),
                          ),
                          // Image.asset(
                          //   "assets/logo.png",
                          //   width: MediaQuery.of(context).size.width * 0.5,
                          //   // height: 180,
                          //   // width: 180,
                          // ),
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
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext) => const ItemDetails()));
                  },
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: wishlist.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisExtent: 350,
                            mainAxisSpacing: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      Wishlist dataWishListElements = wishlist[index];
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
                                    color: Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200.withOpacity(
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
                                      image: NetworkImage(dataWishListElements
                                              .productDetails?.images?.first ??
                                          ""),
                                      // AssetImage(imagePaths[
                                      //     index]), // Specify the image asset here
                                      // fit: BoxFit
                                      //     .cover, // This adjusts how the image fits within the Container
                                    ),
                                    borderRadius: BorderRadius.circular(20),
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
                                  child: InkWell(
                                    onTap: () async {
                                      // Show confirmation dialog before making the API call
                                      bool? confirm = await showDialog<bool>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            // title: Text('Remove from Wishlist'),
                                            content: Text(
                                              'Are you sure you want to remove this item from your wishlist?',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(
                                                      false); // User pressed Cancel
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(
                                                      true); // User pressed Confirm
                                                },
                                                child: Text('Confirm',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFF6600),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (confirm == true) {
                                        // User confirmed the action
                                        String token =
                                            await SharedPreferance.GetToken() ??
                                                ""; // Get the token
                                        String productId = wishlist[index].id ??
                                            ""; // Assuming each product has an ID

                                        // Call remove wishlist API
                                        await ApiServices.removeWishList(
                                          token: token,
                                          wishlistId: wishlist[index]
                                              .id, // Assuming you have a wishlistId
                                          productId: productId,
                                        );
                                        wishlist.removeAt(index);
                                      }
                                      // String token =
                                      //     await SharedPreferance.GetToken() ??
                                      //         ""; // Get the token
                                      // String productId = wishlist[index].id ??
                                      //     ""; // Assuming each product has an ID
                                      //
                                      // // Call remove wishlist API
                                      // await ApiServices.removeWishList(
                                      //   token: token,
                                      //   wishlistId: wishlist[index]
                                      //       .id, // Assuming you have a wishlistId
                                      //   productId: productId,
                                      // );
                                      // wishlist.removeAt(index);
                                      setState(() {});
                                    },
                                    child: Container(
                                      // height: 10,
                                      // width: 10,
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 2.0),
                                          // color: Colors.grey.shade100
                                          color: Colors.white),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        // Icons.favorite_border,
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
                              "${dataWishListElements.productDetails?.name}",
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
                                  "${dataWishListElements.productDetails?.priceRange?.last?.price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "${dataWishListElements.productDetails?.priceRange?.first?.price}",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Color(0xffff666F75),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
