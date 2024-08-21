// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  bool? status;
  String? message;
  Data? data;

  UserDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
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
  String? gender;
  String? id;
  String? firstName;
  String? lastName;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.gender,
    this.id,
    this.firstName,
    this.lastName,
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
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gender: json["gender"],
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class VerifiedDocument {
  String? documentType;
  String? documentImage;
  String? documentId;
  String? id;

  VerifiedDocument({
    this.documentType,
    this.documentImage,
    this.documentId,
    this.id,
  });

  factory VerifiedDocument.fromJson(Map<String, dynamic> json) =>
      VerifiedDocument(
        documentType: json["documentType"],
        documentImage: json["documentImage"],
        documentId: json["documentId"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "documentImage": documentImage,
        "documentId": documentId,
        "_id": id,
      };
}
