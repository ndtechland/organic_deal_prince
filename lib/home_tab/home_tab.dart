// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/controller/hometab_controller/hometab_controller.dart';
import 'package:organic_deal/controller/hot_details_controller/hot_details_controller.dart';
import 'package:organic_deal/controller/recommendedProduct_controller/recommendedProduct_controller.dart';
import 'package:organic_deal/controller/specialProduct_controller/specialProduct_controller.dart';
import 'package:organic_deal/pages/hot_details.dart';
import 'package:organic_deal/pages/recommend_product.dart';
import 'package:organic_deal/pages/special_products.dart';
import 'package:organic_deal/pages/shop_category_page.dart';
import '../colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _design = 1; // for colored uncolored design
  final HomeTabController _homeTabController = Get.put(HomeTabController());
  final SpecialProductController _specialProductController =
      Get.put(SpecialProductController());
  RecommendedProductController _recommendedProductController =
      Get.put(RecommendedProductController());
  HotDetailsController _hotDetailsController = Get.put(HotDetailsController());
  final List _color = [Color(0xff065535), Color(0xff64285d), Color(0xff23033a)];
  @override
  Widget build(BuildContext context) {
    var base = 'https://admin.organicdeal.in/Images/';
    Size size = MediaQuery.of(context).size;
    return Column(
      //tODO: O0K
      children: [
        SizedBox(
          height: size.height * 0.25,
          child: _image_carousel(),
        ),
        Obx(() => (_homeTabController.isloading.value)
            ? Center(
                child: CircularProgressIndicator(
                  color: white,
                ),
              )
            : _homeTabController.getshopbycategorylist?.category.length == 0
                ? Center(
                    child: Text("No Data"),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 3.0, right: 3),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: _design == 0
                                  ? Colors.grey.shade500
                                  : Color(0xff711a14),
                              width: 0.5)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 1,
                            ),
                            // width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                                color: _design == 0 ? white : Color(0xff800000),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Shop by category'.toUpperCase(),
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: _design == 0 ? grey : white,
                                          fontWeight: FontWeight.w600)),
                                  Image.asset(
                                    'assets/images/discount.png',
                                    scale: 18,
                                  )
                                ],
                              ),
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            itemCount:
                                12, //_homeTabController.getshopbycategorylist?.category.length,
                            itemBuilder: (ctx, i) {
                              final items = _homeTabController
                                  .getshopbycategorylist?.category[i];
                              return GestureDetector(
                                onTap: () async {
                                  var prefs = GetStorage();
                                  prefs.write(
                                      "categoryId", "${items?.id.toString()}");
                                  Get.to(ShopCategoryPage());
                                  //  FocusScope.of(context).unfocus();
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>
                                  // ShopCategoryPage(id: items?.id.toString(),)));
                                },
                                child: Stack(fit: StackFit.expand, children: [
                                  GridTile(
                                    child: Container(
                                        decoration: _design == 0
                                            ? BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey.shade500,
                                                    width: 0.1))
                                            : BoxDecoration(
                                                border: Border.all(
                                                  width: 0.5,
                                                  color:
                                                      const Color(0xff711a14),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(
                                                  8.0,
                                                ) //                 <--- border radius here
                                                        ),
                                              ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CircleAvatar(
                                                radius: 43,
                                                backgroundColor:
                                                    Colors.grey.shade200,
                                                child: CircleAvatar(
                                                  backgroundColor: white,
                                                  radius: 38,
                                                  backgroundImage: NetworkImage(
                                                      '$base${items?.categoryImage.toString()}'),
                                                ),
                                              ),
                                              Text(
                                                  '${items?.categoryName.toString()}',
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 9,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              _design == 0
                                                  ? RichText(
                                                      text: TextSpan(
                                                        text: 'MIN. ',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 11,
                                                                color: black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                '${items?.upToText}% OFF',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        11,
                                                                    color: Colors
                                                                            .red[
                                                                        900], //Color(0xffB30000),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Stack(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 2,
                                                                  left: 7,
                                                                  right: 7),
                                                          //  width: 80,
                                                          height: 18,
                                                          decoration: const BoxDecoration(
                                                              color: Color(
                                                                  0xff800000),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          3))),
                                                          child: Center(
                                                            child: Text(
                                                                'UP TO ${items?.upToText}% OFF',
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize: 9,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ),
                                                        ),
                                                        const Positioned(
                                                            top: 5,
                                                            right: 1,
                                                            child: Icon(
                                                              Icons.star,
                                                              size: 12,
                                                              color:
                                                                  Colors.amber,
                                                            )),
                                                        const Positioned(
                                                            top: 5,
                                                            left: 1,
                                                            child: Icon(
                                                              Icons.star,
                                                              size: 12,
                                                              color:
                                                                  Colors.amber,
                                                            ))
                                                      ],
                                                    ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Positioned(
                                      top: 3,
                                      left: 3,
                                      child: _design == 0
                                          ? Container()
                                          : Icon(
                                              Icons.ac_unit,
                                              size: 14,
                                              color: Color(0xffFD2AC47),
                                            ))
                                ]),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.9,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 1,
                              // mainAxisExtent: 110,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        //top offers
        ////top offer
        // Padding(
        //   padding: const EdgeInsets.only(left: 3.0,right: 3.0),
        //   child: Container(
        //     margin: EdgeInsets.only(bottom: 1,),
        //     // width: 80,
        //     height: 50,
        //     decoration:  BoxDecoration(
        //         color: _design == 0 ? white : Color(0xff800000),
        //         borderRadius: BorderRadius.all(Radius.circular(3))
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //               'Top offers'.toUpperCase(),
        //               style:GoogleFonts.montserrat(fontSize: 16,color:_design==0 ? grey : white,fontWeight: FontWeight.w600)
        //           ),
        //           Image.asset('assets/images/discount.png',scale: 18,)
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: SizedBox(
        //     height: 230,
        //     child: ListView.builder(
        //       itemCount: 3,
        //         shrinkWrap: true,
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (context,index){
        //       return Container(
        //         margin: EdgeInsets.only(right: 1,left: 1),
        //         color: Colors.grey[200],
        //         child: Column(
        //           children: [
        //             Container(
        //               height: 200,
        //               width: 150,
        //              // margin: EdgeInsets.only(bottom: 50),
        //               decoration:  BoxDecoration(
        //                 color: _color[index],
        //                 borderRadius: const BorderRadius.only(
        //                   bottomLeft: Radius.circular(100.0),
        //                 ),
        //               ),
        //               child: Column(
        //                 children: [
        //                   Text("upto 50% off".toUpperCase(),textAlign: TextAlign.center,
        //                       style:GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w600)),
        //                 ],
        //               ),
        //             ),
        //             SizedBox(height: 10,),
        //             Text("fruits & Vegetables".toUpperCase(),textAlign: TextAlign.center,
        //                 style:GoogleFonts.montserrat(fontSize: 12,color: _color[index],fontWeight: FontWeight.w600)),
        //           ],
        //         ),
        //       );
        //     }),
        //   )
        // ),
        // fruits & vegetables

        // special products
        Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3),
          child: Card(
            elevation: 1,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff711a14), width: 0.5)),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: _design == 0 ? white : Color(0xff800000),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Special Products".toUpperCase(),
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: _design == 0 ? grey : white,
                                fontWeight: FontWeight.w600)),
                        Image.asset(
                          'assets/images/discount.png',
                          scale: 18,
                        )
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => (_specialProductController.isloading.value)
                      ? Center(
                          child: CircularProgressIndicator(
                          color: white,
                        ))
                      // : _homeTabController.specialProductModel?.specialProducts?.length==0
                      // ? Center(child: Text("No Data"),)
                      : GestureDetector(
                          onTap: () {
                            Get.to(SpecialProducts());
                          },
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            itemCount: 4,
                            itemBuilder: (ctx, index) {
                              var discount = _specialProductController
                                  .specialProductModel
                                  ?.specialProducts?[index]
                                  .discountPrice;
                              var discount1 = discount.toInt();
                              return GridTile(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 0.1)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 120,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: const EdgeInsets.only(
                                            left: 15, top: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.network(
                                            "$base${_specialProductController.specialProductModel?.specialProducts?[index].productImage}",
                                            fit: BoxFit.cover,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return Center(
                                                  child: Icon(
                                                Icons.image,
                                                color: grey,
                                              )
                                                  // const Text('😢',style: TextStyle(fontSize: 20),)
                                                  );
                                            },
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Container(
                                                height: 18,
                                                child: Text(
                                                    _specialProductController
                                                            .specialProductModel
                                                            ?.specialProducts?[
                                                                index]
                                                            .productName ??
                                                        'text',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 12,
                                                      color: black,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 3,
                                                height: 10,
                                                color: red,
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                  'upto ${discount1}% off'
                                                      .toUpperCase(),
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 1.9, //0.97,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              // mainAxisExtent: 110,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
        // hot details
        Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3),
          child: Card(
            elevation: 1,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff711a14), width: 0.5)),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: _design == 0 ? white : Color(0xff800000),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Hot Details".toUpperCase(),
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: _design == 0 ? grey : white,
                                fontWeight: FontWeight.w600)),
                        Image.asset(
                          'assets/images/discount.png',
                          scale: 18,
                        )
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => (_hotDetailsController.isLoading.value)
                      ? Center(
                          child: CircularProgressIndicator(
                          color: white,
                        ))
                      : _hotDetailsController.gethotDetails?.hotDeals?.length ==
                              0
                          ? Center(
                              child: Text("No Data"),
                            )
                          : GestureDetector(
                              onTap: () {
                                Get.to(HotDetails());
                              },
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                itemCount: 4,
                                itemBuilder: (ctx, index) {
                                  final item = _hotDetailsController
                                      .gethotDetails?.hotDeals?[index];
                                  var discount = _hotDetailsController
                                      .gethotDetails
                                      ?.hotDeals?[index]
                                      .discountPrice;
                                  var discount1 = discount.toInt();
                                  return GridTile(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 0.1)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            height: 120,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                bottomLeft:
                                                    Radius.circular(10.0),
                                              ),
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 15, top: 5),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image.network(
                                                "$base${item?.productImage ?? ''}",
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return Center(
                                                      child: Icon(
                                                    Icons.image,
                                                    color: grey,
                                                  ));
                                                },
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Container(
                                                    height: 18,
                                                    child: Text(
                                                        item?.productName ??
                                                            'text',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 12,
                                                          color: black,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 3,
                                                    height: 10,
                                                    color: red,
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                      'upto ${discount1}% off'
                                                          .toUpperCase(),
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 12,
                                                              color: black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 1.9, //0.97,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  // mainAxisExtent: 110,
                                ),
                              ),
                            ),
                ),
              ],
            ),
          ),
        ),
        //recommendProducts
        Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3),
          child: Card(
            elevation: 1,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff711a14), width: 0.5)),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: _design == 0 ? white : Color(0xff800000),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recommend Product".toUpperCase(),
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: _design == 0 ? grey : white,
                                fontWeight: FontWeight.w600)),
                        Image.asset(
                          'assets/images/discount.png',
                          scale: 18,
                        )
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => (_recommendedProductController.isloading.value)
                      ? Center(
                          child: CircularProgressIndicator(
                          color: white,
                        ))
                      // : _homeTabController.getrecommendproduct?.recommendProducts == null
                      // ? Center(child: Text("No Data"),)
                      : GestureDetector(
                          onTap: () {
                            Get.to(() => RecommendProductPage());
                          },
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            itemCount: 4,
                            itemBuilder: (ctx, index) {
                              final item = _recommendedProductController
                                  .getrecommendproduct
                                  ?.recommendProducts?[index];
                              var discount = item?.discountPrice;
                              var discount1 = discount.toInt();
                              return GridTile(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 0.1)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 120,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: const EdgeInsets.only(
                                            left: 15, top: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.network(
                                            "$base${item?.productImage}",
                                            fit: BoxFit.cover,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return Center(
                                                  child: Icon(
                                                Icons.image,
                                                color: grey,
                                              ));
                                            },
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Container(
                                                height: 18,
                                                child: Text(
                                                    item?.productName ?? 'text',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 12,
                                                      color: black,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 3,
                                                height: 10,
                                                color: red,
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                  'upto ${discount1}% off'
                                                      .toUpperCase(),
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 1.9, //0.97,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              // mainAxisExtent: 110,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
    //   Scaffold(
    //   key: _key,
    //   drawer: _drawer(),
    //   body:  Column(
    //     children: [
    //       image_carousel,
    //       // Container(
    //       //   height: 170,
    //       //   width: double.infinity,
    //       //   color: Colors.grey,
    //       // ),
    //       Padding(
    //         padding: const EdgeInsets.all(5.0),
    //         child: Row(
    //           children: [
    //             Text("Category",style: TextStyle(fontSize: 18),),
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 5.0,right: 5),
    //         child: Card(
    //           elevation: 0,
    //           shape: RoundedRectangleBorder(
    //               side: BorderSide(color: Colors.black38)
    //           ),
    //           child: Center(
    //             child: GridView.builder(
    //               shrinkWrap: true,
    //               physics: NeverScrollableScrollPhysics(),
    //               padding: const EdgeInsets.symmetric(horizontal: 5),
    //               itemCount: title.length,//12,
    //               itemBuilder: (ctx, i) {
    //                 return Container(
    //                   child: Stack(
    //                     children: [
    //                       Column(
    //                         // crossAxisAlignment: CrossAxisAlignment.stretch,
    //                         children: [
    //                           Container(
    //                             height: 70,
    //                             color: Colors.grey.shade100,),
    //                           Text(
    //                             title[i],// 'Title',
    //                             style: const TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           RichText(
    //                               textAlign: TextAlign.left,
    //                               text: const TextSpan(
    //                                   text: 'MIN.',style: TextStyle(color: Colors.black,fontSize: 8),
    //                                   children: [
    //                                     TextSpan(
    //                                         text: '25% OFF',
    //                                         style: TextStyle(fontSize: 10,color: Colors.red)
    //                                     )
    //                                   ]
    //                               )),
    //                           const Divider()
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 3,
    //                 childAspectRatio: 0.97,
    //                 crossAxisSpacing: 1,
    //                 mainAxisSpacing: 1,
    //                 // mainAxisExtent: 110,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    //   // body: CustomScrollView(
    //   //   slivers: [
    //   //     SliverAppBar(
    //   //       floating: true,
    //   //       pinned: true,
    //   //       snap: false,
    //   //       elevation: 0,
    //   //       centerTitle: true,
    //   //       backgroundColor: green,
    //   //       leading: IconButton(
    //   //         icon: Image.asset('assets/images/hamburger.png',scale: 25,color: white,),
    //   //         onPressed: (){_key.currentState?.openDrawer();},
    //   //       ),
    //   //       title:  Image.asset('assets/images/logo1.png',scale: 12,fit: BoxFit.cover,),
    //   //       actions: [
    //   //         IconButton(
    //   //           icon: Image.asset('assets/images/ringing.png',scale: 25,color: white,),
    //   //           onPressed: () {},
    //   //         ),
    //   //       ],
    //   //       bottom: AppBar(
    //   //         elevation: 0,
    //   //         backgroundColor: green,
    //   //         automaticallyImplyLeading: false,
    //   //         title: Container(
    //   //           width: double.infinity,
    //   //           height: 40,
    //   //           decoration: BoxDecoration(
    //   //               color: Colors.white,
    //   //               borderRadius: BorderRadius.circular(5)),
    //   //           child: Center(
    //   //             child: TextField(
    //   //               cursorColor: green,
    //   //               decoration: InputDecoration(
    //   //                   border: InputBorder.none,
    //   //                   isDense: true,
    //   //                   hintText: 'Search for something',
    //   //                   hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
    //   //                   prefixIcon: Icon(Icons.search,color: Colors.grey,size: 22,),
    //   //                   suffixIcon: Icon(Icons.mic,color: Colors.grey,size: 22,)),
    //   //             ),
    //   //           ),
    //   //         ),
    //   //       ),
    //   //     ),
    //   //     // Other Sliver Widgets
    //   //     SliverList(
    //   //       delegate: SliverChildListDelegate([
    //   //        Column(
    //   //          children: [
    //   //            image_carousel,
    //   //            // Container(
    //   //            //   height: 170,
    //   //            //   width: double.infinity,
    //   //            //   color: Colors.grey,
    //   //            // ),
    //   //            Padding(
    //   //              padding: const EdgeInsets.all(5.0),
    //   //              child: Row(
    //   //                children: [
    //   //                  Text("Category",style: TextStyle(fontSize: 18),),
    //   //                ],
    //   //              ),
    //   //            ),
    //   //            Padding(
    //   //              padding: const EdgeInsets.only(left: 5.0,right: 5),
    //   //              child: Card(
    //   //                elevation: 0,
    //   //                shape: RoundedRectangleBorder(
    //   //                    side: BorderSide(color: Colors.black38)
    //   //                ),
    //   //                child: Center(
    //   //                  child: GridView.builder(
    //   //                    shrinkWrap: true,
    //   //                    physics: NeverScrollableScrollPhysics(),
    //   //                    padding: const EdgeInsets.symmetric(horizontal: 5),
    //   //                    itemCount: title.length,//12,
    //   //                    itemBuilder: (ctx, i) {
    //   //                      return Container(
    //   //                        child: Stack(
    //   //                          children: [
    //   //                            Column(
    //   //                             // crossAxisAlignment: CrossAxisAlignment.stretch,
    //   //                              children: [
    //   //                                Container(
    //   //                                  height: 70,
    //   //                                  color: Colors.grey.shade100,),
    //   //                                Text(
    //   //                                 title[i],// 'Title',
    //   //                                  style: const TextStyle(
    //   //                                    fontSize: 8,
    //   //                                  ),
    //   //                                ),
    //   //                                RichText(
    //   //                                  textAlign: TextAlign.left,
    //   //                                    text: const TextSpan(
    //   //                                      text: 'MIN.',style: TextStyle(color: Colors.black,fontSize: 8),
    //   //                                      children: [
    //   //                                        TextSpan(
    //   //                                          text: '25% OFF',
    //   //                                          style: TextStyle(fontSize: 10,color: Colors.red)
    //   //                                        )
    //   //                                      ]
    //   //                                    )),
    //   //                                const Divider()
    //   //                              ],
    //   //                            ),
    //   //                          ],
    //   //                        ),
    //   //                      );
    //   //                    },
    //   //                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //   //                      crossAxisCount: 3,
    //   //                      childAspectRatio: 0.97,
    //   //                      crossAxisSpacing: 1,
    //   //                      mainAxisSpacing: 1,
    //   //                     // mainAxisExtent: 110,
    //   //                    ),
    //   //                  ),
    //   //                ),
    //   //              ),
    //   //            ),
    //   //          ],
    //   //        ),
    //   //       ]),
    //   //     ),
    //   //   ],
    //   // ),
    // );
  }

  // _drawer(){
  //   return Drawer(
  //     child: Column(
  //       children: [
  //         //Drawer header for Heading part of drawer
  //         DrawerHeader(
  //           decoration:  BoxDecoration(
  //               color: white//green.withOpacity(0.9),
  //           ),
  //           //Title of header
  //           child: Image.asset('assets/images/logo1.png',scale: 7,),
  //         ),
  //         //Child tile of drawer with specified title
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: (){},
  //                 style: ElevatedButton.styleFrom(
  //                     elevation: 0,
  //                     shape: const CircleBorder(),
  //                     primary: Colors.red,
  //                     fixedSize: const Size(20,20)
  //                 ),
  //                 child: const Icon(Icons.home,size: 14,)),
  //             Text("Home"),
  //             Spacer(),
  //             Icon(Icons.arrow_forward_ios_rounded,size: 12,),
  //           ],
  //         ),
  //         SizedBox(height: 5,),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: (){},
  //                 style: ElevatedButton.styleFrom(
  //                     elevation: 0,
  //                     shape: const CircleBorder(),
  //                     primary: Colors.indigo,
  //                     fixedSize: const Size(20,20)
  //                 ),
  //                 child: const Icon(Icons.person,size: 14,)),
  //             Text("Profile"),
  //             Spacer(),
  //             Icon(Icons.arrow_forward_ios_rounded,size: 12,),
  //           ],
  //         ),
  //         SizedBox(height: 5,),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: (){},
  //                 style: ElevatedButton.styleFrom(
  //                     elevation: 0,
  //                     shape: const CircleBorder(),
  //                     primary: green,
  //                     fixedSize: const Size(20,20)
  //                 ),
  //                 child: const Icon(Icons.shopping_bag,size: 14,)),
  //             Text("My Cart"),
  //             Spacer(),
  //             Icon(Icons.arrow_forward_ios_rounded,size: 12,),
  //           ],
  //         ),
  //         SizedBox(height: 5,),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: (){},
  //                 style: ElevatedButton.styleFrom(
  //                     elevation: 0,
  //                     shape: const CircleBorder(),
  //                     primary: Colors.deepOrangeAccent,
  //                     fixedSize: const Size(20,20)
  //                 ),
  //                 child: const Icon(Icons.notifications,size: 14,)),
  //             Text("Notification"),
  //             Spacer(),
  //             Icon(Icons.arrow_forward_ios_rounded,size: 12,),
  //           ],
  //         ),
  //         Divider(),
  //         SizedBox(height: 5,),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: (){},
  //                 style: ElevatedButton.styleFrom(
  //                     elevation: 0,
  //                     shape: const CircleBorder(),
  //                     primary: Colors.pink,
  //                     fixedSize: const Size(20,20)
  //                 ),
  //                 child: const Icon(Icons.card_giftcard,size: 14,)),
  //             Text("Gift Card"),
  //             Spacer(),
  //             Icon(Icons.arrow_forward_ios_rounded,size: 12,),
  //           ],
  //         ),
  //         Spacer(),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: (){},
  //                 style: ElevatedButton.styleFrom(
  //                     elevation: 0,
  //                     shape: const CircleBorder(),
  //                     primary: Colors.yellow,
  //                     fixedSize: const Size(20,20)
  //                 ),
  //                 child: const Icon(Icons.chat_bubble,size: 14,)),
  //             Text("Privacy Policy" ,),
  //             Spacer(),
  //             Icon(Icons.arrow_forward_ios_rounded,size: 12,),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: (){},
  //                 style: ElevatedButton.styleFrom(
  //                     elevation: 0,
  //                     shape: const CircleBorder(),
  //                     primary: Colors.yellow,
  //                     fixedSize: const Size(20,20)
  //                 ),
  //                 child: const Icon(Icons.chat_bubble,size: 14,)),
  //             Text("FAQ"),
  //             Spacer(),
  //             Icon(Icons.arrow_forward_ios_rounded,size: 12,),
  //           ],
  //         ),
  //         SizedBox(height: 5,),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: (){},
  //                 style: ElevatedButton.styleFrom(
  //                     elevation: 0,
  //                     shape: const CircleBorder(),
  //                     primary: Colors.teal,
  //                     fixedSize: const Size(20,20)
  //                 ),
  //                 child: const Icon(Icons.login_sharp,size: 14,)),
  //             Text("Login/Sign Up"),
  //             Spacer(),
  //             Icon(Icons.arrow_forward_ios_rounded,size: 12,),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // Widget _getListData(i) {
  //   return
  // }
  _image_carousel() {
    final base = 'https://admin.organicdeal.in/Images/';
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => (_homeTabController.isloading.value)
          ? Center(child: CircularProgressIndicator())
          // : _homeTabController.getsliderbaner?.banner.length==0
          // ? Center(child: Text('No data'),)
          :
          // Container(child:
          //       CarouselSlider(
          //         items: _homeTabController.getsliderbaner?.banner?.map((i) {
          //           return Builder(
          //             builder: (BuildContext context) {
          //               return Container(
          //                   width: MediaQuery.of(context).size.width,
          //                   decoration: BoxDecoration(color: Colors.amber),
          //                   child: GestureDetector(
          //                       child: Image.network(base+i!.bannerPath.toString(), fit: BoxFit.cover),
          //                       onTap: () {
          //                         Navigator.push<Widget>(
          //                           context,
          //                           MaterialPageRoute(
          //                             builder: (context) => ImageScreen(base+i.bannerPath.toString()),
          //                           ),
          //                         );
          //                       }));
          //             },
          //           );
          //         }).toList(),
          //         options: CarouselOptions(
          //           autoPlay: true,
          //           viewportFraction: 1.0,
          //           enableInfiniteScroll: true,
          //           enlargeCenterPage: true,
          //           scrollDirection: Axis.horizontal,
          //           autoPlayInterval: Duration(seconds: 3),
          //           autoPlayAnimationDuration: Duration(milliseconds: 800),
          //           autoPlayCurve: Curves.fastOutSlowIn,
          //           onPageChanged:(index,reason) {
          //              pageIndex = index;
          //              setState(() {});
          //           },
          //           height: 180.0,),
          //       ),
          // )
          SizedBox(
              height: size.height * 0.25,
              child: CarouselSlider.builder(
                unlimitedMode: true,
                autoSliderTransitionTime: Duration(seconds: 1),
                slideBuilder: (index) {
                  var item = _homeTabController.getsliderbaner?.banner;
                  return InkWell(
                    onTap: () {
                      Get.to(ImageScreen);
                    },
                    child: Container(
                      //height: 260,
                      alignment: Alignment.center,
                      child: Container(
                        // height: size.height * 0.38,
                        width: size.width,
                        // height: 26.h,
                        child: Image.network(
                          '$base${item?[index].bannerPath ?? ''}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                slideTransform: DefaultTransform(),
                slideIndicator: CircularSlideIndicator(
                  indicatorBorderWidth: 3,
                  indicatorRadius: 2.5,
                  itemSpacing: 7,
                  currentIndicatorColor: green,
                  padding: EdgeInsets.only(bottom: 3),
                ),
                itemCount:
                    3, //_homeTabController.getsliderbaner!.banner.length,
                enableAutoSlider: true,
              ),
            ),
    );
  }
}

class ImageScreen extends StatefulWidget {
  final String url;
  ImageScreen(this.url);

  @override
  _MyImageScreen createState() => _MyImageScreen(url);
}

class _MyImageScreen extends State<ImageScreen> {
  final String url;
  _MyImageScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          title: Text('ImageScreen'),
        ),
        body: Image.network(url, width: double.infinity));
  }
}
