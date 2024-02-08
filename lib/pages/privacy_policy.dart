import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Text('PrivacyPolicy',
            style: GoogleFonts.montserrat(fontSize: 18,color: white,fontWeight: FontWeight.w500)),
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
      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 40),
        child: Column(
          children: [
            Container(
              height: 60,
                width: 250,
                alignment: Alignment.center,
                child: Image.asset('assets/images/logo1.png',fit: BoxFit.cover,)),
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Personal Information",
                  style: GoogleFonts.montserrat(fontSize: 16,color: black,fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been"
                  " the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type"
                  " and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap"
                  " into electronic typesetting, remaining essentially unchanged.",
                  style: GoogleFonts.montserrat(fontSize: 13,color: black,fontWeight: FontWeight.w500)),
            ),


            SizedBox(height: 30,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Contact Information",
                  style: GoogleFonts.montserrat(fontSize: 16,color: black,fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("NdTech Land Pvt Ltd, Noida Sector 16,Uttar Pradesh",
                  style: GoogleFonts.montserrat(fontSize: 13,color: black,fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 5,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Tel.: 1850-142-1765",
                  style: GoogleFonts.montserrat(fontSize: 13,color: black,fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 5,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Email id: customerservice@organicdeal.com",
                  style: GoogleFonts.montserrat(fontSize: 13,color: black,fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
