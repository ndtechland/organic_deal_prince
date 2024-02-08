// To parse this JSON data, do
//
//     final cancelOrderModel = cancelOrderModelFromJson(jsonString);

import 'dart:convert';

CancelOrderModel cancelOrderModelFromJson(String str) => CancelOrderModel.fromJson(json.decode(str));

String cancelOrderModelToJson(CancelOrderModel data) => json.encode(data.toJson());

class CancelOrderModel {
  List<OrdList>? ordList;

  CancelOrderModel({
    this.ordList,
  });

  factory CancelOrderModel.fromJson(Map<String, dynamic> json) => CancelOrderModel(
    ordList: json["OrdList"] == null ? [] : List<OrdList>.from(json["OrdList"]!.map((x) => OrdList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "OrdList": ordList == null ? [] : List<dynamic>.from(ordList!.map((x) => x.toJson())),
  };
}

class OrdList {
  int? id;
  int? productId;
  bool? isCancel;
  num? price;
  num? totalPrice;
  // PaymentMode? paymentMode;
  // Name? name;
  // Email? email;
  dynamic password;
  String? phone;
  String? address;
  dynamic city;
  dynamic state;
  dynamic pincode;
  dynamic cancellationDate;
  String? productName;
  int? orderId;
  dynamic productImage;
  int? quantity;
  num? finalPrice;
  int? totalItems;
  String? invoice;

  OrdList({
    this.id,
    this.productId,
    this.isCancel,
    this.price,
    this.totalPrice,
    // this.paymentMode,
    // this.name,
    // this.email,
    this.password,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.cancellationDate,
    this.productName,
    this.orderId,
    this.productImage,
    this.quantity,
    this.finalPrice,
    this.totalItems,
    this.invoice,
  });

  factory OrdList.fromJson(Map<String, dynamic> json) => OrdList(
    id: json["Id"],
    productId: json["Product_Id"],
    isCancel: json["IsCancel"],
    price: json["Price"],
    totalPrice: json["Total_Price"],
    // paymentMode: paymentModeValues.map[json["PaymentMode"]]!,
    // name: nameValues.map[json["Name"]]!,
    // email: emailValues.map[json["Email"]]!,
    password: json["Password"],
    phone: json["Phone"],
    address: json["Address"],
    city: json["City"],
    state: json["State"],
    pincode: json["Pincode"],
    cancellationDate: json["CancellationDate"],
    productName: json["ProductName"],
    orderId: json["Order_Id"],
    productImage: json["ProductImage"],
    quantity: json["Quantity"],
    finalPrice: json["FinalPrice"],
    totalItems: json["Total_Items"],
    invoice: json["Invoice"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Product_Id": productId,
    "IsCancel": isCancel,
    "Price": price,
    "Total_Price": totalPrice,
    // "PaymentMode": paymentModeValues.reverse[paymentMode],
    // "Name": nameValues.reverse[name],
    // "Email": emailValues.reverse[email],
    "Password": password,
    "Phone": phone,
    "Address": address,
    "City": city,
    "State": state,
    "Pincode": pincode,
    "CancellationDate": cancellationDate,
    "ProductName": productName,
    "Order_Id": orderId,
    "ProductImage": productImage,
    "Quantity": quantity,
    "FinalPrice": finalPrice,
    "Total_Items": totalItems,
    "Invoice": invoice,
  };
}


// // To parse this JSON data, do
// //
// //     final cancelOrderModel = cancelOrderModelFromJson(jsonString);
//
// import 'dart:convert';
//
// CancelOrderModel cancelOrderModelFromJson(String str) => CancelOrderModel.fromJson(json.decode(str));
//
// String cancelOrderModelToJson(CancelOrderModel data) => json.encode(data.toJson());
//
// class CancelOrderModel {
//   List<OrdList> ordList;
//
//   CancelOrderModel({
//     required this.ordList,
//   });
//
//   factory CancelOrderModel.fromJson(Map<String, dynamic> json) => CancelOrderModel(
//     ordList: List<OrdList>.from(json["OrdList"].map((x) => OrdList.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "OrdList": List<dynamic>.from(ordList.map((x) => x.toJson())),
//   };
// }
//
// class OrdList {
//   int id;
//   int productId;
//   bool isCancel;
//   num price;
//   num totalPrice;
//   dynamic password;
//   String phone;
//   String address;
//   dynamic city;
//   dynamic state;
//   dynamic pincode;
//   dynamic cancellationDate;
//   String productName;
//   int orderId;
//   dynamic productImage;
//   int quantity;
//   num finalPrice;
//   int totalItems;
//   String invoice;
//
//   OrdList({
//     required this.id,
//     required this.productId,
//     required this.isCancel,
//     required this.price,
//     required this.totalPrice,
//     required this.password,
//     required this.phone,
//     required this.address,
//     this.city,
//     this.state,
//     this.pincode,
//     this.cancellationDate,
//     required this.productName,
//     required this.orderId,
//     this.productImage,
//     required this.quantity,
//     required this.finalPrice,
//     required this.totalItems,
//     required this.invoice,
//   });
//
//   factory OrdList.fromJson(Map<String, dynamic> json) => OrdList(
//     id: json["Id"],
//     productId: json["Product_Id"],
//     isCancel: json["IsCancel"],
//     price: json["Price"],
//     totalPrice: json["Total_Price"],
//     password: json["Password"],
//     phone: json["Phone"],
//     address: json["Address"],
//     city: json["City"],
//     state: json["State"],
//     pincode: json["Pincode"],
//     cancellationDate: json["CancellationDate"],
//     productName: json["ProductName"],
//     orderId: json["Order_Id"],
//     productImage: json["ProductImage"],
//     quantity: json["Quantity"],
//     finalPrice: json["FinalPrice"],
//     totalItems: json["Total_Items"],
//     invoice: json["Invoice"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "Product_Id": productId,
//     "IsCancel": isCancel,
//     "Price": price,
//     "Total_Price": totalPrice,
//     "Password": password,
//     "Phone": phone,
//     "Address": address,
//     "City": city,
//     "State": state,
//     "Pincode": pincode,
//     "CancellationDate": cancellationDate,
//     "ProductName": productName,
//     "Order_Id": orderId,
//     "ProductImage": productImage,
//     "Quantity": quantity,
//     "FinalPrice": finalPrice,
//     "Total_Items": totalItems,
//     "Invoice": invoice,
//   };
// }
