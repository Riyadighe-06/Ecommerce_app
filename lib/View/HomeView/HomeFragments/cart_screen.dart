import 'package:e_commerce_project/Models/CartList_Model.dart';
import 'package:e_commerce_project/Models/Login_Model.dart';
import 'package:e_commerce_project/Services/Api_Services.dart';
import 'package:e_commerce_project/shared_preference/shared_pref.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    cartListModelMethod();
  }

  late LoginModel loginModel;
  late CartListModel cartListModel;
  late List<Product> cartList = [];

  void cartListModelMethod() async {
    String? token = await SharedPreferance.GetToken();
    // Future<String?> token = SharedPreferance.GetToken();
    print("loginModel ${token}");
    if (token != null) {
      cartListModel = await ApiServices.cartList(token: token);
      if (cartListModel.status == true) {
        for (var i = 0; i < cartListModel.data![0].products!.length; i++) {
          cartList.add(cartListModel.data![0].products![i]);
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
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
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
                            "Cart",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 25),
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
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              // color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Image.asset(
                                                "assets/laptop.png"),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 26,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Qty:"),
                                            Icon(
                                              Icons.add,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              "Apple iPhone 15 pro 128GB Natural Gold"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text("Hello"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/star.png",
                                            height: 14,
                                            width: 16,
                                          ),
                                          Image.asset(
                                            "assets/star.png",
                                            height: 14,
                                            width: 16,
                                          ),
                                          Image.asset(
                                            "assets/star.png",
                                            height: 14,
                                            width: 16,
                                          ),
                                          Icon(
                                            Icons.star_border_outlined,
                                            size: 19,
                                          ),
                                          Icon(
                                            Icons.star_border_outlined,
                                            size: 19,
                                          ),
                                          Text(
                                            " 3.0",
                                            style: TextStyle(
                                                color: Color(0xffFF6600)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "45%",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xffFF6600),
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "  \$2000",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  Color(0xffff666F75),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Color(0xffff666F75),
                                            ),
                                          ),
                                          Text(
                                            "  \$1500",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18),
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "1 coupon & 1 offer applied",
                                            style: TextStyle(
                                                color: Color(0xffFF6600)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Express ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  Text("Delivery in 2 days")
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, int index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Price Details",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Price"), Text("\$2,999")],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Discount"),
                            Text(
                              "-\$5",
                              style: TextStyle(color: Color(0xffFF6600)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text("Coupon for you"),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Charges"),
                            Text(
                              "Free Delivery",
                              style: TextStyle(color: Color(0xffFF6600)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "  \$2000",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Color(0xffff666F75),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Color(0xffff666F75),
                            ),
                          ),
                          Text(
                            "\$1500",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Color(0xffFF6600),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 8, bottom: 8, top: 13),
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
