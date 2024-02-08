// To parse this JSON data, do
//
//     final homeBannerModel = homeBannerModelFromJson(jsonString);

import 'dart:convert';

HomeBannerModel homeBannerModelFromJson(String str) => HomeBannerModel.fromJson(json.decode(str));

String homeBannerModelToJson(HomeBannerModel data) => json.encode(data.toJson());

class HomeBannerModel {
  List<Banner> banner;
  String message;
  int status;

  HomeBannerModel({
    required this.banner,
    required this.message,
    required this.status,
  });

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) => HomeBannerModel(
    banner: List<Banner>.from(json["Banner"].map((x) => Banner.fromJson(x))),
    message: json["Message"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Banner": List<dynamic>.from(banner.map((x) => x.toJson())),
    "Message": message,
    "Status": status,
  };
}

class Banner {
  int id;
  String bannerPath;
  dynamic url;
  bool isActive;
  dynamic sortOrder;

  Banner({
    required this.id,
    required this.bannerPath,
    this.url,
    required this.isActive,
    this.sortOrder,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["Id"],
    bannerPath: json["BannerPath"],
    url: json["Url"],
    isActive: json["IsActive"],
    sortOrder: json["SortOrder"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "BannerPath": bannerPath,
    "Url": url,
    "IsActive": isActive,
    "SortOrder": sortOrder,
  };
}
