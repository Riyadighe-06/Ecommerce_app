// To parse this JSON data, do
//
//     final removeWishListModel = removeWishListModelFromJson(jsonString);

import 'dart:convert';

RemoveWishListModel removeWishListModelFromJson(String str) =>
    RemoveWishListModel.fromJson(json.decode(str));

String removeWishListModelToJson(RemoveWishListModel data) =>
    json.encode(data.toJson());

class RemoveWishListModel {
  bool? status;
  String? message;
  dynamic data;

  RemoveWishListModel({
    this.status,
    this.message,
    this.data,
  });

  factory RemoveWishListModel.fromJson(Map<String, dynamic> json) =>
      RemoveWishListModel(
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
