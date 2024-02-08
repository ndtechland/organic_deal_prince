import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/my_wallet_controller/my_wallet_controller.dart';
import 'package:organic_deal/controller/wallet_rozarPay_controller/wallet_rozarPay_controller.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  MyWalletController _walletController = Get.put(MyWalletController());
  WalletRozarPayController walletRozarPayController =
      Get.put(WalletRozarPayController());
  bool isClicked = true;

  @override
  void initState() {
    super.initState();
    _walletController.textEditingController.text = '100';
    _walletController.textEditingController.addListener(() {
      setState(() {});
    }); // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final List<String> items = List<String>.generate(10000, (i) => '$i');
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: ClipPath(
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.green, width: 5))),
                child: ListTile(
                  leading: Image.asset('assets/images/wallet.png'),
                  title: Text("Wallet Balance",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: grey,
                          fontWeight: FontWeight.w500)),
                  subtitle: Obx(
                    () => _walletController.isLoading.value
                        ? Text("wait")
                        : Text(
                            "\u{20B9} ${_walletController.getWalletAmountModel.mebrAmount.toString()}",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: deepred,
                                fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
              elevation: 2,
              child: ClipPath(
                clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Colors.green, width: 5))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add money",
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: black,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: black,
                          ),
                          controller: _walletController.textEditingController,
                          keyboardType:
                              TextInputType.phone, //_textEditingController,
                          cursorColor: grey,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            contentPadding: EdgeInsets.all(0.0),
                            isDense: true,
                            hintText: '\u{20B9} Enter recharge amount',
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: grey,
                            ),
                            prefixText: _walletController
                                    .textEditingController.text.isNotEmpty
                                ? '\u{20B9} '
                                : null,
                            // prefixText: _textEditingController.text.isNotEmpty ?  '\u{20B9} ' : null,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              Obx(
                                () => OutlinedButton(
                                  onPressed: () {
                                    if (_walletController
                                        .textEditingController.text.isEmpty) {
                                      _walletController.textEditingController
                                          .text = 100.toString();
                                    } else {
                                      int currentValue = int.parse(
                                          _walletController
                                              .textEditingController.text);
                                      setState(() {
                                        currentValue == 100;
                                        _walletController.textEditingController
                                            .text = (currentValue +
                                                100)
                                            .toString(); // incrementing value
                                      });
                                    }
                                    _walletController.selectedAddress.value =
                                        chooseAddress.h;
                                    // _addNewAddressController.selectedAddress.value = chooseAddress.home;
                                  },
                                  child: Text("+100",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: grey,
                                      )),
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 0.7,
                                          color: _walletController
                                                      .selectedAddress.value ==
                                                  chooseAddress.h
                                              ? lightgreen
                                              : Colors.grey.shade300),
                                      backgroundColor: _walletController
                                                  .selectedAddress.value ==
                                              chooseAddress.h
                                          ? Colors.green[50]
                                          : transparent),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Obx(
                                () => (OutlinedButton(
                                  onPressed: () {
                                    if (_walletController
                                        .textEditingController.text.isEmpty) {
                                      _walletController.textEditingController
                                          .text = 500.toString();
                                    } else {
                                      int currentValue = int.parse(
                                          _walletController
                                              .textEditingController.text);
                                      setState(() {
                                        currentValue == 500;
                                        _walletController.textEditingController
                                            .text = (currentValue +
                                                500)
                                            .toString(); // incrementing value
                                      });
                                    }
                                    _walletController.selectedAddress.value =
                                        chooseAddress.f;
                                    // _addNewAddressController.selectedAddress.value = chooseAddress.office;
                                  },
                                  child: Text("+500",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: grey,
                                      )),
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 0.7,
                                          color: _walletController
                                                      .selectedAddress.value ==
                                                  chooseAddress.f
                                              ? lightgreen
                                              : Colors.grey.shade300),
                                      backgroundColor: _walletController
                                                  .selectedAddress.value ==
                                              chooseAddress.f
                                          ? Colors.green[50]
                                          : transparent),
                                )),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Obx(
                                () => OutlinedButton(
                                  onPressed: () {
                                    if (_walletController
                                        .textEditingController.text.isEmpty) {
                                      _walletController.textEditingController
                                          .text = 1000.toString();
                                    } else {
                                      int currentValue = int.parse(
                                          _walletController
                                              .textEditingController.text);
                                      setState(() {
                                        currentValue == 1000;
                                        _walletController.textEditingController
                                            .text = (currentValue +
                                                1000)
                                            .toString(); // incrementing value
                                      });
                                    }
                                    _walletController.selectedAddress.value =
                                        chooseAddress.o;
                                    // _textEditingController.text = '\u{20B9} 1000';
                                  },
                                  child: Text("+1000",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: grey,
                                      )),
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 0.7,
                                          color: _walletController
                                                      .selectedAddress.value ==
                                                  chooseAddress.o
                                              ? lightgreen
                                              : Colors.grey.shade300),
                                      backgroundColor: _walletController
                                                  .selectedAddress.value ==
                                              chooseAddress.o
                                          ? Colors.green[50]
                                          : transparent),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Obx(
                                () => OutlinedButton(
                                  onPressed: () {
                                    // _textEditingController.text = '\u{20B9} 2000';
                                    if (_walletController
                                        .textEditingController.text.isEmpty) {
                                      _walletController.textEditingController
                                          .text = 2000.toString();
                                    } else {
                                      int currentValue = int.parse(
                                          _walletController
                                              .textEditingController.text);
                                      setState(() {
                                        currentValue == 2000;
                                        _walletController.textEditingController
                                            .text = (currentValue +
                                                2000)
                                            .toString(); // incrementing value
                                      });
                                    }
                                    _walletController.selectedAddress.value =
                                        chooseAddress.t;
                                  },
                                  child: Text("+2000",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: grey,
                                      )),
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 0.7,
                                          color: _walletController
                                                      .selectedAddress.value ==
                                                  chooseAddress.t
                                              ? lightgreen
                                              : Colors.grey.shade300),
                                      backgroundColor: _walletController
                                                  .selectedAddress.value ==
                                              chooseAddress.t
                                          ? Colors.green[50]
                                          : transparent),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              walletRozarPayController.openCheckout();
                              //  _walletController.AddWalletAmountApi(_textEditingController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 0.0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Add Money',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Wallet Payment History',
                  style: GoogleFonts.montserrat(
                      fontSize: 16, color: black, fontWeight: FontWeight.w500)),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) {
              // <-- SEE HERE
              return Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Divider(),
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                // contentPadding: EdgeInsets.only(left: 5,right: 3),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff764abc),
                  child: Text('0'),
                ),
                title: Text('Name',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: black,
                        fontWeight: FontWeight.w500)),
                subtitle: Text(
                  '8:30 pm ',
                  style: GoogleFonts.montserrat(
                      fontSize: 16, color: grey, fontWeight: FontWeight.w500),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '-30',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text('60',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: grey,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              );
            },
          )
          // GestureDetector(
          //   onTap: (){
          //     _dialog1(context);
          //   },
          //   child: Card(
          //     child: ClipPath(
          //       clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(3))
          //       ),
          //       child: Container(
          //         width: double.infinity,
          //         decoration: const BoxDecoration(
          //             border: Border(right: BorderSide(color: Colors.green, width: 5))
          //         ),
          //         child: ListTile(
          //           title: Text("January 2023", style: GoogleFonts.montserrat(fontSize: 16,color: deepred,fontWeight: FontWeight.w500)),
          //           trailing: Icon(Icons.keyboard_arrow_right_sharp),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: (){
          //     _dialog1(context);
          //   },
          //   child: Card(
          //     child: ClipPath(
          //       clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(3))
          //       ),
          //       child: Container(
          //         width: double.infinity,
          //         decoration: const BoxDecoration(
          //             border: Border(right: BorderSide(color: Colors.green, width: 5))
          //         ),
          //         child: ListTile(
          //           title: Text("December 2022", style: GoogleFonts.montserrat(fontSize: 16,color: deepred,fontWeight: FontWeight.w500)),
          //           trailing: Icon(Icons.keyboard_arrow_right_sharp),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: (){
          //     _dialog1(context);
          //   },
          //   child: Card(
          //     child: ClipPath(
          //       clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(3))
          //       ),
          //       child: Container(
          //         width: double.infinity,
          //         decoration: const BoxDecoration(
          //             border: Border(right: BorderSide(color: Colors.green, width: 5))
          //         ),
          //         child: ListTile(
          //           title: Text("November 2022", style: GoogleFonts.montserrat(fontSize: 16,color: deepred,fontWeight: FontWeight.w500)),
          //           trailing: Icon(Icons.keyboard_arrow_right_sharp),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: (){
          //     showDialog(
          //         context: context,
          //         builder: (ctx)=> _dialog());
          //   },
          //   child: Text("Learn more about Organicdeal wallet",
          //       style: GoogleFonts.montserrat(fontSize: 16,color: green,fontWeight: FontWeight.w500)),
          // )
        ],
      ),
    );
  }

  _dialog() {
    return AlertDialog(
      // contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Container(
              height: 30,
              width: double.infinity,
              child: Image.asset(
                'assets/images/logo1.png',
              )),
          Text('More about Organicdeal wallet',
              style: GoogleFonts.montserrat(
                  fontSize: 14, color: black, fontWeight: FontWeight.w500)),
        ],
      ),
      // Text('More about Organicdeal wallet',
      //     style: GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500)),		 // To display the title it is optional
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'The organicdeal wallet is a prepaid credit account linked to your organicdeal account.'
              'You can add funds to your organicdeal wallet and use the amount for placing organicdeal orders or to pay'
              'At the time of order placement, if you have organicdeal wallet balance then you may pay through your organicdeal'
              'account. You may also choose to unselect the organicdeal wallet balance if you wish to and complete the payment'
              'for your order using any other payment options.',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: grey,
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Okay',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: white,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _dialog1(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Organicdeal",
            style: GoogleFonts.montserrat(
                fontSize: 15, color: black, fontWeight: FontWeight.w500)),
        content: Text("No wallet activity for this month",
            style: GoogleFonts.montserrat(
                fontSize: 14, color: black, fontWeight: FontWeight.w500)),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("OK",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, color: red, fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
