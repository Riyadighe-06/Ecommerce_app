import 'package:e_commerce_project/home_screen.dart';
import 'package:e_commerce_project/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRemember = false;
  bool isVisible = false;

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
                            const Text("Create New Account",
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
                                    controller: fullNameController,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(17.0),
                                        child: Image.asset(
                                          "assets/profile1.png",
                                          color: const Color(0xffff666F75),
                                        ),
                                      ),
                                      prefixIconColor: Colors.grey,
                                      filled: true,
                                      fillColor: const Color(0xffffF0F1F2),
                                      hintText: "Full Name",
                                      hintStyle: const TextStyle(
                                        color: Color(0xffff666F75),
                                      ),
                                      // labelText: "Full Name",
                                      // labelStyle: TextStyle(
                                      //   color: Color(0xffff666F75),
                                      // ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                            color: Color(0xFFFFD9D9D9),
                                            width: 1.0,
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFF009FBC),
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(0),
                                      // border: OutlineInputBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(25),
                                      // ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some name';
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
                                    keyboardType: TextInputType.number,
                                    controller: mobileNoController,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(17.0),
                                        child: Image.asset(
                                          "assets/call.png",
                                          color: const Color(0xffff666F75),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xffffF0F1F2),
                                      hintText: "Mobile No.",
                                      hintStyle: const TextStyle(
                                        color: Color(0xffff666F75),
                                      ),
                                      // labelText: "Mobile No.",
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
                                        return 'Please enter your number';
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
                                          color: const Color(0xffff666F75))),
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
                                    borderRadius: BorderRadius.circular(15.0),
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
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
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
                                const Text("I agree with terms and conditions")
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
                                      borderRadius: BorderRadius.circular(15)),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (Buildcontext) =>
                                          const HomeScreen()));
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have an account? ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (Buildcontext) =>
                                                  const LogInScreen()));
                                    },
                                    child: const Text(
                                      "Login",
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
