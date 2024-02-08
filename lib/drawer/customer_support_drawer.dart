// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';

class CustomerSupportDrawer extends StatelessWidget {
  // const CustomerSupportDrawer({Key? key}) : super(key: key);
  List<String> choices = [
    'My Orders',
    'Return / Exchange',
    'Payment & Vouchers',
    'My Account',
    'Report An Issue',
    'General Queries',
  ];
  List<String> icon = [''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Text("Customer Service",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hi Rahul, How can we help you today?",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: black,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Popular Topics",
                    style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: black,
                        fontWeight: FontWeight.w600))),
            Card(
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                // height: 200,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: choices.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // MediaQuery.of(context).orientation ==
                    //     Orientation.landscape ? 3: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: (1.4 / 1),
                  ),
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed(RouteName.GridViewCustom);
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/cart1.png",
                              scale: 10,
                              color: Colors.grey[600],
                            ),
                            Text(choices[index],
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    color: black,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
