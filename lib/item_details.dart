import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final List<String> imageSlider = [
    "assets/item_details.png",
    "assets/item_details.png",
    "assets/item_details.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: imageSlider.length,
                  itemBuilder: (BuildContext context, int index, int a) {
                    return Image.asset(imageSlider[index],
                        // height: 405,
                        // width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover);
                  },
                  options: CarouselOptions(
                    height: (MediaQuery.of(context).size.height / 2)-50,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.white),
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5, top: 0),
                                child:
                                // Image.asset(
                                //   "assets/arrow.png",
                                //   // height: 20,
                                //   // width: 20,
                                // )
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: 22,
                                    )),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.white),
                                  padding: const EdgeInsets.all(2),
                                  child: Image.asset(
                                    "assets/red_fav.png",
                                    height: 60,
                                    width: 60,
                                  )
                                // IconButton(
                                //     onPressed: () {},
                                //     icon: const Icon(
                                //       Icons.favorite,
                                //       color: Colors.white,
                                //       size: 30,
                                //     )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 20,
                  child: Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/image.png",
                          height: 12,
                          width: 15,
                        ),
                        const Text("5/6",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          top: (MediaQuery.of(context).size.height / 2)-80,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
            ),
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Apple iPhone 15 Pro 126GB Natural Titanium',
                    // style: Theme.of(context).textTheme.headlineLarge,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    // height: 125,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffffF0F1F2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "\$6699.00 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              Text(
                                "\$80000",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Color(0xffff666F75),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xffff666F75),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "EMI starts at \$14000",
                            style: TextStyle(color: Color(0xffff666F75)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Free Delivery ",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Tuesday, 12 August",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/location.png",
                                height: 17,
                                width: 16,
                              ),
                              const Text(
                                " Deliver to Indore,India ",
                                style: TextStyle(fontSize: 14),
                              ),
                              Image.asset(
                                "assets/edit.png",
                                height: 11,
                                width: 11,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                            height: 40,
                            // width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey.shade100,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/star.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                  const Text(" 4.8 ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  const Text(" 117 Reviews",
                                      style: TextStyle(
                                          color: Color(0xffFF6600))),
                                ],
                              ),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey.shade100,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/like.png",
                                    height: 16,
                                    width: 17,
                                  ),
                                  const Text("94%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ],
                              ),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey.shade100,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/ques_mark.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                  const Text("8",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "About this item",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "* Processor: Powerful MediaTek Dimensity 6100+ 5G SoC | 8GB of RAM including"
                        " 4GB virtual | 6.74 HD+ 90Hz display with Corning Gorilla Glass 3 Protection | 50MP AI"
                        "Dual camera |Fast Side fingerprint | 5000mAh Battery",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    "* 6.74 HD+ 90Hz display with Corning Gorilla Glass 3 Protection, 600nits in High Brightness mode",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFF6600),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ),
        ),
      ]),
    );
  }
}
