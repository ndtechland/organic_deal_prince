// To parse this JSON data, do
//
//     final getWalletAmountModel = getWalletAmountModelFromJson(jsonString);

import 'dart:convert';

GetWalletAmountModel getWalletAmountModelFromJson(String str) => GetWalletAmountModel.fromJson(json.decode(str));

String getWalletAmountModelToJson(GetWalletAmountModel data) => json.encode(data.toJson());

class GetWalletAmountModel {
  String? message;
  String? status;
  num? mebrAmount;

  GetWalletAmountModel({
    this.message,
    this.status,
    this.mebrAmount,
  });

  factory GetWalletAmountModel.fromJson(Map<String, dynamic> json) => GetWalletAmountModel(
    message: json["Message"],
    status: json["Status"],
    mebrAmount: json["Mebr_Amount"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Status": status,
    "Mebr_Amount": mebrAmount,
  };
}
