// To parse this JSON data, do
//
//     final homeSearch = homeSearchFromJson(jsonString);

import 'dart:convert';

List<HomeSearchModel> homeSearchFromJson(String str) => List<HomeSearchModel>.from(json.decode(str).map((x) => HomeSearchModel.fromJson(x)));

String homeSearchToJson(List<HomeSearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeSearchModel {
  HomeSearchModel({
    required this.productName,
    required this.id,
  });

  String productName;
  int id;

  factory HomeSearchModel.fromJson(Map<String, dynamic> json) => HomeSearchModel(
    productName: json["ProductName"],
    id: json["Id"],
  );

  Map<String, dynamic> toJson() => {
    "ProductName": productName,
    "Id": id,
  };
}