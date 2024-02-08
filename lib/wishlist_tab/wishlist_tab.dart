import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/basket_controller/basket_controller.dart';
import 'package:organic_deal/controller/cart_controller/cart_controller.dart';
import 'package:organic_deal/pages/add_new_address.dart';
import 'package:organic_deal/services/api_provider.dart';

class WishlistTab extends StatelessWidget {
  WordsController wordsController = Get.put(WordsController());
  final box = GetStorage();
  // MyCartController controller = Get.put(MyCartController());
  final formatCurrency = new NumberFormat.simpleCurrency();
  String text = '', value = '';
  bool isSubTotal = false;
  @override
  Widget build(BuildContext context) {
    var base = 'https://organicdeal.in/Images/';
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: green,
          title: Text('My Wishlist',
              style: GoogleFonts.montserrat(
                  fontSize: 16, color: white, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: IconButton(
            iconSize: 20,
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
            ),
          ),
        ),
        body: Obx(
          () => SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container();
                      //   Stack(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.all(4.0),
                      //       height: 120,
                      //       width: double.infinity,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5.0),
                      //           color: white
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Row(
                      //           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Row(
                      //                   children: [
                      //                     Stack(
                      //                         children: [
                      //                           Container(
                      //                             height: 100,width: 100,
                      //                             color: Colors.yellow,
                      //                             child: Image.network("$base${controller.cart[index].productImage}",
                      //                               fit: BoxFit.cover,),
                      //                           ),
                      //                           Positioned(
                      //                               top: 0,left: 0,
                      //                               child:Container(
                      //                                 decoration: BoxDecoration(
                      //                                   color: green,
                      //                                   borderRadius: const BorderRadius.only(
                      //                                     bottomRight: Radius.circular(10.0),
                      //                                     topLeft: Radius.circular(0.0),
                      //                                   ),
                      //                                 ),
                      //                                 height: 15,width: 50,
                      //                                 child: Padding(
                      //                                   padding: const EdgeInsets.only(top: 2.5,left: 2),
                      //                                   child: Text(' 20% OFF',style: TextStyle(color: white,fontSize: 8,),),
                      //                                 ),
                      //                               ) )
                      //                         ]
                      //                     ),
                      //                     SizedBox(width: 10,),
                      //                     Column(
                      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                       crossAxisAlignment: CrossAxisAlignment.start,
                      //                       children:  [
                      //                         Container(
                      //                           width: 170,
                      //                           height: 15,
                      //                           child: Text(" ${controller.cart[index].productName.toString()}",
                      //                             style: TextStyle(fontSize: 16),
                      //                           ),
                      //                         ),
                      //                         Text('5 kg',style: TextStyle(fontSize: 12,color: Colors.grey)),
                      //                         Text('\u{20B9}100',
                      //                           style: TextStyle(decoration: TextDecoration.lineThrough,
                      //                               fontSize: 12,color: Colors.grey),),
                      //                         Text('\u{20B9}${controller.cart[index].price.toString()}',
                      //                           style: TextStyle(fontSize: 14),),
                      //                       ],
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Positioned(
                      //       bottom: 10,right: 0,
                      //       child:  ElegantNumberButton(
                      //         color: white,
                      //         initialValue: controller.cart[index].quantity,
                      //         minValue: 0,
                      //         maxValue: 99,
                      //         onChanged: (value)async{
                      //           controller.cart[index].quantity = value.toInt();
                      //           saveDatabase(controller.cart);
                      //           controller.cart.refresh();
                      //         },decimalPlaces: 0,
                      //       ),)
                      //   ],
                      // );
                    },
                  ),
                ),
                // Container(
                //   color: Colors.white,
                //   child: ListTile(
                //     title:   Text("Total:  \u{20B9}${controller.sumCart()}",
                //         style:GoogleFonts.montserrat(fontSize: 14,color: black,
                //             fontWeight: FontWeight.w500)),
                //     subtitle:
                //
                //     Text("  Saved:  \u{20B9}${'150'}",
                //       style: TextStyle(
                //           color: green,
                //           backgroundColor:Colors.green.shade50 ,
                //           fontSize: 12,fontWeight: FontWeight.w500),),
                //     trailing:  Container(
                //       width: 150,
                //       height: 40,
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //           primary: Color(0xffE74C3C),//Colors.redAccent,
                //           onPrimary: Colors.white,
                //           elevation: 0,
                //           // shape: RoundedRectangleBorder(
                //           //     borderRadius: BorderRadius.circular(5.0)),
                //           // minimumSize: Size(50, 40),
                //         ),
                //         onPressed: () {
                //           //  Get.to(ChooseDeliveryAddressPage());
                //           // Get.to(AddNewAddress());
                //         },
                //         child: Text('Checkout',style: TextStyle(fontFamily: '',fontSize: 14,color: white),),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
