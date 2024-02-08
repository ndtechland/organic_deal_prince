import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/hometab_controller/hometab_controller.dart';
import 'package:organic_deal/controller/recommendedProduct_controller/recommendedProduct_controller.dart';

class RecommendProductPage extends StatelessWidget {
  RecommendProductPage({Key? key}) : super(key: key);
  // final HomeTabController _homeTabController = Get.put(HomeTabController());
  RecommendedProductController _recommendedProductController =
      Get.put(RecommendedProductController());
  @override
  Widget build(BuildContext context) {
    var base = 'https://organicdeal.in/Images/';
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Recommend Products',
            style: GoogleFonts.montserrat(
                fontSize: 16, color: black, fontWeight: FontWeight.w500),
          ),
          backgroundColor: white,
          titleSpacing: 20,
          leadingWidth: 30,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: black,
                  size: 20,
                )),
          ),
        ),
        body: Obx(
          () => (_recommendedProductController.isloading.value)
              ? Center(child: CircularProgressIndicator())
              : _recommendedProductController
                          .getrecommendproduct?.recommendProducts?.length ==
                      0
                  ? Center(
                      child: Text("No Data"),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                            height: 1.0,
                          ),
                      itemCount: _recommendedProductController
                          .getrecommendproduct!.recommendProducts!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = _recommendedProductController
                            .getrecommendproduct!.recommendProducts;
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all(4.0),
                              // height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: white),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            padding: const EdgeInsets.all(5.0),
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
                                                    style:
                                                        TextStyle(fontSize: 20),
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
                                            _recommendedProductController.AddToCart(
                                                "${_recommendedProductController.getrecommendproduct?.recommendProducts?[index].id}");
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
        ));
  }
}
