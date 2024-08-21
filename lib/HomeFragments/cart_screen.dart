import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                    height: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      // color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset("assets/laptop.png"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Laptop",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("200",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 5,
                                right: 5,
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: Colors.black,
                                        )),
                                    Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.remove,
                                              )),
                                          Text(
                                            "1",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.add)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        );
                      },
                      separatorBuilder: (context, int index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: 2,
                      shrinkWrap: true,
                    )),
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Promo Code",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            suffixIcon: TextButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFF6600)),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Sub Total:",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            "",
                            // "Rs.${getCartToal().toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Total:",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            "",
                            // "Rs.${getCartToal().toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xffFF6600),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xffFF6600)),
                            ),
                            child: const Text(
                              "Confirm Order",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
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
