import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/Invoice_controller/invoice_controller.dart';
import 'package:organic_deal/controller/MyOrderHistory_controller/MyOrderHistory_controller.dart';
import 'package:organic_deal/controller/orderDetailApi_controller/orderDetailApi_controller.dart';
import 'package:organic_deal/pages/MyOrder/invoicePage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailPage extends StatefulWidget {
  String id,
      orderId,
      name,
      address,
      phone,
      totalPrice,
      totalItems,
      paymentMode,
      date;
  OrderDetailPage(
      {super.key,
      required this.id,
      required this.orderId,
      required this.name,
      required this.address,
      required this.phone,
      required this.totalPrice,
      required this.totalItems,
      required this.paymentMode,
      required this.date});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  OrderDetailApiController _orderDetailApiController =
      Get.put(OrderDetailApiController());
  MyOrderHistoryController _myOrderHistoryController =
      Get.put(MyOrderHistoryController());
  InvoiceController _invoiceController = Get.put(InvoiceController());

  String remotePDFpath = '';
  //invoice
  Future<File> createFileOfPdfUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var inv = prefs.getString("invoice");
    print("invvvvvvv: ${inv}");
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      final url = inv
          .toString(); //"https://admin.organicdeal.in/Home/ServeDoc?FileName=0cdf5f7b-e04f-4b29-a903-411f1c2da140.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }

  @override
  void initState() {
    _invoiceController.getInvoiceApi();
    // TODO: implement initState
    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Text('Order details',
            style: GoogleFonts.montserrat(
                fontSize: 18, color: white, fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: IconButton(
          iconSize: 20,
          alignment: Alignment.centerLeft,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
          ),
        ),
        actions: [
          InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("id", "${widget.id}");
                prefs.setString("orderId", "${widget.orderId}");
                if (remotePDFpath.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(path: remotePDFpath),
                    ),
                  );
                }
                _invoiceController.getInvoiceApi();
              },
              child: Icon(Icons.account_balance_wallet_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order number: ${widget.orderId}",
                        style: GoogleFonts.montserrat(
                            fontSize: size.height * 0.020,
                            color: black,
                            fontWeight: FontWeight.w500)),
                    Text(widget.date,
                        style: GoogleFonts.montserrat(
                            fontSize: size.height * 0.020,
                            color: grey,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tracking number: 98765",
                        style: GoogleFonts.montserrat(
                            fontSize: size.height * 0.018,
                            color: grey,
                            fontWeight: FontWeight.w500)),
                    Text("Order",
                        style: GoogleFonts.montserrat(
                            fontSize: size.height * 0.018,
                            color: green,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => _orderDetailApiController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(color: black),
                      )
                    : _orderDetailApiController.getOrderDetailPageModel
                                ?.newmodel?.cartlist?.length ==
                            0
                        ? Center(
                            child: Text("No Item"),
                          )
                        : SizedBox(
                            // height: 200,
                            child: ListView.builder(
                                itemCount: _orderDetailApiController
                                    .getOrderDetailPageModel
                                    ?.newmodel
                                    ?.cartlist
                                    ?.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var base =
                                      'https://admin.organicdeal.in/Images/';
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 1.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                child: Image.network("$base"
                                                    "${_orderDetailApiController.getOrderDetailPageModel?.newmodel?.cartlist?[index].productImage}"),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${_orderDetailApiController.getOrderDetailPageModel?.newmodel?.cartlist?[index].productName}",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize:
                                                                    size.height *
                                                                        0.020,
                                                                color: black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'weight: ',
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize:
                                                                      size.height *
                                                                          0.018,
                                                                  color: grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            TextSpan(
                                                              text: '9',
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize:
                                                                      size.height *
                                                                          0.018,
                                                                  color: black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Quantity: ',
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize:
                                                                      size.height *
                                                                          0.016,
                                                                  color: grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "${_orderDetailApiController.getOrderDetailPageModel?.newmodel?.cartlist?[index].quantity}",
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize:
                                                                      size.height *
                                                                          0.016,
                                                                  color: black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Order',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize:
                                                                    size.height *
                                                                        0.016,
                                                                color: green,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Expanded(
                                                  child: Text(
                                                    '\u{20B9}${_orderDetailApiController.getOrderDetailPageModel?.newmodel?.cartlist?[index].price}',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize:
                                                          size.height * 0.018,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  );
                                }))),
                SizedBox(
                  height: 10,
                ),
                Text("Order Status",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(5)),
                  height: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Quick Actions",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(5)),
                    // height: 150,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _orderDetailApiController.CancelOrderApi(
                                _orderDetailApiController
                                    .getOrderDetailPageModel
                                    ?.newmodel
                                    ?.cartlist?[0]
                                    .orderId);
                            Get.back();
                            Timer(
                                const Duration(seconds: 1),
                                () => _myOrderHistoryController
                                    .getOrderHistoryApi());
                          },
                          child: ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.cancel_outlined,
                              size: 18,
                              color: red,
                            ),
                            title: Text('Cancel order',
                                style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500)),
                            trailing: Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 12,
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(Icons.edit_calendar, size: 18),
                          title: Text('Change delivery slot',
                              style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500)),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 12,
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(Icons.help_outline_sharp, size: 18),
                          title: Text('Get help for this order',
                              style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500)),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 12,
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Order Summary",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(5)),
                    // height: 150,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Item value',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: black,
                                        fontWeight: FontWeight.w500)),
                                Text('0',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery charge',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: black,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    '\u{20B9}${_orderDetailApiController.getOrderDetailPageModel?.newmodel?.cartlist?[0].shippingCharge}',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Container(
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Amount Payable',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: black,
                                        fontWeight: FontWeight.w500)),
                                Text(widget.totalPrice,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Container(
                          height: 40,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Payment status: ',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: widget.paymentMode,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 13,
                                            color: green,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Address",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(5)),
                  //  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.pin_drop_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.address,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 15,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              widget.phone,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text("Total:  \u{20B9}${widget.totalPrice}",
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.w500)),
                    subtitle: Text(
                      widget.paymentMode,
                      style: TextStyle(
                          color: green,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
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
                          // Get.to(ChooseDeliveryAddressPage());
                          // Get.to(AddNewAddress());
                        },
                        child: Text(
                          'Pay now',
                          style: TextStyle(
                              fontFamily: '', fontSize: 14, color: white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
