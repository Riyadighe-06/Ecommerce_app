// To parse this JSON data, do
//
//     final bannerListModel = bannerListModelFromJson(jsonString);

import 'dart:convert';

BannerListModel bannerListModelFromJson(String str) =>
    BannerListModel.fromJson(json.decode(str));

String bannerListModelToJson(BannerListModel data) =>
    json.encode(data.toJson());

class BannerListModel {
  bool? status;
  String? message;
  Data? data;

  BannerListModel({
    this.status,
    this.message,
    this.data,
  });

  factory BannerListModel.fromJson(Map<String, dynamic> json) =>
      BannerListModel(
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
  List<Bannerr>? banner;
  int? total;
  int? currentPage;
  int? totalPages;

  Data({
    this.banner,
    this.total,
    this.currentPage,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banner: json["banner"] == null
            ? []
            : List<Bannerr>.from(
                json["banner"]!.map((x) => Bannerr.fromJson(x))),
        total: json["total"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "banner": banner == null
            ? []
            : List<dynamic>.from(banner!.map((x) => x.toJson())),
        "total": total,
        "currentPage": currentPage,
        "totalPages": totalPages,
      };
}

class Bannerr {
  String? id;
  String? title;
  String? description;
  String? image;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Bannerr({
    this.id,
    this.title,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Bannerr.fromJson(Map<String, dynamic> json) => Bannerr(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
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
        "title": title,
        "description": description,
        "image": image,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
