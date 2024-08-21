// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

WishListModel wishListModelFromJson(String str) =>
    WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
  bool? status;
  String? message;
  Data? data;

  WishListModel({
    this.status,
    this.message,
    this.data,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
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
  List<Wishlist>? wishlist;
  int? total;
  int? currentPage;
  int? totalPages;

  Data({
    this.wishlist,
    this.total,
    this.currentPage,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        wishlist: json["wishlist"] == null
            ? []
            : List<Wishlist>.from(
                json["wishlist"]!.map((x) => Wishlist.fromJson(x))),
        total: json["total"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "wishlist": wishlist == null
            ? []
            : List<dynamic>.from(wishlist!.map((x) => x.toJson())),
        "total": total,
        "currentPage": currentPage,
        "totalPages": totalPages,
      };
}

class Wishlist {
  String? id;
  String? userId;
  String? productId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  ProductDetails? productDetails;

  Wishlist({
    this.id,
    this.userId,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.productDetails,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        userId: json["userId"],
        productId: json["productId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        productDetails: json["productDetails"] == null
            ? null
            : ProductDetails.fromJson(json["productDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "productId": productId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "productDetails": productDetails?.toJson(),
      };
}

class ProductDetails {
  String? id;
  List<String>? categoryId;
  List<String>? subCategoryId;
  List<String>? childCategoryId;
  String? name;
  String? slug;
  String? description;
  String? unit;
  String? sku;
  List<String>? images;
  int? minimumQuantity;
  List<PriceRange>? priceRange;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductDetails({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.childCategoryId,
    this.name,
    this.slug,
    this.description,
    this.unit,
    this.sku,
    this.images,
    this.minimumQuantity,
    this.priceRange,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["_id"],
        categoryId: json["categoryId"] == null
            ? []
            : List<String>.from(json["categoryId"]!.map((x) => x)),
        subCategoryId: json["subCategoryId"] == null
            ? []
            : List<String>.from(json["subCategoryId"]!.map((x) => x)),
        childCategoryId: json["childCategoryId"] == null
            ? []
            : List<String>.from(json["childCategoryId"]!.map((x) => x)),
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        unit: json["unit"],
        sku: json["sku"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        minimumQuantity: json["minimumQuantity"],
        priceRange: json["priceRange"] == null
            ? []
            : List<PriceRange>.from(
                json["priceRange"]!.map((x) => PriceRange.fromJson(x))),
        status: json["status"],
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
        "categoryId": categoryId == null
            ? []
            : List<dynamic>.from(categoryId!.map((x) => x)),
        "subCategoryId": subCategoryId == null
            ? []
            : List<dynamic>.from(subCategoryId!.map((x) => x)),
        "childCategoryId": childCategoryId == null
            ? []
            : List<dynamic>.from(childCategoryId!.map((x) => x)),
        "name": name,
        "slug": slug,
        "description": description,
        "unit": unit,
        "sku": sku,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "minimumQuantity": minimumQuantity,
        "priceRange": priceRange == null
            ? []
            : List<dynamic>.from(priceRange!.map((x) => x.toJson())),
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class PriceRange {
  int? minQuantity;
  int? maxQuantity;
  int? price;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  PriceRange({
    this.minQuantity,
    this.maxQuantity,
    this.price,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        minQuantity: json["minQuantity"],
        maxQuantity: json["maxQuantity"],
        price: json["price"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "minQuantity": minQuantity,
        "maxQuantity": maxQuantity,
        "price": price,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
