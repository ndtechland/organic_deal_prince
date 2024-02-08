//
// import 'package:get/get.dart';
// import 'package:organic_deal/model/cart_model.dart';
//
// class MyCartController extends GetxController{
//   var cart = List<CartModel>.empty(growable: true).obs;
//
//   sumCart(){
//     return cart.length == 0 ? 0 : cart.map((e) => double.parse(e.price.toString()) * e.quantity).reduce((previousValue, element) => previousValue+element);
//   }
//   getQuantity(){
//     return cart.length == 0 ? 0 : cart.map((e) => e.quantity).reduce((previousValue, element) => previousValue+element);
//   }
//   shippingFee(){
//     return sumCart() * 0.1;
//   }
// }