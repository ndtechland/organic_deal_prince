import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/basket_controller/basket_controller.dart';
import 'package:organic_deal/controller/myList_tab_controller/myList_tab_controller.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/controller/subProduct_controller/subProduct_controller.dart';
import 'package:organic_deal/pages/shopcategorydetail_page.dart';

class ShopCategoryPage extends StatefulWidget {
  // String? id;
  // ShopCategoryPage({super.key, required this.id});

  @override
  State<ShopCategoryPage> createState() => _ShopCategoryPageState();
}

class _ShopCategoryPageState extends State<ShopCategoryPage> {
  MyListTabController myListTabController = MyListTabController();
  SubProductController _subProductController = Get.put(SubProductController());
  List<String> selectedItemValue = [];

  Map<String, dynamic> categoryMap = {};
  List<dynamic> cateList = [];
  @override
  Widget build(BuildContext context) {
    var base = 'https://admin.organicdeal.in/Images/';
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: green,
          title: Text("Product"),
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
          () => _subProductController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _subProductController.getsubproductsModel?.products?.length == 0
                  ? Center(
                      child: Text("List Empty"),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            height: 1.0,
                          ),
                      itemCount: _subProductController
                          .getsubproductsModel!.products!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item =
                            _subProductController.getsubproductsModel?.products;
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ShopCategoryDetailPage(
                                          id: "${item?[index].id.toString()}",
                                          image:
                                              "${item?[index].productImage.toString()}",
                                          desc:
                                              "${item?[index].productDescription.toString()}",
                                          price:
                                              "${item?[index].price.toString()}",
                                          ourprice:
                                              "${item?[index].ourPrice.toString()}",
                                        )));
                              },
                              child: Container(
                                margin: EdgeInsets.all(4.0),
                                // height: 120,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: white),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 130,
                                        width: 130,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Stack(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Image.network(
                                                  '${base}${item?[index].productImage}',
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return Center(
                                                        child: const Text(
                                                      '😢',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ));
                                                  },
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: green,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  height: 15,
                                                  width: 50,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 2.5, left: 2),
                                                    child: Text(
                                                      ' 20% OFF',
                                                      style: TextStyle(
                                                        color: white,
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                          ]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Container(
                                            width: 170,
                                            // height: 22,
                                            child: Text(
                                              "${item?[index].productName}",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14,
                                                  color: black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            '${item?[index].quantity ?? 0}${item?[index].metrics ?? 0}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            '\u{20B9}${item?[index].price ?? 0}',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              color: grey,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            '\u{20B9}${item?[index].ourPrice ?? 0}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 2,
                              child: Container(
                                height: 35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 80,
                                    ),
                                    SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              foregroundColor: white,
                                              backgroundColor: Colors.redAccent,
                                              elevation: 0),
                                          onPressed: () async {
                                            _subProductController.AddToCart(
                                                "${_subProductController.getsubproductsModel?.products?[index].id}");
                                          },
                                          child: Text(
                                            'Add',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        );

                        //   Padding(
                        //   padding: const EdgeInsets.all(4.0),
                        //   child:
                        //   Container(
                        //     height: 150,
                        //     color: white,
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Container(
                        //           height: 150,
                        //           width: 150,
                        //           child: Card(
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10.0),
                        //             ),
                        //             child: Stack(
                        //                 children:[
                        //                   Padding(
                        //                       padding: const EdgeInsets.all(5.0),
                        //                       child:
                        //                       Center(
                        //                         child: Image.network('${base}${item?.productImage}',
                        //                           fit: BoxFit.cover,
                        //                           errorBuilder: (BuildContext context, Object exception,
                        //                               StackTrace? stackTrace) {
                        //                             return Center(child: const Text('😢',style: TextStyle(fontSize: 20),));
                        //                           }, ),
                        //                       )
                        //                   ),
                        //                   Positioned(
                        //                       top: 0,left: 0,
                        //                       child:Container(
                        //                         decoration: BoxDecoration(
                        //                           color: green,
                        //                           borderRadius: const BorderRadius.only(
                        //                             bottomRight: Radius.circular(10.0),
                        //                             topLeft: Radius.circular(10.0),
                        //                           ),
                        //                         ),
                        //                         height: 15,width: 50,
                        //                         child: Padding(
                        //                           padding: const EdgeInsets.only(top: 2.5,left: 2),
                        //                           child: Text(' 20% OFF',
                        //                               style: GoogleFonts.montserrat(fontSize: 8,color: white,fontWeight: FontWeight.w500),),
                        //                         ),
                        //                       ) )
                        //                 ]
                        //             ),
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding: const EdgeInsets.only(left: 10.0,top: 10.0),
                        //           child:
                        //           Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Align(
                        //                 alignment: Alignment.centerLeft,
                        //                 child: Text('organicdeal'.toUpperCase(),
                        //                   style: GoogleFonts.montserrat(fontSize: 12,color: black,fontWeight: FontWeight.w600),
                        //                 ),
                        //               ),
                        //               const SizedBox(height: 5.0,),
                        //               Container(
                        //               height: 40,
                        //                 width: 170,
                        //                 child: Text("${item?.productName}",
                        //                   style:  GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500),),
                        //               ),
                        //               const SizedBox(height: 5.0,),
                        //               //dropdown
                        //               // Obx( () =>
                        //               //     Container(
                        //               //       height: 30,width: 180,
                        //               //       decoration: ShapeDecoration(
                        //               //         shape: RoundedRectangleBorder(
                        //               //           side: BorderSide(width: 1.0,color: Colors.grey.shade300,
                        //               //               style: BorderStyle.solid),
                        //               //           borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        //               //         ),
                        //               //       ),
                        //               //       child: DropdownButton(
                        //               //         isExpanded: true,
                        //               //         underline: Container(),
                        //               //         icon: const Icon(Icons.keyboard_arrow_down_outlined,
                        //               //           size: 15,color: Colors.grey,),
                        //               //         onChanged: (newValue) {
                        //               //           myListTabController.selectedDrowpdown(newValue.toString());
                        //               //           myListTabController.update();
                        //               //         },
                        //               //         value: myListTabController.selectedDrowpdown.value==""?null
                        //               //             : myListTabController.selectedDrowpdown.value,
                        //               //         items: [
                        //               //           for (var data in myListTabController.dropdownText)
                        //               //             DropdownMenuItem(
                        //               //               value: data,
                        //               //               child: Padding(
                        //               //                 padding: const EdgeInsets.only(left: 5.0),
                        //               //                 child:  Text(
                        //               //                   data,style: const TextStyle(fontSize: 13,color: Colors.grey),
                        //               //                 ),
                        //               //               ),
                        //               //             )
                        //               //         ],
                        //               //       ),
                        //               //     )
                        //               // ),
                        //               SizedBox(height: 5.0,),
                        //               Row(
                        //                 children: [
                        //                   Text('\u{20B9}''${item?.price}',
                        //                     style:  GoogleFonts.montserrat(fontSize: 12,color: black,fontWeight: FontWeight.w500),),
                        //                   SizedBox(width: 5,),
                        //                   Text('\u{20B9}',
                        //                     style:  GoogleFonts.montserrat(fontSize: 12,
                        //                         color: grey,fontWeight: FontWeight.w500,
                        //                     decoration: TextDecoration.lineThrough),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Spacer(),
                        //               Container(
                        //                 height: 35,
                        //                 child: Row(
                        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     SizedBox(width: 80,),
                        //                     SizedBox(
                        //                         width: 100,
                        //                         child: ElevatedButton(
                        //                           style: ElevatedButton.styleFrom(
                        //                               primary: Colors.redAccent, // background
                        //                               onPrimary: white,
                        //                               elevation: 0
                        //                           ),
                        //                           onPressed: () async{
                        //                             var cartItem = CartModel(
                        //                             id: item?.id,
                        //                             productName: item?.productName,
                        //                             productImage: item?.productImage,
                        //                             price: item?.price,
                        //                             quantity: 1,);
                        //                             if(isExistsInCart(controller.cart,cartItem)){
                        //                             var indexUpdate = controller.cart.indexWhere((e) => e.id == productModel?.hotDeals?[index].id);
                        //                             var productUpdate = controller.cart.firstWhere((element) => element.id == productModel?.hotDeals?[index].id);
                        //                             productUpdate.quantity += 1;
                        //                             controller.cart.insert(indexUpdate, productUpdate);
                        //                             }
                        //                             else
                        //                             {
                        //                             controller.cart.add(cartItem);
                        //                             var jsonDBEncoded = jsonEncode(controller.cart);
                        //                             await box.write(MY_CART_KEY,jsonDBEncoded);
                        //                             controller.cart.refresh();
                        //                             }
                        //                             },
                        //                           child: Text('Add',
                        //                             style:  GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w600),),
                        //                         )
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );
                      }),
        )

        // Obx(()=> _subProductController.isLoading.value
        // ? Center(child: CircularProgressIndicator(),)
        // : _subProductController.getsubproductsModel?.products?.length ==  0
        //   ? Center(child: Text("List Empty"),)
        // :
        // MediaQuery.removePadding(
        //   context: context,
        //   removeTop: true,
        //   child: ListView.builder(
        //      // separatorBuilder: (context, index) => const Divider(height: 1.0,),
        //       itemCount: _subProductController.getsubproductsModel?.products?.length,//cateList.length,
        //       shrinkWrap: true,
        //       itemBuilder: (context,index){
        //         var item = _subProductController.getsubproductsModel?.products;
        //         return
        //           GestureDetector(
        //             onTap: (){
        //               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>
        //                   ShopCategoryDetailPage(
        //                     image: "${item?[index].productImage.toString()}",
        //                     desc: "${item?[index].productDescription.toString()}",
        //                     price: "${item?[index].price.toString()}",
        //                     ourprice: "${item?[index].ourPrice.toString()}",
        //                   )));
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(4.0),
        //               child:
        //               SizedBox(
        //                 height: 150,
        //                 child: Row(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                       height: 150,
        //                       width: 150,
        //                       child: Card(
        //                         shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(10.0),
        //                         ),
        //                         child: Stack(
        //                             children:[
        //                               Padding(
        //                                 padding: const EdgeInsets.all(5.0),
        //                                 child: Center(
        //                                   child: Image.network('$base${item?[index].productImage}',
        //                                     //'$base${cateList[index]["ProductImage"]}',
        //                                     fit: BoxFit.cover,
        //                                     errorBuilder: (BuildContext context, Object exception,
        //                                         StackTrace? stackTrace) {
        //                                       return Center(child: const Text('😢',style: TextStyle(fontSize: 20),));
        //                                     },),
        //                                 ),
        //                               ),
        //                               Positioned(
        //                                   top: 0,left: 0,
        //                                   child:Container(
        //                                     decoration: BoxDecoration(
        //                                       color: green,
        //                                       borderRadius: const BorderRadius.only(
        //                                         bottomRight: Radius.circular(10.0),
        //                                         topLeft: Radius.circular(10.0),
        //                                       ),
        //                                     ),
        //                                     height: 15,width: 60,
        //                                     child: Padding(
        //                                       padding: const EdgeInsets.only(top: 2.0,left: 2),
        //                                       child: Text(' 20% OFF',
        //                                         style:GoogleFonts.montserrat(fontSize: 10,color: white,fontWeight: FontWeight.w500),
        //                                       ),
        //                                     ),
        //                                   ) ),
        //                             ]
        //                         ),
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(left: 10.0,top: 10.0),
        //                       child:
        //                       Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: [
        //                           Row(
        //                             mainAxisAlignment: MainAxisAlignment.start,
        //                             children: [
        //                               Text('organicdeal'.toUpperCase(),
        //                                   style:GoogleFonts.montserrat(fontSize: 13,color: grey,fontWeight: FontWeight.w500)),
        //                             ],
        //                           ),
        //                           Container(
        //                             width: 150,
        //                             child: Text("${item?[index].productName}",
        //                               style:GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500),
        //                               overflow: TextOverflow.ellipsis,
        //                               maxLines: 2,
        //                               softWrap: false,
        //                             ),
        //                           ),
        //                           const SizedBox(height: 5.0,),
        //                           const SizedBox(height: 5.0,),
        //                           Row(
        //                             children: [
        //                               Text('\u{20B9} ${item?[index].ourPrice}',
        //                                   style:GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500)),
        //                               SizedBox(width: 5,),
        //                               Text('\u{20B9} ${item?[index].price ?? ''}',
        //                                   style:GoogleFonts.montserrat(fontSize: 14,
        //                                       decoration: TextDecoration.lineThrough,
        //                                       color: grey,fontWeight: FontWeight.w500)
        //                               ),
        //                             ],
        //                           ),
        //                           Spacer(),
        //                           Container(
        //                             height: 35,
        //                             child: Row(
        //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                               children: [
        //                                 SizedBox(width: 80,),
        //                                 SizedBox(
        //                                     width: 100,
        //                                     child: ElevatedButton(
        //                                       style: ElevatedButton.styleFrom(
        //                                           primary: Colors.redAccent, // background
        //                                           onPrimary: white,
        //                                           elevation: 0
        //                                       ),
        //                                       onPressed: () {},
        //                                       child: Text("ADD",
        //                                           style:GoogleFonts.montserrat(fontSize: 16,color: white,fontWeight: FontWeight.w600)
        //                                       ),
        //                                     )
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           );
        //       }),
        // )
        // )
        );
  }
}
