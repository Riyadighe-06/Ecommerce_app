// To parse this JSON data, do
//
//     final addWishListModel = addWishListModelFromJson(jsonString);

import 'dart:convert';

AddWishListModel addWishListModelFromJson(String str) =>
    AddWishListModel.fromJson(json.decode(str));

String addWishListModelToJson(AddWishListModel data) =>
    json.encode(data.toJson());

class AddWishListModel {
  bool? status;
  String? message;
  dynamic data;

  AddWishListModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddWishListModel.fromJson(Map<String, dynamic> json) =>
      AddWishListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
