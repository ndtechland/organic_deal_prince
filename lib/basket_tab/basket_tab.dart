import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/cartListApi_controller/cartListApi_controller.dart';
import 'package:organic_deal/pages/choose_delivery_address_page.dart';

import '../pages/login_page.dart';

class BasketTab extends StatelessWidget {
  final getStorage = GetStorage();

  final CartListApiController _cartListApiController =
      Get.put(CartListApiController());
  // CouponController _couponController = Get.put(CouponController());
  @override
  Widget build(BuildContext context) {
    var base = 'https://organicdeal.in/Images/';
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Text('Review Basket',
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
      body: getStorage.read("id") != null
          ? Obx(
              () => _cartListApiController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: green,
                      ),
                    )
                  : _cartListApiController
                              .getCartListModel?.newmodel?.cartList?.length ==
                          0
                      ? Center(
                          child: Text(
                            "Your Cart is Empty",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: black,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: _cartListApiController
                                    .getCartListModel
                                    ?.newmodel
                                    ?.cartList
                                    ?.length,
                                itemBuilder: (context, index) {
                                  var item = _cartListApiController
                                      .getCartListModel?.newmodel?.cartList;
                                  return Slidable(
                                      key: const ValueKey(0),
                                      endActionPane: ActionPane(
                                        dismissible:
                                            DismissiblePane(onDismissed: () {}),
                                        motion: const DrawerMotion(),
                                        children: [
                                          SlidableAction(
                                            autoClose: true,
                                            flex: 1,
                                            onPressed: (value) {
                                              _cartListApiController
                                                  .removeCartListApi(
                                                      item?[index].id);
                                              Timer(
                                                  const Duration(seconds: 1),
                                                  () => _cartListApiController
                                                      .getCartListApi());
                                            },
                                            backgroundColor: Colors.red,
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            label: 'Delete',
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(4.0),
                                            height: 120,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: white),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Stack(children: [
                                                            Card(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  height: 100,
                                                                  width: 100,
                                                                  child: Image
                                                                      .network(
                                                                    "$base${item?[index].productImage}",
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                                top: 0,
                                                                left: 0,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        green,
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10.0),
                                                                    ),
                                                                  ),
                                                                  height: 20,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Saved \u{20B9} ${item?[index].savedAmount}',
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              8,
                                                                          color:
                                                                              white,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                ))
                                                          ]),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 170,
                                                                height: 22,
                                                                child: Text(
                                                                  " ${item?[index].productName}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                              ),
                                                              Text(
                                                                  '${item?[index].weight}g',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .grey)),
                                                              Text(
                                                                '\u{20B9}${item?[index].price ?? 0}',
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              Text(
                                                                '\u{20B9}${item?[index].discountprice ?? 0}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            right: 2,
                                            child: Container(
                                              width: 90,
                                              height: 28,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.redAccent),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        _cartListApiController
                                                            .decrementCartItemApi(
                                                                item?[index]
                                                                    .productId);
                                                        Timer(
                                                            const Duration(
                                                                seconds: 1),
                                                            () => _cartListApiController
                                                                .getCartListApi());
                                                        _cartListApiController
                                                            .update();
                                                        // _cartListApiController
                                                        //     .refresh();
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.redAccent,
                                                        size: 20,
                                                      )),
                                                  Container(
                                                    width: 20,
                                                    color: Colors.redAccent,
                                                    child: Center(
                                                      child: Text(
                                                        "${item?[index].quantity}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        _cartListApiController
                                                            .incrementCartItemApi(
                                                                item?[index]
                                                                    .productId);
                                                        Timer(
                                                            const Duration(
                                                                seconds: 1),
                                                            () => _cartListApiController
                                                                .getCartListApi());
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.redAccent,
                                                        size: 20,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                                },
                              ),
                            ),
                            Container(
                              color: white,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 4, right: 1),
                                title: Text(
                                    "Total:  \u{20B9} ${_cartListApiController.getCartListModel?.newmodel?.totalprice ?? 0}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: black,
                                        fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                  "  Saved:  \u{20B9}${_cartListApiController.getCartListModel?.newmodel?.savedAmounts ?? 0}",
                                  style: TextStyle(
                                      color: green,
                                      backgroundColor: Colors.green.shade50,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Container(
                                  width: 150,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xffE74C3C),
                                      elevation: 0,
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.circular(5.0)),
                                      // minimumSize: Size(50, 40),
                                    ),
                                    onPressed: () {
                                      Get.to(ChooseDeliveryAddressPage());
                                      // _couponController.getSubTotalApi();
                                      // Get.to(AddNewAddress());
                                    },
                                    child: Text(
                                      'Checkout',
                                      style: TextStyle(
                                          fontFamily: '',
                                          fontSize: 14,
                                          color: white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            // Container(
                            //         color: Colors.white,
                            //         child: Padding(
                            //           padding: EdgeInsets.only(left: 5.0,right: 5.0,bottom: 1),
                            //           child: Column(
                            //             mainAxisSize: MainAxisSize.min,
                            //             children: [
                            //             Row(
                            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Text("Sub total",
                            //               style:GoogleFonts.montserrat(fontSize: 14,color: black,
                            //                   fontWeight: FontWeight.w500)),
                            //                 Text("\u{20B9} ${_cartListApiController.getCartListModel?.newmodel?.totalprice ?? 0}",
                            //                         style:GoogleFonts.montserrat(fontSize: 14,color: black,
                            //                             fontWeight: FontWeight.w500)),
                            //               ],
                            //             ),SizedBox(height: 5,),
                            //               Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text("Shipping",
                            //                   style:GoogleFonts.montserrat(fontSize: 14,color: black,
                            //                       fontWeight: FontWeight.w500)),
                            //                   Text("0.0",
                            //                       style:GoogleFonts.montserrat(fontSize: 14,color: black,
                            //                           fontWeight: FontWeight.w500))
                            //                 ],
                            //               ),SizedBox(height: 5,),
                            //               Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text("Gst",
                            //                   style:GoogleFonts.montserrat(fontSize: 14,color: black,
                            //                       fontWeight: FontWeight.w500)),
                            //                   Text("0%",
                            //                       style:GoogleFonts.montserrat(fontSize: 14,color: black,
                            //                           fontWeight: FontWeight.w500))
                            //                 ],
                            //               ),SizedBox(height: 5,),
                            //               Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text("Total",
                            //                   style:GoogleFonts.montserrat(fontSize: 16,color: black,
                            //                       fontWeight: FontWeight.w500)),
                            //                   Text("\u{20B9} ${_cartListApiController.getCartListModel?.newmodel?.totalprice ?? 0}",
                            //                       style:GoogleFonts.montserrat(fontSize: 14,color: black,
                            //                           fontWeight: FontWeight.w500)),
                            //
                            //                 ],
                            //               ),SizedBox(height: 5,),
                            //   Container(
                            //     width: double.infinity,
                            //     height: 45,
                            //     child: ElevatedButton(
                            //               style: ElevatedButton.styleFrom(
                            //                 primary: Color(0xffE74C3C),//Colors.redAccent,
                            //                 onPrimary: Colors.white,
                            //                 elevation: 0,
                            //                 // shape: RoundedRectangleBorder(
                            //                 //     borderRadius: BorderRadius.circular(5.0)),
                            //                // minimumSize: Size(50, 40),
                            //               ),
                            //               onPressed: () {
                            //                 Get.to(ChooseDeliveryAddressPage());
                            //               },
                            //               child: Text('Checkout',
                            //                 style:GoogleFonts.montserrat(fontSize: 16,color: white,
                            //                              fontWeight: FontWeight.w600)),
                            //             ),
                            //   ),
                            //             ],
                            //           ),
                            //         ),
                            //
                            //       ),
                          ],
                        ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login/Signup",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not Logged in? ',
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: black,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LoginPage());
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: green,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
