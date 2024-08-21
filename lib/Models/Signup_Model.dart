// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  bool? status;
  String? message;
  Data? data;

  SignUpModel({
    this.status,
    this.message,
    this.data,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
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
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? password;
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
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.password,
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
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        email: json["email"],
        password: json["password"],
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
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "email": email,
        "password": password,
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
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
