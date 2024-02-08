import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/MyOrderHistory_controller/MyOrderHistory_controller.dart';
import 'package:organic_deal/pages/MyOrder/cancel_tab.dart';
import 'package:organic_deal/pages/MyOrder/delivered_page.dart';
import 'package:organic_deal/pages/MyOrder/orderPage.dart';

class MyOrderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
            backgroundColor: green,
            title:  Text('My Order',
                style:GoogleFonts.montserrat(fontSize: 16,color: white,
                    fontWeight: FontWeight.w600)),
            centerTitle: true,
            leading: IconButton(
              iconSize: 20,
              alignment: Alignment.centerLeft,
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_outlined,),),
             bottom: TabBar(
               indicatorColor: white,
              physics: NeverScrollableScrollPhysics(),
              tabs: [
              Container(child: Text("Order",
                  style:GoogleFonts.montserrat(fontSize: 16,color: white,
                      fontWeight: FontWeight.w500)),),
              Container(child: Text("Delivered",
                  style:GoogleFonts.montserrat(fontSize: 16,color: white,
                      fontWeight: FontWeight.w500)),),
              Container(child: Text("Cancelled",
                  style:GoogleFonts.montserrat(fontSize: 16,color: white,
                      fontWeight: FontWeight.w500)),),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          children: [
            OrderPage(),
            DeliveredPage(),
            CancelTab()
          ],
        ),
      ),
    );
  }
}
