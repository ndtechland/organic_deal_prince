import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';

class FaqDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   var _text16 = GoogleFonts.montserrat(fontSize: 16,color: black,fontWeight: FontWeight.w600);
  var _text14 = GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500);
  var  width= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Image.asset('assets/images/logo1.png',scale: 10,fit: BoxFit.cover,),
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
          width: width,
          margin: EdgeInsets.all(15),
          color: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("faq".toUpperCase(),
              style: GoogleFonts.montserrat(fontSize: 25,color: black,fontWeight: FontWeight.w500)
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been"
                    " the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type"
                    " and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap"
                    " into electronic typesetting, remaining essentially unchanged.",
                    style: _text14
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 45,
                width: double.infinity,
                color: green,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('  Registration',
                      style: GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w500,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("How do I register?",
                    style: _text16
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been"
                    " the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type"
                    " and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap"
                    " into electronic typesetting, remaining essentially unchanged.",
                    style: _text14
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 45,
                width: double.infinity,
                color: green,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('  Payment',
                      style: GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w500,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("What are the modes of payment?",
                    style: _text16
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("You can pay for your order on organic deal.com using the following modes of payment: \n"
                    "a. Cash on delivery(COD)\n"
                    "b. Credit and debit cards (VISA / Mastercard / Rupay)\n"
                    "c. Paytm / PhonePe / googlePay accepted here.",
                    style: _text14
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("What is the meaning of cash on delivery?",
                    style: _text16
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("Cash on delivery means that you can pay for your order at the time of order delivery"
                    "at your doorstep.",
                    style: _text14
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("Is it safe to use my credit / debit card on organic deal?",
                    style: _text16
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("Yes it is absolutely safe to use your card on organicdeal.com",
                    style: _text14
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 45,
                width: double.infinity,
                color: green,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('  Delivery Related',
                      style: GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w500,)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 45,
                width: double.infinity,
                color: green,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('  Order Related',
                      style: GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w500,)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 45,
                width: double.infinity,
                color: red,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('  Return & Refund Policy (Updated)',
                      style: GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w500,)),
                ),
              ),
              SizedBox(height: 10,),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text("If you have any complaints or suggestions about the content "
                    "published on organicdeal.com",
                    style: _text16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
