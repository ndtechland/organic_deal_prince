// To parse this JSON data, do
//
//     final cardListModel = cardListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cardListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));

String cardListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  Newmodel? newmodel;

  CartListModel({
    this.newmodel,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
    newmodel: json["newmodel"] == null ? null : Newmodel.fromJson(json["newmodel"]),
  );

  Map<String, dynamic> toJson() => {
    "newmodel": newmodel?.toJson(),
  };
}

class Newmodel {
  List<CartList>? cartList;
  num? totalprice;
  num? savedAmounts;

  Newmodel({
    this.cartList,
    this.totalprice,
    this.savedAmounts,
  });

  factory Newmodel.fromJson(Map<String, dynamic> json) => Newmodel(
    cartList: json["CartList"] == null ? [] : List<CartList>.from(json["CartList"]!.map((x) => CartList.fromJson(x))),
    totalprice: json["totalprice"],
    savedAmounts: json["SavedAmounts"],
  );

  Map<String, dynamic> toJson() => {
    "CartList": cartList == null ? [] : List<dynamic>.from(cartList!.map((x) => x.toJson())),
    "totalprice": totalprice,
    "SavedAmounts": savedAmounts,
  };
}

class CartList {
  int? id;
  num? weight;
  num? quantity;
  num? productId;
  num? price;
  num? totalPrice;
  String? productName;
  num? savedAmount;
  num? discountOffer;
  num? discountprice;
  String? productImage;

  CartList({
    this.id,
    this.weight,
    this.quantity,
    this.productId,
    this.price,
    this.totalPrice,
    this.productName,
    this.savedAmount,
    this.discountOffer,
    this.discountprice,
    this.productImage,
  });

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
    id: json["Id"],
    weight: json["Weight"],
    quantity: json["Quantity"],
    productId: json["Product_Id"],
    price: json["Price"],
    totalPrice: json["TotalPrice"],
    productName: json["ProductName"],
    savedAmount: json["SavedAmount"],
    discountOffer: json["DiscountOffer"],
    discountprice: json["discountprice"],
    productImage: json["ProductImage"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Weight": weight,
    "Quantity": quantity,
    "Product_Id": productId,
    "Price": price,
    "TotalPrice": totalPrice,
    "ProductName": productName,
    "SavedAmount": savedAmount,
    "DiscountOffer": discountOffer,
    "discountprice": discountprice,
    "ProductImage": productImage,
  };
}


// // To parse this JSON data, do
// //
// //     final cartListModel = cartListModelFromJson(jsonString);
//
// import 'dart:convert';
//
// CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));
//
// String cartListModelToJson(CartListModel data) => json.encode(data.toJson());
//
// class CartListModel {
//   Newmodel? newmodel;
//
//   CartListModel({
//     this.newmodel,
//   });
//
//   factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
//     newmodel: json["newmodel"] == null ? null : Newmodel.fromJson(json["newmodel"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "newmodel": newmodel?.toJson(),
//   };
// }
//
// class Newmodel {
//   List<CartList>? cartList;
//   num? totalprice;
//   num? savedAmount;
//
//   Newmodel({
//     this.cartList,
//     this.totalprice,
//     this.savedAmount,
//   });
//
//   factory Newmodel.fromJson(Map<String, dynamic> json) => Newmodel(
//     cartList: json["CartList"] == null ? [] : List<CartList>.from(json["CartList"]!.map((x) => CartList.fromJson(x))),
//     totalprice: json["totalprice"],
//     savedAmount: json["SavedAmount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "CartList": cartList == null ? [] : List<dynamic>.from(cartList!.map((x) => x.toJson())),
//     "totalprice": totalprice,
//     "SavedAmount": savedAmount,
//   };
// }
//
// class CartList {
//   int? id;
//   num? weight;
//   num? quantity;
//   num? productId;
//   num? price;
//   num? totalPrice;
//   String? productName;
//   num? savedAmount;
//   num? discountOffer;
//   num? discountprice;
//   String? productImage;
//
//   CartList({
//     this.id,
//     this.weight,
//     this.quantity,
//     this.productId,
//     this.price,
//     this.totalPrice,
//     this.productName,
//     this.savedAmount,
//     this.discountOffer,
//     this.discountprice,
//     this.productImage,
//   });
//
//   factory CartList.fromJson(Map<String, dynamic> json) => CartList(
//     id: json["Id"],
//     weight: json["Weight"],
//     quantity: json["Quantity"],
//     productId: json["Product_Id"],
//     price: json["Price"],
//     totalPrice: json["TotalPrice"],
//     productName: json["ProductName"],
//     savedAmount: json["SavedAmount"],
//     discountOffer: json["DiscountOffer"],
//     discountprice: json["discountprice"],
//     productImage: json["ProductImage"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "Weight": weight,
//     "Quantity": quantity,
//     "Product_Id": productId,
//     "Price": price,
//     "TotalPrice": totalPrice,
//     "ProductName": productName,
//     "SavedAmount": savedAmount,
//     "DiscountOffer": discountOffer,
//     "discountprice": discountprice,
//     "ProductImage": productImage,
//   };
// }
