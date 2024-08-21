// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);

import 'dart:convert';

ListModel listModelFromJson(String str) => ListModel.fromJson(json.decode(str));

String listModelToJson(ListModel data) => json.encode(data.toJson());

class ListModel {
  bool? status;
  String? message;
  Data? data;

  ListModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
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
  int? count;
  List<ListElement>? list;
  int? page;

  Data({
    this.count,
    this.list,
    this.page,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "page": page,
      };
}

class ListElement {
  String? id;
  String? name;
  String? description;
  List<String>? images;
  int? minimumQuantity;
  List<PriceRange>? priceRange;
  bool? isWishListed;

  ListElement({
    this.id,
    this.name,
    this.description,
    this.images,
    this.minimumQuantity,
    this.priceRange,
    this.isWishListed,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        minimumQuantity: json["minimumQuantity"],
        priceRange: json["priceRange"] == null
            ? []
            : List<PriceRange>.from(
                json["priceRange"]!.map((x) => PriceRange.fromJson(x))),
        isWishListed: json["isWishListed"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "minimumQuantity": minimumQuantity,
        "priceRange": priceRange == null
            ? []
            : List<dynamic>.from(priceRange!.map((x) => x.toJson())),
        "isWishListed": isWishListed,
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
