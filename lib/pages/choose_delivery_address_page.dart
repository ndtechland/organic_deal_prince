import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/cartListApi_controller/cartListApi_controller.dart';
import 'package:organic_deal/controller/choose_delivery_address_controller/choose_delivery_address_controller.dart';
import 'package:organic_deal/controller/coupon_controller/coupon_controller.dart';
import 'package:organic_deal/controller/rozaypay_controller/rozarpay_controller.dart';
import 'package:organic_deal/pages/add_new_address.dart';

class ChooseDeliveryAddressPage extends StatefulWidget {
  const ChooseDeliveryAddressPage({Key? key}) : super(key: key);

  @override
  State<ChooseDeliveryAddressPage> createState() =>
      _ChooseDeliveryAddressPageState();
}

class _ChooseDeliveryAddressPageState extends State<ChooseDeliveryAddressPage> {
  ChooseDeliveryAddressController _chooseDeliveryAddressController =
      Get.put(ChooseDeliveryAddressController());
  final CartListApiController _cartListApiController =
      Get.put(CartListApiController());
  CouponController _couponController = Get.put(CouponController());
  // ignore: unused_field
  final List _title = ['Rahul Kumar Singh', 'Aman', 'Amit'];
  List _colorStart = [
    Color(0xfffbb040),
    Color(0xff7f00ff),
    Color(0xfff078513),
    Color(0xffB54203),
    Color(0xff7f00ff)
  ];
  List _colorEnd = [
    Color(0xfff9ed32),
    Color(0xffe100ff),
    Color(0xffC7F800),
    Color(0xff0D1C09),
    Color(0xffe100ff)
  ];
  // ignore: unused_field
  final TextEditingController _txtcontroller = TextEditingController();
  String ab = '';
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _controller.text = '';
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final datacount = GetStorage();
    // ignore: unused_local_variable
    var price1 = datacount.read('count');
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // totalprice=prefs.getString("totalPriceAfterDeductedAmt").toString();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Text('Choose Delivery Address',
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
      body: Column(
        children: [
          Container(
            height: size.height * 0.06, //50,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saved Address".toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: size.height * 0.019,
                        color: grey,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AddNewAddress());
                    },
                    child: Text(
                      "+add new address".toUpperCase(),
                      style: GoogleFonts.montserrat(
                          fontSize: size.height * 0.019,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => _chooseDeliveryAddressController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : _chooseDeliveryAddressController.getaddressSelectModel
                              ?.getDeliverAddress?.length ==
                          0
                      ? Text("No Data")
                      : ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                                height: 1.0,
                              ),
                          itemCount: _chooseDeliveryAddressController
                              .getaddressSelectModel!
                              .getDeliverAddress!
                              .length, //_title.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var item = _chooseDeliveryAddressController
                                .getaddressSelectModel?.getDeliverAddress;
                            return InkWell(
                              onTap: () {
                                _chooseDeliveryAddressController.toggle(index);
                                var a = _chooseDeliveryAddressController
                                    .isSelected.value
                                    .toString();
                                var name = "${item?[index].firstName}" +
                                    "${item?[index].lastName}";
                                print("Selected address: ${name}");
                              },
                              child: Card(
                                child: Container(
                                  width: double.infinity,
                                  color: white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(
                                          () => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${item?[index].firstName}${item?[index].lastName}",
                                                style: GoogleFonts.montserrat(
                                                    fontSize:
                                                        size.height * 0.019,
                                                    color: grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              _chooseDeliveryAddressController
                                                          .isSelected.value ==
                                                      index
                                                  ? Icon(
                                                      Icons
                                                          .radio_button_checked_sharp,
                                                      color: green,
                                                    )
                                                  : Icon(
                                                      Icons.circle_outlined,
                                                      color: green,
                                                    ),
                                            ],
                                          ),
                                        ),
                                        Text("${item?[index].houseNo}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: size.height * 0.018,
                                                color: grey,
                                                fontWeight: FontWeight.w500)),
                                        Text("${item?[index].landmark}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: size.height * 0.018,
                                                color: grey,
                                                fontWeight: FontWeight.w500)),
                                        Text("${item?[index].streetDetail}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: size.height * 0.018,
                                                color: grey,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            "Ph: ${item?[index].contactNumber}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: size.height * 0.018,
                                                color: grey,
                                                fontWeight: FontWeight.w500)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Pin: ${item?[index].pincode}",
                                                style: GoogleFonts.montserrat(
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: grey,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text("Edit",
                                                style: GoogleFonts.montserrat(
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
            ),
          ),
          Obx(
            () => _couponController.isLoading.value
                ? Container(
                    width: double.infinity,
                    height: size.height * 0.16,
                    child: Center(
                      child: CircularProgressIndicator(color: green),
                    ))
                : Container(
                    width: double.infinity,
                    height: size.height * 0.16,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount:
                            4, //_couponController.getCouponListModel?.result.length,
                        itemBuilder: (context, index) {
                          var item =
                              _couponController.getCouponListModel?.result;
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: ClipPath(
                                clipper: CuponClipper(),
                                child: InkWell(
                                  onTap: () async {
                                    _couponController.CouponApply(
                                        "${item?[index].couponCode}");
                                    Timer(
                                        const Duration(seconds: 1),
                                        () =>
                                            _couponController.getSubTotalApi());
                                    //  _cartListApiController.getCartListApi());
                                    // setState(() {
                                    //   _controller.text = "${item?[index].couponCode}"; //set output date to TextField value.
                                    // });

                                    // var newText = item?[index].couponCode;
                                    // final updatedText = _txtcontroller.text + newText!;
                                    // _txtcontroller.value = _txtcontroller.value.copyWith(
                                    //     text: updatedText,
                                    //     selection: TextSelection.collapsed(offset: updatedText.length));

                                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                                    // prefs.setString("coupon", "${item?[index].couponCode}");
                                    // ab= prefs.getString("coupon")! ;
                                    // print("ab: ${ab}");
                                  },
                                  child: Container(
                                      height: size.height * 0.16,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: <Color>[
                                              _colorStart[index],
                                              _colorEnd[index]
                                            ]),
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${item?[index].couponCode}",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: size.height * 0.026,
                                                  color: white,
                                                  fontWeight: FontWeight.w600)),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0, right: 15.0),
                                            child: Text(
                                                "Get Instant discount of ${item?[index].amount}% on applying this coupon",
                                                style: GoogleFonts.montserrat(
                                                    fontSize:
                                                        size.height * 0.017,
                                                    color: white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          ),
          // Container(
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     border: Border.all(
          //       color: Colors.grey.shade300,
          //     ),
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   height: size.height * 0.07,
          //   margin: EdgeInsets.symmetric(horizontal: 0),
          //   child: ClipRRect(
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child:
          //               TextField(
          //                 controller: _controller,
          //                 decoration: const InputDecoration(
          //                     border: InputBorder.none,
          //                     contentPadding: EdgeInsets.only(left: 10)),
          //                 onChanged: (value){
          //                     ab = value.toString();
          //                   //  SharedPreferences prefs = await SharedPreferences.getInstance();
          //                   // var a = prefs.getString("coupon");
          //                   // print("coupon: $a");
          //                   //  _txtcontroller.text=value.toString();
          //                 },
          //               ),
          //
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Color(0xffE74C3C),
          //             borderRadius: BorderRadius.only(
          //                 topRight: Radius.circular(5),
          //                 bottomRight: Radius.circular(5)),
          //           ),
          //           alignment: Alignment.center,
          //           padding: EdgeInsets.symmetric(horizontal: 8),
          //           child: InkWell(
          //               child: Text(
          //                 'Apply Coupon',
          //                 style:GoogleFonts.montserrat(fontSize: size.height * 0.017,color: white,
          //                     fontWeight: FontWeight.w600),
          //               )),
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          Obx(
            () => _couponController.isLoading.value
                ? Center(
                    child: Text("Loading..."),
                  )
                : Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sub total",
                                  style: GoogleFonts.montserrat(
                                      fontSize: size.height * 0.019,
                                      color: black,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  "\u{20B9} ${_couponController.getSubTotalModel?.newmodeld?.totalprice ?? 0}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: size.height * 0.019,
                                      color: black,
                                      fontWeight: FontWeight.w500)),
                              // Obx(()=>_couponController.isLoading.value ?
                              //     Container(height: 2,width: 2,child: Center(child: CircularProgressIndicator(color: white,),))
                              // :
                              //    Text(price1=='' ? "\u{20B9} ${_couponController.getSubTotalModel?.newmodel?.cartList?[0].totalPrice}"
                              //       : "\u{20B9} ${price1 ?? 0}",
                              //       style:GoogleFonts.montserrat(fontSize: size.height * 0.019,color: black,
                              //           fontWeight: FontWeight.w500)),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shipping",
                                  style: GoogleFonts.montserrat(
                                      fontSize: size.height * 0.019,
                                      color: black,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  "\u{20B9} ${_couponController.getSubTotalModel?.newmodeld?.shipping ?? 0}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: size.height * 0.019,
                                      color: black,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Gst",
                                  style: GoogleFonts.montserrat(
                                      fontSize: size.height * 0.019,
                                      color: black,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  "\u{20B9} ${_couponController.getSubTotalModel?.newmodeld?.gst ?? 0}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: size.height * 0.019,
                                      color: black,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",
                                  style: GoogleFonts.montserrat(
                                      fontSize: size.height * 0.020,
                                      color: black,
                                      fontWeight: FontWeight.w600)),
                              Text(
                                  "\u{20B9}  ${_couponController.getSubTotalModel?.newmodeld?.grandTotals ?? 0}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: size.height * 0.020,
                                      color: black,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: size.height * 0.062,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xffE74C3C),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0)),
                              // minimumSize: Size(50, 40),
                            ),
                            onPressed: _bottomSheet,
                            child: Text('proceed to pay '.toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontSize: size.height * 0.020,
                                    color: white,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

_bottomSheet() {
  RozarpayController _rozarpayController = Get.put(RozarpayController());
  return Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 3),
          Center(
              child: Container(
            height: 4,
            width: 70,
            decoration: BoxDecoration(
                color: grey, borderRadius: BorderRadius.circular(20)),
          )),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xffE74C3C),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                // minimumSize: Size(50, 40),
              ),
              onPressed: () {
                _rozarpayController.openCheckout();
              },
              child: Text('Pay via account ',
                  style: GoogleFonts.montserrat(
                      fontSize: 15, color: white, fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: green,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                // minimumSize: Size(50, 40),
              ),
              onPressed: () {},
              child: Text('Pay via wallet ',
                  style: GoogleFonts.montserrat(
                      fontSize: 15, color: white, fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                // minimumSize: Size(50, 40),
              ),
              onPressed: () {},
              child: Text('Pay on delivery ',
                  style: GoogleFonts.montserrat(
                      fontSize: 15, color: white, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

class CuponClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    final radius = size.height * .065;

    Path holePath = Path();

    for (int i = 1; i <= 4; i++) {
      holePath.addOval(
        Rect.fromCircle(
          center: Offset(0, (size.height * .2) * i),
          radius: radius,
        ),
      );
    }
    for (int i = 1; i <= 4; i++) {
      holePath.addOval(
        Rect.fromCircle(
          center: Offset(size.width, (size.height * .2) * i),
          radius: radius,
        ),
      );
    }

    return Path.combine(PathOperation.difference, path, holePath);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
