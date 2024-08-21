import 'package:e_commerce_project/Models/Login_Model.dart';
import 'package:e_commerce_project/Services/Api_Services.dart';
import 'package:e_commerce_project/shared_preference/shared_pref.dart';
import 'package:e_commerce_project/View/LoginSignUp/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../HomeView/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRemember = false;
  bool isVisible = false;
  late LoginModel loginModel;

  void loginMethod() async {
    loginModel = await ApiServices.login(
        email: emailController.text, password: passwordController.text);
    if (loginModel.status == true) {
      Fluttertoast.showToast(msg: loginModel.message.toString());
      SharedPreferance.SetToken("${loginModel.data?.token}");
      SharedPreferance.SetIsLogin(true);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (Buildcontext) => const HomeScreen()),
          (route) => false);
    } else {
      Fluttertoast.showToast(msg: loginModel.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/Group 195.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        width: MediaQuery.of(context).size.width * 0.7,
                        // height: 180,
                        // width: 180,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        // height: 350,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200.withOpacity(
                                  0.5), // Shadow color with opacity
                              spreadRadius:
                                  5, // How much the shadow should spread
                              blurRadius: 5, // How soft the shadow should be
                              offset: const Offset(
                                  5, 5), // Offset in x and y direction
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Log In Your Account",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 23)),
                            const SizedBox(
                              height: 25,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(17.0),
                                        child: Image.asset(
                                          "assets/email.png",
                                          color: const Color(0xffff666F75),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xffffF0F1F2),
                                      hintText: "Email",
                                      hintStyle: const TextStyle(
                                        color: Color(0xffff666F75),
                                      ),
                                      // labelText: "Email",
                                      // labelStyle: TextStyle(
                                      //   color: Color(0xffff666F75),
                                      // ),
                                      contentPadding: const EdgeInsets.all(0),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFFD9D9D9),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFF009FBC),
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    obscureText: !isVisible,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVisible = !isVisible;
                                            });
                                          },
                                          icon: Icon(
                                              isVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color:
                                                  const Color(0xffff666F75))),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(17.0),
                                        child: Image.asset(
                                          "assets/lock.png",
                                          color: const Color(0xffff666F75),
                                        ),
                                      ),
                                      filled: true,
                                      contentPadding: const EdgeInsets.all(0),
                                      fillColor: const Color(0xffffF0F1F2),
                                      hintText: "Password",
                                      hintStyle: const TextStyle(
                                        color: Color(0xffff666F75),
                                      ),
                                      // labelText: "Password",
                                      // labelStyle: TextStyle(
                                      //   color: Color(0xffff666F75),
                                      // ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFFD9D9D9),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFF009FBC),
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  // activeColor: Color(0xffFF6600),
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return const Color(
                                          0xffFF6600); // The fill color when the checkbox is checked
                                    }
                                    return const Color(
                                        0xffffF0F1F2); // The fill color when the checkbox is not checked
                                  }),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Adjust the radius as needed
                                    side: const BorderSide(
                                        color: Color(0xffffD9D9D9),
                                        width: 1.0), // Border color and width
                                  ),

                                  value: isRemember,
                                  onChanged: (value) {
                                    isRemember = value!;
                                    setState(() {});
                                  },
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: const Text("Forgot Password?",
                                      style: TextStyle(
                                          decorationColor: Color(0xFFFF009FBC),
                                          fontSize: 15,
                                          color: Color(0xFFFF009FBC))),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffFF6600),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                  ),
                                  onPressed: () {
                                    if (emailController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "Please Enter your email");
                                    } else if (!emailController.text
                                        .isValidEmail()) {
                                      Fluttertoast.showToast(
                                          msg: "Please enter valid email");
                                    } else if (passwordController
                                        .text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "Please Enter your password");
                                    } else {
                                      loginMethod();
                                    }

                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (Buildcontext) =>
                                    //             const HomeScreen()));
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account? ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (Buildcontext) =>
                                                  const SignUpScreen()));
                                    },
                                    child: const Text(
                                      "SignUp",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(0xFFFF009FBC),
                                          fontSize: 15,
                                          color: Color(0xFFFF009FBC)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
