// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) =>
    CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) =>
    json.encode(data.toJson());

class CategoryListModel {
  bool? status;
  String? message;
  Data? data;

  CategoryListModel({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
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
  List<Category>? category;
  int? total;
  int? currentPage;
  int? totalPages;

  Data({
    this.category,
    this.total,
    this.currentPage,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: json["category"] == null
            ? []
            : List<Category>.from(
                json["category"]!.map((x) => Category.fromJson(x))),
        total: json["total"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null
            ? []
            : List<dynamic>.from(category!.map((x) => x.toJson())),
        "total": total,
        "currentPage": currentPage,
        "totalPages": totalPages,
      };
}

class Category {
  String? id;
  String? title;
  String? image;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Category({
    this.id,
    this.title,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "image": image,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
