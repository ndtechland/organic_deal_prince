import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/MyOrderHistory_controller/MyOrderHistory_controller.dart';
import 'package:organic_deal/controller/basket_controller/basket_controller.dart';
import 'package:organic_deal/controller/myList_tab_controller/myList_tab_controller.dart';
import 'package:organic_deal/pages/MyOrder/order_detail_page.dart';
import 'package:organic_deal/pages/MyOrder/orderDeliveredDetailPage.dart';

class DeliveredPage extends StatelessWidget {
  MyListTabController myListTabController = MyListTabController();
  MyOrderHistoryController _myOrderHistoryController= Get.put(MyOrderHistoryController());

  @override
  Widget build(BuildContext context) {
   // var base = 'https://organicdeal.in/Images/';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body:   Obx(()=> _myOrderHistoryController.isLoading.value
        ? const Center(child: CircularProgressIndicator(),)
        : ListView.builder(
          shrinkWrap: true,
          itemCount: 2,//_myOrderHistoryController.getorderHistoryApiModel?.result.length,
          itemBuilder: (context,index){
            var item = _myOrderHistoryController.getorderHistoryApiModel?.result;
            return
              Container(
                        margin: EdgeInsets.all(4.0),
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Order no: 98768998",
                                  style:GoogleFonts.montserrat(fontSize: size.height * 0.020,color: black,
                                  fontWeight: FontWeight.w500),
                                  ),
                                  Text("26-09-2023",
                                    style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: black,
                                        fontWeight: FontWeight.w500),)
                                ],
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tracking number: ',
                                      style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(text: '976789',
                                      style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: black,
                                          fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Quantity: ',
                                          style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(text: '4',
                                          style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: black,
                                              fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Total amount: ',
                                          style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(text: '1600',
                                          style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: black,
                                              fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => Get.to(OrderDeliveredDetailPage()),
                                    child:  Container(
                                      width: 60.0,
                                      height: 25.0,
                                      decoration:  BoxDecoration(
                                        border:  Border.all(color: black, width: 0.5),
                                        borderRadius:  BorderRadius.circular(30.0),
                                      ),
                                      child:  Center(child: Text('Details',
                                        style:GoogleFonts.montserrat(fontSize: size.height * 0.014,color: black,
                                            fontWeight: FontWeight.w500),),),
                                    ),
                                  ),

                                  Text('Delivered',
                                      style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: green,
                                          fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
