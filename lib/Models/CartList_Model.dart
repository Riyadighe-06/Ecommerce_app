// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) =>
    CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  bool? status;
  String? message;
  List<Datum>? data;

  CartListModel({
    this.status,
    this.message,
    this.data,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? userId;
  List<Product>? products;
  String? paymentStatus;
  bool? isPurchased;
  int? totalAmount;
  int? productsCount;

  Datum({
    this.id,
    this.userId,
    this.products,
    this.paymentStatus,
    this.isPurchased,
    this.totalAmount,
    this.productsCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["userId"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        paymentStatus: json["paymentStatus"],
        isPurchased: json["isPurchased"],
        totalAmount: json["totalAmount"],
        productsCount: json["productsCount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "paymentStatus": paymentStatus,
        "isPurchased": isPurchased,
        "totalAmount": totalAmount,
        "productsCount": productsCount,
      };
}

class Product {
  String? productId;
  int? price;
  int? quantity;
  int? totalPrice;
  bool? isActive;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProductDetail? productDetail;

  Product({
    this.productId,
    this.price,
    this.quantity,
    this.totalPrice,
    this.isActive,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.productDetail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        price: json["price"],
        quantity: json["quantity"],
        totalPrice: json["totalPrice"],
        isActive: json["isActive"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        productDetail: json["productDetail"] == null
            ? null
            : ProductDetail.fromJson(json["productDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "price": price,
        "quantity": quantity,
        "totalPrice": totalPrice,
        "isActive": isActive,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "productDetail": productDetail?.toJson(),
      };
}

class ProductDetail {
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

  ProductDetail({
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

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
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
