// To parse this JSON data, do
//
//     final couponListModel = couponListModelFromJson(jsonString);

import 'dart:convert';

CouponListModel couponListModelFromJson(String str) => CouponListModel.fromJson(json.decode(str));

String couponListModelToJson(CouponListModel data) => json.encode(data.toJson());

class CouponListModel {
  List<Result>? result;
  int? status;
  String? message;

  CouponListModel({
    this.result,
    this.status,
    this.message,
  });

  factory CouponListModel.fromJson(Map<String, dynamic> json) => CouponListModel(
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Result {
  int? id;
  String? couponCode;
  String? amount;
  String? name;
  num? minimumAmount;
  num? maximumAmount;

  Result({
    this.id,
    this.couponCode,
    this.amount,
    this.name,
    this.minimumAmount,
    this.maximumAmount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    couponCode: json["CouponCode"],
    amount: json["Amount"],
    name: json["Name"],
    minimumAmount: json["MinimumAmount"],
    maximumAmount: json["MaximumAmount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "CouponCode": couponCode,
    "Amount": amount,
    "Name": name,
    "MinimumAmount": minimumAmount,
    "MaximumAmount": maximumAmount,
  };
}
