import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/Home_page/home_page.dart';
import 'package:organic_deal/colors.dart';

class OrderCancelledPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Text('Order cancelled',
            style: GoogleFonts.montserrat(
                fontSize: 18, color: white, fontWeight: FontWeight.w500)),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/tomato.png",
              scale: 5,
            ),
            SizedBox(
              height: 15,
            ),
            Text("Your order has been cancelled.",
                style: GoogleFonts.montserrat(
                    fontSize: 14, color: green, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo1.png',
                      scale: 15,
                    ),
                    Text("    Order no: xsdd98765432234",
                        style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: grey,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.cancel,
                          size: 15,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Order cancelled",
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  // color: red,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: red, elevation: 0 // Background color
                      ),
                  onPressed: () {
                    Get.to(HomePage());
                  },
                  child: Text('Continue shopping',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: white,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
