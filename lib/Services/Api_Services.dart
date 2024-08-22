import 'dart:convert';

import 'package:e_commerce_project/Models/CategoryList_Modal.dart';
import 'package:e_commerce_project/Models/GetProductList_Model.dart';
import 'package:e_commerce_project/Models/RemoveWishList_Model.dart';
import 'package:e_commerce_project/Models/Signup_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Models/AddWishList_Model.dart';
import '../Models/Banner_Model.dart';
import '../Models/CartList_Model.dart';
import '../Models/Login_Model.dart';
import '../Models/UserDetails_Model.dart';
import '../Models/WishList_Model.dart';

class ApiServices {
  static String baseUrl = "http://165.232.176.65:3300/";
  static String loginUrl = baseUrl + "user/login";

  static Future<LoginModel> login(
      {required String email, required String password}) async {
    var response = await http.post(
      Uri.parse(loginUrl),
      body: {
        "email": email,
        "password": password,
        "organizer_type": "true",
        "user_type": "false"
      },
    );
    print("body: ${response.body}");
    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        LoginModel loginModel = LoginModel.fromJson(data);
        return loginModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }

  static Future<SignUpModel> signup(
      {required String firstname,
      required String lastname,
      required String email,
      required String mobile,
      required String password,
      required String gender,
      required String dob,
      required String photo,
      required String address,
      required String city,
      required String state,
      required String postCode,
      required String registerDate,
      required String country,
      required String socialPlatform,
      required String verifiedDocument,
      required String id,
      required String createdAt,
      required String updatedAt,
      required int v}) async {
    var response = await http.post(
      Uri.parse('$baseUrl/user/create'),
      body: {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": mobile,
        "password": password,
        "gender": gender,
        "dob": dob,
        "photo": photo,
        "address": address,
        "city": city,
        "state": state,
        "postCode": postCode,
        "registerDate": null,
        "country": country,
        "socialPlatform": socialPlatform,
        "verifiedDocument": verifiedDocument,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      debugPrint(data.toString());
      print("api chal gai");
      return SignUpModel.fromJson(data);
    } else {
      print("api nahi chali");
      print(response.body);
      throw Exception(response.body);
    }
  }

  static Future<ListModel> productList({required token}) async {
    print("${token}");
    var url = baseUrl + "product/list";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    // Print the URL, headers, and body
    print("Request URL: $url");
    print("Request Headers: $headers");
    // If there is a request body, print it here
    // var requestBody = { 'key': 'value' }; // Example body
    // print("Request Body: ${json.encode(requestBody)}");

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      // body: json.encode(requestBody), // Uncomment if you have a body
    );

    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        ListModel productListModel = ListModel.fromJson(data);
        return productListModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }

  static Future<WishListModel> wishList({required token}) async {
    print("${token}");
    var url = baseUrl + "wishlist/list";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    // Print the URL, headers, and body
    print("Request URL: $url");
    print("Request Headers: $headers");
    // If there is a request body, print it here
    // var requestBody = { 'key': 'value' }; // Example body
    // print("Request Body: ${json.encode(requestBody)}");

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      // body: json.encode(requestBody), // Uncomment if you have a body
    );

    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        WishListModel wishListModel = WishListModel.fromJson(data);
        return wishListModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }

  static Future<AddWishListModel> addWishList(
      {required token, required productId}) async {
    print("${token}");
    var url = baseUrl + "wishlist/add-to-wishlist";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    // Print the URL, headers, and body
    print("Request URL: $url");
    print("Request Headers: $headers");
    // If there is a request body, print it here
    var requestBody = {'productId': '${productId}'}; // Example body
    // print("Request Body: ${json.encode(requestBody)}");

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(requestBody), // Uncomment if you have a body
    );

    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        AddWishListModel addWishListModel = AddWishListModel.fromJson(data);
        return addWishListModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }

  static Future<RemoveWishListModel> removeWishList(
      {required token, required wishlistId, required productId}) async {
    print("${token}");
    var url = baseUrl + "wishlist/remove";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    // Print the URL, headers, and body
    print("Request URL: $url");
    print("Request Headers: $headers");
    // If there is a request body, print it here
    var requestBody = {
      'productId': '${productId}',
      "wishlistId": wishlistId
    }; // Example body
    // print("Request Body: ${json.encode(requestBody)}");

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(requestBody), // Uncomment if you have a body
    );

    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        RemoveWishListModel removeWishListModel =
            RemoveWishListModel.fromJson(data);
        return removeWishListModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }

  static Future<CategoryListModel> categoryList({required token}) async {
    print("${token}");
    var url = baseUrl + "category/list";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    // Print the URL, headers, and body
    print("Request URL: $url");
    print("Request Headers: $headers");
    // If there is a request body, print it here
    // var requestBody = { 'key': 'value' }; // Example body
    // print("Request Body: ${json.encode(requestBody)}");

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      // body: json.encode(requestBody), // Uncomment if you have a body
    );

    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        CategoryListModel categoryListModel = CategoryListModel.fromJson(data);
        return categoryListModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }

  static Future<BannerListModel> bannerList({required token}) async {
    print("${token}");
    var url = baseUrl + "banner/list";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    // Print the URL, headers, and body
    print("Request URL: $url");
    print("Request Headers: $headers");
    // If there is a request body, print it here
    // var requestBody = { 'key': 'value' }; // Example body
    // print("Request Body: ${json.encode(requestBody)}");

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      // body: json.encode(requestBody), // Uncomment if you have a body
    );
    // var response = await http.post(
    //   Uri.parse(
    //     baseUrl + "product/get-product-list",
    //   ),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer $token',
    //   },
    // );

    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        BannerListModel bannerListModel = BannerListModel.fromJson(data);
        return bannerListModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }

  static Future<UserDetailsModel> userDetails({required token}) async {
    print("${token}");
    var url = baseUrl + "user/detail";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    // Print the URL, headers, and body
    print("Request URL: $url");
    print("Request Headers: $headers");
    // If there is a request body, print it here
    // var requestBody = { 'key': 'value' }; // Example body
    // print("Request Body: ${json.encode(requestBody)}");

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      // body: json.encode(requestBody), // Uncomment if you have a body
    );
    // var response = await http.post(
    //   Uri.parse(
    //     baseUrl + "product/get-product-list",
    //   ),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer $token',
    //   },
    // );

    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        UserDetailsModel userDetailsModel = UserDetailsModel.fromJson(data);
        return userDetailsModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }

  static Future<CartListModel> cartList({required token}) async {
    print("${token}");
    var url = baseUrl + "cart/view-cart";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    // Print the URL, headers, and body
    print("Request URL: $url");
    print("Request Headers: $headers");
    // If there is a request body, print it here
    // var requestBody = {'cartId': '${cartId}'}; // Example body
    // print("Request Body: ${json.encode(requestBody)}");

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      // body: json.encode(requestBody), // Uncomment if you have a body
    );

    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        debugPrint(data.toString());
        print("api chal gai");
        CartListModel cartListModel = CartListModel.fromJson(data);
        return cartListModel;
      } catch (e) {
        print("Error decoding response: $e");
        throw Exception("Failed to parse server response");
      }
    } else {
      print("nahi chali");
      throw Exception("Failed to log in. Status code: ${response.body}");
    }
  }
}
