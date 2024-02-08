// To parse this JSON data, do
//
//     final addressSelectModel = addressSelectModelFromJson(jsonString);

import 'dart:convert';

AddressSelectModel addressSelectModelFromJson(String str) => AddressSelectModel.fromJson(json.decode(str));

String addressSelectModelToJson(AddressSelectModel data) => json.encode(data.toJson());

class AddressSelectModel {
  List<GetDeliverAddress>? getDeliverAddress;

  AddressSelectModel({
    this.getDeliverAddress,
  });

  factory AddressSelectModel.fromJson(Map<String, dynamic> json) => AddressSelectModel(
    getDeliverAddress: json["GetDeliverAddress"] == null ? [] : List<GetDeliverAddress>.from(json["GetDeliverAddress"]!.map((x) => GetDeliverAddress.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "GetDeliverAddress": getDeliverAddress == null ? [] : List<dynamic>.from(getDeliverAddress!.map((x) => x.toJson())),
  };
}

class GetDeliverAddress {
  int? id;
  String? firstName;
  String? lastName;
  String? contactNumber;
  int? houseNo;
  String? appertmentName;
  String? streetDetail;
  String? landmark;
  String? areaDetail;
  String? cityDistrict;
  String? pincode;
  String? nickNameThisAddressas;
  String? townaddress;

  GetDeliverAddress({
    this.id,
    this.firstName,
    this.lastName,
    this.contactNumber,
    this.houseNo,
    this.appertmentName,
    this.streetDetail,
    this.landmark,
    this.areaDetail,
    this.cityDistrict,
    this.pincode,
    this.nickNameThisAddressas,
    this.townaddress,
  });

  factory GetDeliverAddress.fromJson(Map<String, dynamic> json) => GetDeliverAddress(
    id: json["Id"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    contactNumber: json["ContactNumber"],
    houseNo: json["HouseNo"],
    appertmentName: json["AppertmentName"],
    streetDetail: json["StreetDetail"],
    landmark: json["Landmark"],
    areaDetail: json["AreaDetail"],
    cityDistrict: json["CityDistrict"],
    pincode: json["Pincode"],
    nickNameThisAddressas: json["NickNameThisAddressas"],
    townaddress: json["Townaddress"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "ContactNumber": contactNumber,
    "HouseNo": houseNo,
    "AppertmentName": appertmentName,
    "StreetDetail": streetDetail,
    "Landmark": landmark,
    "AreaDetail": areaDetail,
    "CityDistrict": cityDistrict,
    "Pincode": pincode,
    "NickNameThisAddressas": nickNameThisAddressas,
    "Townaddress": townaddress,
  };
}
