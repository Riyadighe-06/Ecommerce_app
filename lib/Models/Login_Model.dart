// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? token;
  UserDetail? userDetail;

  Data({
    this.token,
    this.userDetail,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        userDetail: json["userDetail"] == null
            ? null
            : UserDetail.fromJson(json["userDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "userDetail": userDetail?.toJson(),
      };
}

class UserDetail {
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? mobile;
  DateTime? dob;
  String? photo;
  String? address;
  String? city;
  String? state;
  String? postCode;
  dynamic registerDate;
  String? country;
  String? socialPlatform;
  List<VerifiedDocument>? verifiedDocument;

  UserDetail({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.mobile,
    this.dob,
    this.photo,
    this.address,
    this.city,
    this.state,
    this.postCode,
    this.registerDate,
    this.country,
    this.socialPlatform,
    this.verifiedDocument,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        email: json["email"],
        mobile: json["mobile"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        photo: json["photo"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        postCode: json["postCode"],
        registerDate: json["registerDate"],
        country: json["country"],
        socialPlatform: json["socialPlatform"],
        verifiedDocument: json["verifiedDocument"] == null
            ? []
            : List<VerifiedDocument>.from(json["verifiedDocument"]!
                .map((x) => VerifiedDocument.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "email": email,
        "mobile": mobile,
        "dob": dob?.toIso8601String(),
        "photo": photo,
        "address": address,
        "city": city,
        "state": state,
        "postCode": postCode,
        "registerDate": registerDate,
        "country": country,
        "socialPlatform": socialPlatform,
        "verifiedDocument": verifiedDocument == null
            ? []
            : List<dynamic>.from(verifiedDocument!.map((x) => x.toJson())),
      };
}

class VerifiedDocument {
  String? documentType;
  String? documentImage;
  String? id;

  VerifiedDocument({
    this.documentType,
    this.documentImage,
    this.id,
  });

  factory VerifiedDocument.fromJson(Map<String, dynamic> json) =>
      VerifiedDocument(
        documentType: json["documentType"],
        documentImage: json["documentImage"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "documentImage": documentImage,
        "_id": id,
      };
}
