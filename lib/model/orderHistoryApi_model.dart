// To parse this JSON data, do
//
//     final orderHistoryApiModel = orderHistoryApiModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryApiModel orderHistoryApiModelFromJson(String str) => OrderHistoryApiModel.fromJson(json.decode(str));

String orderHistoryApiModelToJson(OrderHistoryApiModel data) => json.encode(data.toJson());

class OrderHistoryApiModel {
  List<Result>? result;
  String? message;
  num? status;

  OrderHistoryApiModel({
    this.result,
    this.message,
    this.status,
  });

  factory OrderHistoryApiModel.fromJson(Map<String, dynamic> json) => OrderHistoryApiModel(
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class Result {
  num? id;
  num? productId;
  bool? isCancel;
  num? price;
  num? totalPrice;
  String? paymentMode;
  dynamic name;
  dynamic email;
  dynamic password;
  String? phone;
  String? address;
  dynamic city;
  dynamic state;
  dynamic pincode;
  dynamic deliveryDate;
  DateTime? orderDate;
  String? productName;
  num? orderId;
  dynamic productImage;
  num? quantity;
  num? totalItems;
  String? invoice;
  List<Orderdetail>? orderdetails;

  Result({
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
    this.productImage,
    this.quantity,
    this.totalItems,
    this.invoice,
    this.orderdetails,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
    productImage: json["ProductImage"],
    quantity: json["Quantity"],
    totalItems: json["Total_Items"],
    invoice: json["Invoice"],
    orderdetails: json["orderdetails"] == null ? [] : List<Orderdetail>.from(json["orderdetails"]!.map((x) => Orderdetail.fromJson(x))),
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
    "ProductImage": productImage,
    "Quantity": quantity,
    "Total_Items": totalItems,
    "Invoice": invoice,
    "orderdetails": orderdetails == null ? [] : List<dynamic>.from(orderdetails!.map((x) => x.toJson())),
  };
}

class Orderdetail {
  num? id;
  num? productId;
  num? userId;
  num? price;
  dynamic deliveryDate;
  bool? isDelivered;
  bool? ifReturned;
  String? productName;
  num? orderId;
  num? finalPrice;
  num? discountValue;
  num? serviceTax;
  num? quantity;
  dynamic metrics;
  num? categoryId;
  bool? isCancel;
  num? orderStatusId;
  num? volume;
  dynamic updateDate;
  dynamic cancellationDate;
  dynamic statusUpdateDate;
  num? vendorId;

  Orderdetail({
    this.id,
    this.productId,
    this.userId,
    this.price,
    this.deliveryDate,
    this.isDelivered,
    this.ifReturned,
    this.productName,
    this.orderId,
    this.finalPrice,
    this.discountValue,
    this.serviceTax,
    this.quantity,
    this.metrics,
    this.categoryId,
    this.isCancel,
    this.orderStatusId,
    this.volume,
    this.updateDate,
    this.cancellationDate,
    this.statusUpdateDate,
    this.vendorId,
  });

  factory Orderdetail.fromJson(Map<String, dynamic> json) => Orderdetail(
    id: json["Id"],
    productId: json["Product_Id"],
    userId: json["User_Id"],
    price: json["Price"],
    deliveryDate: json["DeliveryDate"],
    isDelivered: json["IsDelivered"],
    ifReturned: json["IfReturned"],
    productName: json["ProductName"],
    orderId: json["Order_Id"],
    finalPrice: json["FinalPrice"],
    discountValue: json["DiscountValue"],
    serviceTax: json["ServiceTax"],
    quantity: json["Quantity"],
    metrics: json["Metrics"],
    categoryId: json["Category_Id"],
    isCancel: json["IsCancel"],
    orderStatusId: json["OrderStatus_Id"],
    volume: json["Volume"],
    updateDate: json["UpdateDate"],
    cancellationDate: json["CancellationDate"],
    statusUpdateDate: json["StatusUpdateDate"],
    vendorId: json["VendorId"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Product_Id": productId,
    "User_Id": userId,
    "Price": price,
    "DeliveryDate": deliveryDate,
    "IsDelivered": isDelivered,
    "IfReturned": ifReturned,
    "ProductName": productName,
    "Order_Id": orderId,
    "FinalPrice": finalPrice,
    "DiscountValue": discountValue,
    "ServiceTax": serviceTax,
    "Quantity": quantity,
    "Metrics": metrics,
    "Category_Id": categoryId,
    "IsCancel": isCancel,
    "OrderStatus_Id": orderStatusId,
    "Volume": volume,
    "UpdateDate": updateDate,
    "CancellationDate": cancellationDate,
    "StatusUpdateDate": statusUpdateDate,
    "VendorId": vendorId,
  };
}