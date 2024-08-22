import 'package:e_commerce_project/Models/Login_Model.dart';
import 'package:e_commerce_project/Models/UserDetails_Model.dart';
import 'package:e_commerce_project/Services/Api_Services.dart';
import 'package:e_commerce_project/shared_preference/shared_pref.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    UserDetailsMethod();
    super.initState();
  }

  late LoginModel loginModel;
  late UserDetailsModel userDetailsModel;
  String image = "";
  String name = "";
  String email = "";

  void UserDetailsMethod() async {
    String? token = await SharedPreferance.GetToken();
    print("loginModel ${token}");
    if (token != null) {
      userDetailsModel = await ApiServices.userDetails(token: token);
      if (userDetailsModel.status == true) {
        name =
            "${userDetailsModel.data?.firstName} ${userDetailsModel.data?.lastName}";
        email = "${userDetailsModel.data?.email}";
        image = "${userDetailsModel.data?.photo}";
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
                            "Profile",
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
          SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      image,
                      // "assets/profileimage.png",
                      scale: 3,
                    ),
                    Text(
                      name,
                      // "Riya Dighe",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      email,
                      // "riyadighe617@gmail.com",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.person_2_outlined),
                      title: Text("Edit Profile",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xfff2A485F),
                        size: 18,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text("Shopping Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xfff2A485F),
                        size: 18,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.favorite_border),
                      title: Text("Wishlist",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xfff2A485F),
                        size: 18,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.shopping_bag_outlined),
                      title: Text("Order History",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xfff2A485F),
                        size: 18,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.notifications_none),
                      title: Text("Notifications",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xfff2A485F),
                        size: 18,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.credit_card_outlined),
                      title: Text("Cards",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xfff2A485F),
                        size: 18,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
