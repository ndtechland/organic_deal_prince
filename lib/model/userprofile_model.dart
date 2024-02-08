// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  String fullName;
  String phone;
  String emailId;

  UserProfileModel({
    required this.fullName,
    required this.phone,
    required this.emailId,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    fullName: json["FullName"],
    phone: json["Phone"],
    emailId: json["Email_Id"],
  );

  Map<String, dynamic> toJson() => {
    "FullName": fullName,
    "Phone": phone,
    "Email_Id": emailId,
  };
}
