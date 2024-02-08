import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../controller/bulkorder_controller/bulkorder_controller.dart';

class BulkOrderDrawer extends StatelessWidget {
  final BulkOrderController _bulkOrderController =
      Get.put(BulkOrderController());

   BulkOrderDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    var textstyle = GoogleFonts.montserrat(
        fontSize: 16, color: white, fontWeight: FontWeight.w500);
    final radius = BorderRadius.circular(8.0);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: green,
          title: Text("Bulk Order", style: textstyle),
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
        ),
        body: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: black, fontSize: 16),
                    controller: _bulkOrderController.Fullname,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius,
                        borderSide: BorderSide(color: grey, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: radius),
                      labelStyle: TextStyle(color: grey, fontSize: 16),
                      labelText: 'Full Name',
                      //hintText: 'Ravi',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.0),
                        borderRadius: radius,
                      ),
                      floatingLabelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: black, fontSize: 16),
                    controller: _bulkOrderController.CompanyName,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius,
                        borderSide: BorderSide(color: grey, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: radius),
                      labelStyle: TextStyle(color: grey, fontSize: 16),
                      labelText: 'Company Name',
                      //hintText: 'Ravi',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.0),
                        borderRadius: radius,
                      ),
                      floatingLabelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: black, fontSize: 16),
                    controller: _bulkOrderController.Phone,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius,
                        borderSide: BorderSide(color: grey, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: radius),
                      labelStyle: TextStyle(color: grey, fontSize: 16),
                      labelText: 'Phone Number',
                      //hintText: 'Ravi',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.0),
                        borderRadius: radius,
                      ),
                      floatingLabelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: black, fontSize: 16),
                    controller: _bulkOrderController.Email,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius,
                        borderSide: BorderSide(color: grey, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: radius),
                      labelStyle: TextStyle(color: grey, fontSize: 16),
                      labelText: 'Email',
                      //hintText: 'Ravi',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.0),
                        borderRadius: radius,
                      ),
                      floatingLabelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: black, fontSize: 16),
                    controller: _bulkOrderController.Address,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius,
                        borderSide: BorderSide(color: grey, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: radius),
                      labelStyle: TextStyle(color: grey, fontSize: 16),
                      labelText: 'Address',
                      //hintText: 'Ravi',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.0),
                        borderRadius: radius,
                      ),
                      floatingLabelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: black, fontSize: 16),
                    controller: _bulkOrderController.City,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius,
                        borderSide: BorderSide(color: grey, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: radius),
                      labelStyle: TextStyle(color: grey, fontSize: 16),
                      labelText: 'City',
                      //hintText: 'Ravi',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.0),
                        borderRadius: radius,
                      ),
                      floatingLabelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: black, fontSize: 16),
                    controller: _bulkOrderController.State,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius,
                        borderSide: BorderSide(color: grey, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: radius),
                      labelStyle: TextStyle(color: grey, fontSize: 16),
                      labelText: 'State',
                      //hintText: 'Ravi',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.0),
                        borderRadius: radius,
                      ),
                      floatingLabelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: black, fontSize: 16),
                    controller: _bulkOrderController.Pincode,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: radius,
                        borderSide: BorderSide(color: grey, width: 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: radius),
                      labelStyle: TextStyle(color: grey, fontSize: 16),
                      labelText: 'Zip Code',
                      //hintText: 'Ravi',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.0),
                        borderRadius: radius,
                      ),
                      floatingLabelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: green,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: SizedBox(
                            child: TextFormField(
                              controller: _bulkOrderController.Message,
                              cursorColor: white,
                              style: TextStyle(color: white),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              minLines: 3,
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Write your message here...',
                                  hintStyle: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: white.withOpacity(0.5),
                                      fontWeight: FontWeight.w600)),
                              maxLength: 100,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 47, width: 250.0,
                  child: ElevatedButton(
                    child: Text('Order'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w500)),
                    onPressed: () {
                      if (_bulkOrderController.Fullname.text == '' ||
                          _bulkOrderController.CompanyName.text == '' ||
                          _bulkOrderController.Phone.text == '' ||
                          _bulkOrderController.Email.text == '' ||
                          _bulkOrderController.Address.text == '' ||
                          _bulkOrderController.City.text == '' ||
                          _bulkOrderController.State.text == '' ||
                          _bulkOrderController.Pincode == '' ||
                          _bulkOrderController.Message == '') {
                        showToast('Text Field is empty, Please Fill All Data',
                            context: context,
                            animation: StyledToastAnimation.slideFromRight,
                            reverseAnimation: StyledToastAnimation.slideToRight,
                            position: StyledToastPosition.center,
                            startOffset: Offset(1.0, 0.0),
                            reverseEndOffset: Offset(1.0, 0.0),
                            animDuration: Duration(seconds: 1),
                            duration: Duration(seconds: 4),
                            curve: Curves.linearToEaseOut,
                            reverseCurve: Curves.fastOutSlowIn,
                            backgroundColor: primaryColor.withOpacity(0.7));
                        // print('Text Field is empty, Please Fill All Data');
                      } else {
                        _bulkOrderController.checkLogin();
                        // login(_nameController.text,_companyController.text,
                        //     _phoneController.text, _emailController.text,
                        //     _addressController.text,_cityController.text,
                        //     _stateController.text,_zipController.text);
                      }
                    },
                  ),
                  // RaisedButton(
                  //   disabledColor: grey,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: radius),
                  //   color: primaryColor,
                  //   elevation: 0,
                  //   onPressed: (){
                  //     // if(_nameController.text==''||_companyController.text==''||
                  //     //     _phoneController.text==''||_emailController.text==''||_addressController.text==''||
                  //     //     _cityController.text==''||_stateController.text==''||
                  //     //     _zipController.text==''){
                  //     //   _toast1();
                  //     //   // print('Text Field is empty, Please Fill All Data');
                  //     // }else{
                  //     //   // login(_nameController.text,_companyController.text,
                  //     //   //     _phoneController.text, _emailController.text,
                  //     //   //     _addressController.text,_cityController.text,
                  //     //   //     _stateController.text,_zipController.text);
                  //     // }
                  //   },
                  //   child:  Text("Create",
                  //     style: TextStyle(color: white,fontSize: 16),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ));
  }

  _toast1() {
    return showToast('Text Field is empty, Please Fill All Data',
        //context: context,
        animation: StyledToastAnimation.slideFromRight,
        reverseAnimation: StyledToastAnimation.slideToRight,
        position: StyledToastPosition.center,
        startOffset: Offset(1.0, 0.0),
        reverseEndOffset: Offset(1.0, 0.0),
        animDuration: Duration(seconds: 1),
        duration: Duration(seconds: 4),
        curve: Curves.linearToEaseOut,
        reverseCurve: Curves.fastOutSlowIn,
        backgroundColor: primaryColor.withOpacity(0.7));
  }
}
