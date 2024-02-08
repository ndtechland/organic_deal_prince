// To parse this JSON data, do
//
//     final orderDetailPageModel = orderDetailPageModelFromJson(jsonString);

import 'dart:convert';

OrderDetailPageModel orderDetailPageModelFromJson(String str) => OrderDetailPageModel.fromJson(json.decode(str));

String orderDetailPageModelToJson(OrderDetailPageModel data) => json.encode(data.toJson());

class OrderDetailPageModel {
  Newmodel? newmodel;

  OrderDetailPageModel({
    this.newmodel,
  });

  factory OrderDetailPageModel.fromJson(Map<String, dynamic> json) => OrderDetailPageModel(
    newmodel: json["newmodel"] == null ? null : Newmodel.fromJson(json["newmodel"]),
  );

  Map<String, dynamic> toJson() => {
    "newmodel": newmodel?.toJson(),
  };
}

class Newmodel {
  List<Cartlist>? cartlist;
  num? totalprice;
  num? shippings;

  Newmodel({
    this.cartlist,
    this.totalprice,
    this.shippings,
  });

  factory Newmodel.fromJson(Map<String, dynamic> json) => Newmodel(
    cartlist: json["cartlist"] == null ? [] : List<Cartlist>.from(json["cartlist"]!.map((x) => Cartlist.fromJson(x))),
    totalprice: json["totalprice"],
    shippings: json["Shippings"],
  );

  Map<String, dynamic> toJson() => {
    "cartlist": cartlist == null ? [] : List<dynamic>.from(cartlist!.map((x) => x.toJson())),
    "totalprice": totalprice,
    "Shippings": shippings,
  };
}

class Cartlist {
  int? id;
  int? productId;
  bool? isCancel;
  num? price;
  num? totalPrice;
  String? paymentMode;
  String? name;
  dynamic email;
  dynamic password;
  String? phone;
  dynamic address;
  dynamic city;
  dynamic state;
  String? pincode;
  dynamic deliveryDate;
  DateTime? orderDate;
  String? productName;
  int? orderId;
  int? userId;
  String? productImage;
  int? quantity;
  num? finalPrice;
  int? totalItems;
  String? invoice;
  num? shippingCharge;

  Cartlist({
    this.id,
    this.productId,
    this.isCancel,
    this.price,
    this.totalPrice,
    this.paymentMode,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.deliveryDate,
    this.orderDate,
    this.productName,
    this.orderId,
    this.userId,
    this.productImage,
    this.quantity,
    this.finalPrice,
    this.totalItems,
    this.invoice,
    this.shippingCharge,
  });

  factory Cartlist.fromJson(Map<String, dynamic> json) => Cartlist(
    id: json["Id"],
    productId: json["Product_Id"],
    isCancel: json["IsCancel"],
    price: json["Price"],
    totalPrice: json["Total_Price"],
    paymentMode: json["PaymentMode"],
    name: json["Name"],
    email: json["Email"],
    password: json["Password"],
    phone: json["Phone"],
    address: json["Address"],
    city: json["City"],
    state: json["State"],
    pincode: json["Pincode"],
    deliveryDate: json["DeliveryDate"],
    orderDate: json["OrderDate"] == null ? null : DateTime.parse(json["OrderDate"]),
    productName: json["ProductName"],
    orderId: json["Order_Id"],
    userId: json["User_Id"],
    productImage: json["ProductImage"],
    quantity: json["Quantity"],
    finalPrice: json["FinalPrice"],
    totalItems: json["Total_Items"],
    invoice: json["Invoice"],
    shippingCharge: json["ShippingCharge"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Product_Id": productId,
    "IsCancel": isCancel,
    "Price": price,
    "Total_Price": totalPrice,
    "PaymentMode": paymentMode,
    "Name": name,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "Address": address,
    "City": city,
    "State": state,
    "Pincode": pincode,
    "DeliveryDate": deliveryDate,
    "OrderDate": orderDate?.toIso8601String(),
    "ProductName": productName,
    "Order_Id": orderId,
    "User_Id": userId,
    "ProductImage": productImage,
    "Quantity": quantity,
    "FinalPrice": finalPrice,
    "Total_Items": totalItems,
    "Invoice": invoice,
    "ShippingCharge": shippingCharge,
  };
}
