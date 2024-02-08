import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/cartListApi_controller/cartListApi_controller.dart';
import 'package:organic_deal/controller/specialProduct_controller/specialProduct_controller.dart';
import 'package:organic_deal/model/special_products_model.dart';

// ignore: must_be_immutable
class SpecialProducts extends StatelessWidget {
  SpecialProducts({Key? key}) : super(key: key);
  // final HomeTabController _homeTabController = Get.put(HomeTabController());
  final SpecialProductController _specialProductController =
      Get.put(SpecialProductController());
  // ignore: unused_field
  final CartListApiController _cartListApiController =
      Get.put(CartListApiController());
  SpecialProductModel? specialProductModel;
// final controller = Get.put(MyCartController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var base = 'https://admin.organicdeal.in/Images/';
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Special Products',
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
          actions: [
            // Obx(() => badges.Badge(
            //   position: BadgePosition.topEnd(top: 0, end: 1),
            //   showBadge: true,
            //   badgeContent: Text(_cartListApiController.getCartListModel!.newmodel!.cartList!.length > 9 ? '9+'
            //       : '${_cartListApiController.getCartListModel?.newmodel?.cartList?.length}',
            //     //'${controller.getQuantity()}',
            //     style: TextStyle(color: Colors.white),),
            //   child: IconButton(
            //       onPressed: (){
            //          _cartListApiController.getCartListApi();
            //         // _cartListApiController.update();
            //       // var  prefs= GetStorage();
            //       // prefs.write("cartLength", controller.cart.length);
            //         Get.to(()=> BasketTab());
            //       },
            //       icon: Icon(Icons.shopping_cart,color: black,)),
            // )
            // ),
          ],
        ),
        body: Obx(
          () => (_specialProductController.isloading.value)
              ? Center(child: CircularProgressIndicator())
              :
              // _homeTabController.s?.specialProducts!.length==0
              //   ? Center(child: Text("No Data"),)
              //   :

              ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1.0,
                  ),
                  itemCount: _specialProductController
                      .specialProductModel!.specialProducts!.length,
                  itemBuilder: (context, index) {
                    final item = _specialProductController
                        .specialProductModel?.specialProducts;
                    // print("dfghjkl:'${item?[index].quantity??0}${item?[index].metrics.val.toString()}'");
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Stack(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                          child: Image.network(
                                            '${base}${item?[index].productImage}',
                                            fit: BoxFit.cover,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return Center(
                                                  child: const Text(
                                                '😢',
                                                style: TextStyle(fontSize: 20),
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
                                                topLeft: Radius.circular(10.0),
                                              ),
                                            ),
                                            height: 15,
                                            width: 50,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      '${item?[index].quantity ?? 0}${item?[index].metrics}',
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
                                        decoration: TextDecoration.lineThrough,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        _specialProductController.AddToCart(
                                            "${_specialProductController.specialProductModel?.specialProducts?[index].id}");
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
                  },
                ),

          //////////

          // ListView.separated(
          //     separatorBuilder: (context, index) => const Divider(height: 1.0,),
          //     itemCount: _specialProductController.specialProductModel!.specialProducts!.length,
          //     shrinkWrap: true,
          //     itemBuilder: (context,index){
          //       final item = _specialProductController.specialProductModel?.specialProducts?[index];
          //       return   Padding(
          //         padding: const EdgeInsets.all(4.0),
          //         child:
          //         SizedBox(
          //           height: 150,
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Container(
          //                 height: 150,
          //                 width: 150,
          //                 child: Card(
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(10.0),
          //                   ),
          //                   child: Stack(
          //                       children:[
          //                         Padding(
          //                           padding: const EdgeInsets.all(5.0),
          //                           child:
          //                           Center(
          //                             child: Image.network('${base}${item?.productImage}',
          //                               fit: BoxFit.cover,
          //                               errorBuilder: (BuildContext context, Object exception,
          //                                   StackTrace? stackTrace) {
          //                                 return Center(child: const Text('😢',style: TextStyle(fontSize: 20),));
          //                               }, ),
          //                           )
          //                         ),
          //                         Positioned(
          //                             top: 0,left: 0,
          //                             child:Container(
          //                               decoration: BoxDecoration(
          //                                 color: green,
          //                                 borderRadius: const BorderRadius.only(
          //                                   bottomRight: Radius.circular(10.0),
          //                                   topLeft: Radius.circular(10.0),
          //                                 ),
          //                               ),
          //                               height: 15,width: 50,
          //                               child: Padding(
          //                                 padding: const EdgeInsets.only(top: 2.5,left: 2),
          //                                 child: Text(' 20% OFF',
          //                                   style: GoogleFonts.montserrat(fontSize: 8,color: white,fontWeight: FontWeight.w500),),
          //                               ),
          //                             ) )
          //                       ]
          //                   ),
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 10.0,top: 10.0),
          //                 child:
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Align(
          //                       alignment: Alignment.centerLeft,
          //                       child: Text('organicdeal'.toUpperCase(),
          //                         style: GoogleFonts.montserrat(fontSize: 12,color: black,fontWeight: FontWeight.w600),),
          //                     ),
          //                     Container(
          //                       height: 40,
          //                       width: 170,
          //                       child: Text('${item?.productName}',
          //                         style:  GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500),),
          //                     ),
          //
          //                     const SizedBox(height: 5.0,),
          //                     //dropdown
          //                     // Obx( () =>
          //                     //     Container(
          //                     //       height: 30,width: 180,
          //                     //       decoration: ShapeDecoration(
          //                     //         shape: RoundedRectangleBorder(
          //                     //           side: BorderSide(width: 1.0,color: Colors.grey.shade300,
          //                     //               style: BorderStyle.solid),
          //                     //           borderRadius: BorderRadius.all(Radius.circular(2.0)),
          //                     //         ),
          //                     //       ),
          //                     //       child: DropdownButton(
          //                     //         isExpanded: true,
          //                     //         underline: Container(),
          //                     //         icon: const Icon(Icons.keyboard_arrow_down_outlined,
          //                     //           size: 15,color: Colors.grey,),
          //                     //         onChanged: (newValue) {
          //                     //           myListTabController.selectedDrowpdown(newValue.toString());
          //                     //           myListTabController.update();
          //                     //         },
          //                     //         value: myListTabController.selectedDrowpdown.value==""?null
          //                     //             : myListTabController.selectedDrowpdown.value,
          //                     //         items: [
          //                     //           for (var data in myListTabController.dropdownText)
          //                     //             DropdownMenuItem(
          //                     //               value: data,
          //                     //               child: Padding(
          //                     //                 padding: const EdgeInsets.only(left: 5.0),
          //                     //                 child:  Text(
          //                     //                   data,style: const TextStyle(fontSize: 13,color: Colors.grey),
          //                     //                 ),
          //                     //               ),
          //                     //             )
          //                     //         ],
          //                     //       ),
          //                     //     )
          //                     // ),
          //                     SizedBox(height: 5.0,),
          //                     Row(
          //                       children: [
          //                         Text('\u{20B9} ${item?.price}',
          //                           style:  GoogleFonts.montserrat(fontSize: 12,color: black,fontWeight: FontWeight.w500),),
          //                         SizedBox(width: 5,),
          //                         Text('\u{20B9}300',
          //                           style:  GoogleFonts.montserrat(fontSize: 12,
          //                               color: grey,fontWeight: FontWeight.w500,
          //                               decoration: TextDecoration.lineThrough),
          //                         ),
          //                       ],
          //                     ),
          //                     Spacer(),
          //                     // Container(
          //                     //   height: 35,
          //                     //   child: Row(
          //                     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     //     children: [
          //                     //       SizedBox(width: 80,),
          //                     //       Obx(() => SizedBox(
          //                     //         width: 100,
          //                     //         child: _cartListApiController.getCartListModel!.newmodel!.cartList![index].quantity! >= 1 ?
          //                     //         ElevatedButton(
          //                     //           style: ElevatedButton.styleFrom(
          //                     //               primary: Colors.redAccent, // background
          //                     //               onPrimary: white,
          //                     //               elevation: 0
          //                     //           ),
          //                     //           onPressed: () {
          //                     //             _specialProductController.AddToCart("${_specialProductController.specialProductModel?.specialProducts?[index].id}");
          //                     //             //_specialProductController.isButtonHide.value = !_specialProductController.isButtonHide.value;
          //                     //           },
          //                     //           child: Text("Add",
          //                     //             style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
          //                     //         )
          //                     //             :
          //                     //         //increment decrement button
          //                     //         Container(
          //                     //           width: 90,
          //                     //           height: 28,
          //                     //           decoration: BoxDecoration(
          //                     //             border:  Border.all(width: 0.5,color: Colors.redAccent),
          //                     //             borderRadius: BorderRadius.circular(5),
          //                     //           ),
          //                     //           child: Row(
          //                     //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     //             children: [
          //                     //               InkWell(
          //                     //                   onTap: () {
          //                     //                     _cartListApiController.decrementCartItemApi(item?.id);
          //                     //                     Timer(const Duration(seconds: 1), () =>  _cartListApiController.getCartListApi());
          //                     //                   },
          //                     //                   child: const Icon(
          //                     //                     Icons.remove,
          //                     //                     color: Colors.redAccent,
          //                     //                     size: 20,
          //                     //                   )),
          //                     //               Container(
          //                     //                 width: 20,
          //                     //                 color: Colors.redAccent,
          //                     //                 child: Center(
          //                     //                   child: Text("${item?.quantity}",
          //                     //                     style: TextStyle(color: Colors.white, fontSize: 14),
          //                     //                   ),
          //                     //                 ),
          //                     //               ),
          //                     //               InkWell(
          //                     //                   onTap: () {
          //                     //                     _cartListApiController.incrementCartItemApi(item?.id);
          //                     //                     Timer(const Duration(seconds: 1), () =>  _cartListApiController.getCartListApi());
          //                     //                   },
          //                     //                   child: const Icon(
          //                     //                     Icons.add,
          //                     //                     color: Colors.redAccent,
          //                     //                     size: 20,
          //                     //                   )),
          //                     //             ],
          //                     //           ),
          //                     //         ),
          //                     //       ),)
          //                     //     ],
          //                     //   ),
          //                     // ),
          //
          //                     Container(
          //                       height: 35,
          //                       child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           SizedBox(width: 80,),
          //                           SizedBox(
          //                               width: 100,
          //                               child: ElevatedButton(
          //                                 style: ElevatedButton.styleFrom(
          //                                     primary: Colors.redAccent, // background
          //                                     onPrimary: white,
          //                                     elevation: 0
          //                                 ),
          //                                 onPressed: ()async{
          //                                   _specialProductController.AddToCart("${_specialProductController.specialProductModel?.specialProducts?[index].id}");
          //                                 },
          //                                 child: Text('Add',
          //                                   style:  GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w600),),
          //                               )
          //                           )
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }),
        ));
  }
}
