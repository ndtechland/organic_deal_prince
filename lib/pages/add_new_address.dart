import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/add_new_address_controller/add_new_address_controller.dart';

class AddNewAddress extends StatelessWidget {

  AddNewAddressController _addNewAddressController = Get.put(AddNewAddressController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: green,
          title: Text('Add New Address',
            style: TextStyle(fontSize: 18),),
          centerTitle: true,
          leading: IconButton(
            iconSize: 20,
            alignment: Alignment.centerLeft,
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined,),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Personal Details', style: TextStyle(fontSize: 15,letterSpacing: 0.5,color: Colors.black),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            // optional flex property if flex is 1 because the default flex is 1
                            flex: 1,
                            child: TextField(
                              controller: _addNewAddressController.fname,
                              style: TextStyle(fontSize: 14,),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(1.0), //  <- you can it to 0.0 for no space
                                isDense: true,
                                labelText: 'Enter First Name',
                                labelStyle: const TextStyle(
                                  fontFamily: '',
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: _addNewAddressController.lname,
                              style: TextStyle(fontSize: 14,),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(1.0),   //  <- you can it to 0.0 for no space
                                isDense: true,
                                labelText: 'Enter Last Name',
                                labelStyle: TextStyle(
                                    fontFamily: '',
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18,),
                      TextField(
                        controller: _addNewAddressController.phone,
                        style: TextStyle(fontSize: 14,),
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1.0), //  <- you can it to 0.0 for no space
                          isDense: true,
                          counterText: "",
                          label: RichText(
                            text: TextSpan(
                                text: '*',
                                style: TextStyle(color: Colors.red[900],
                                  fontFamily: '',
                                  fontSize: 13,),
                                children: const [
                                  TextSpan(
                                      text: ' Contact number',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: '',
                                        fontSize: 13,))
                                ]),
                          ),
                          floatingLabelBehavior:FloatingLabelBehavior.auto,
                          labelStyle: const TextStyle(
                              fontFamily: '',
                              fontSize: 13,
                              color: Colors.grey
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('Address Details', style: TextStyle(fontSize: 15,letterSpacing: 0.5,color: Colors.black,),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: TextField(
                              controller: _addNewAddressController.houseno,
                              style: TextStyle(fontSize: 14,),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(1.0),
                                isDense: true,
                                label: RichText(
                                  text: TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red[900],
                                        fontFamily: '',
                                        fontSize: 13,),
                                      children: [
                                        TextSpan(
                                            text: ' Home no',
                                            style: TextStyle(
                                                color: Colors.grey,
                                              fontFamily: '',
                                              fontSize: 13,))
                                      ]),
                                ),
                                  floatingLabelBehavior:FloatingLabelBehavior.auto,
                               // labelText: 'House no',
                                labelStyle: const TextStyle(
                                    fontFamily: '',
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: _addNewAddressController.apartmentname,
                              style: TextStyle(fontSize: 14,),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(1.0),   //  <- you can it to 0.0 for no space
                                isDense: true,
                                labelText: 'Apartment name',
                                labelStyle: const TextStyle(
                                    fontFamily: '',
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18,),
                      TextField(
                        controller: _addNewAddressController.street,
                        style: TextStyle(fontSize: 14,),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1.0),
                          isDense: true,
                          labelText: 'Street detail to locate you',
                          labelStyle: const TextStyle(
                              fontFamily: '',
                              fontSize: 13,
                              color: Colors.grey
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      SizedBox(height: 18,),
                      TextField(
                        controller: _addNewAddressController.landmark,
                        style: TextStyle(fontSize: 14,),
                        cursorColor: Colors.grey,
                        maxLength: 10,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1.0), //  <- you can it to 0.0 for no space
                          isDense: true,
                          counterText: "",
                          labelText: 'Landmark for easy reach out',
                          labelStyle: const TextStyle(
                              fontFamily: '',
                              fontSize: 13,
                              color: Colors.grey
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      SizedBox(height: 18,),
                      TextField(
                        style: TextStyle(fontSize: 14,),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1.0), //  <- you can it to 0.0 for no space
                          isDense: true,
                          label: RichText(
                            text: TextSpan(
                                text: '*',
                                style: TextStyle(color: Colors.red[900],
                                  fontFamily: '',
                                  fontSize: 13,),
                                children: const [
                                  TextSpan(
                                      text: ' Area Detail',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: '',
                                        fontSize: 13,))
                                ]),
                          ),
                          floatingLabelBehavior:FloatingLabelBehavior.auto,
                          labelStyle: const TextStyle(
                              fontFamily: '',
                              fontSize: 13,
                              color: Colors.grey
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),

                        ),
                      ),
                      SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: _addNewAddressController.district,
                              style: TextStyle(fontSize: 14,),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(1.0),
                                isDense: true,
                                labelText: 'City/District',
                                labelStyle: const TextStyle(
                                    fontFamily: '',
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: _addNewAddressController.pin,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(fontSize: 14,),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(1.0),
                                isDense: true,
                                label: RichText(
                                  text: TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red[900],
                                        fontFamily: '',
                                        fontSize: 13,),
                                      children: const [
                                        TextSpan(
                                            text: ' Pincode',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: '',
                                              fontSize: 13,))
                                      ]),
                                ),
                                floatingLabelBehavior:FloatingLabelBehavior.auto,
                                labelStyle: const TextStyle(
                                    fontFamily: '',
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Choose nick name for this address',
                        style: TextStyle(fontFamily: '',fontSize: 12,color: Colors.grey),),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Obx(() =>  OutlinedButton(
                              onPressed: (){
                                _addNewAddressController.selectedAddress.value = chooseAddress.home;
                              },
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: _addNewAddressController.selectedAddress.value==chooseAddress.home
                                      ? Colors.grey[600] : Colors.transparent
                              ),
                              child: Text("Home",
                                style: TextStyle(
                                    color: _addNewAddressController.selectedAddress.value==chooseAddress.home ? Colors.white
                                        : Colors.grey,letterSpacing: 0.5,
                                    fontSize: 12,fontWeight: FontWeight.normal),),
                            ),),
                            SizedBox(width: 8,),
                           Obx(() =>  OutlinedButton(
                             onPressed: (){
                               _addNewAddressController.selectedAddress.value = chooseAddress.office;
                             },
                             style: OutlinedButton.styleFrom(
                                 backgroundColor: _addNewAddressController.selectedAddress.value==chooseAddress.office
                                     ? Colors.grey[600] : Colors.transparent
                             ),
                             child: Text("Office",
                               style: TextStyle(
                                  color: _addNewAddressController.selectedAddress.value==chooseAddress.office
                                      ? Colors.white : Colors.grey,letterSpacing: 0.5,
                                   fontSize: 12,fontWeight: FontWeight.normal),),
                           ),),
                            SizedBox(width: 8,),
                           Obx(() =>  OutlinedButton(
                             onPressed: (){
                               _addNewAddressController.selectedAddress.value = chooseAddress.other;
                             },
                             style: OutlinedButton.styleFrom(
                                 backgroundColor: _addNewAddressController.selectedAddress.value==chooseAddress.other
                                     ? Colors.grey[600] : Colors.transparent
                             ),
                             child: Text("Other",
                               style: TextStyle(letterSpacing: 0.5,
                                   color: _addNewAddressController.selectedAddress.value==chooseAddress.other
                                       ? Colors.white : Colors.grey,
                                   fontSize: 12,fontWeight: FontWeight.normal),),
                           ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:  Material(
                      color: Colors.black54,
                       child: InkWell(
                        onTap: () {
                          _addNewAddressController.addNewAddressApi();
                        },
                        child: const SizedBox(
                         height: kToolbarHeight,
                         width: double.infinity,
                         child: Center(
                         child: Text('Add Address',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          fontWeight: FontWeight.normal,
                         ),
                      ),
                ),
            ),
          ),
        )
      )
    );
  }
}
