// import 'dart:convert';
//
// import 'package:organic_deal/model/hotdetails_model.dart';
// class CartModel extends HotDeal{
//   int quantity=0;
//   CartModel({
//     id,productName,productImage,price,category,
//     required this.quantity
//   }):super(
//     id: id,
//     productName: productName,
//     productImage: productImage,
//     price: price,
//     // category: category
//
//   );
//   factory CartModel.fromJson(Map<String, dynamic> json){
//     final product = ProductModel.fromJson(json);
//     final quantity = json["Quantity"];
//     return CartModel(
//       id:product.hotDeals?[0].id.toString(),
//       productName: product.hotDeals?[0].productName,
//       productImage: product.hotDeals?[0].productImage,
//       price: product.hotDeals?[0].price,
//       quantity: quantity,
//     );
//   }
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "ProductName": productName,
//     "ProductImage": productImage,
//     "Price": price,
//     "Quantity" : quantity
//   };
// }
