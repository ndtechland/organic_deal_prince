import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/MyOrderHistory_controller/MyOrderHistory_controller.dart';
import 'package:organic_deal/controller/myList_tab_controller/myList_tab_controller.dart';
import 'package:organic_deal/pages/MyOrder/order_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPage extends StatelessWidget {
  MyListTabController myListTabController = MyListTabController();
  MyOrderHistoryController _myOrderHistoryController= Get.put(MyOrderHistoryController());
 // OrderDetailApiController _orderDetailApiController = Get.put(OrderDetailApiController());

  @override
  Widget build(BuildContext context) {
    // var base = 'https://organicdeal.in/Images/';
    Size size = MediaQuery.of(context).size;
    return   Obx(()=>
    _myOrderHistoryController.isLoading.value
        ? const Center(child: CircularProgressIndicator(),)
        :
    _myOrderHistoryController.getorderHistoryApiModel!.result!.isEmpty
        ? Text("No Data")
        :
    ListView.builder(
      shrinkWrap: true,
      itemCount: _myOrderHistoryController.getorderHistoryApiModel?.result?.length,
      itemBuilder: (context,index){
        var item = _myOrderHistoryController.getorderHistoryApiModel?.result;
        final DateTime? now = item?[index].orderDate;
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String date = formatter.format(now!);
        print(date);
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
                      Text("Order no: ${item?[index].orderId ?? 0}",
                        style:GoogleFonts.montserrat(fontSize: size.height * 0.020,color: black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(date,
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
                              text: 'Items: ',
                              style:GoogleFonts.montserrat(fontSize: size.height * 0.016,color: grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(text: '${item?[index].totalItems}',
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
                            TextSpan(text: '${item?[index].totalPrice}',
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
                        onTap: ()async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("OrderId", "${item?[index].orderId}");
                          var id = '${item?[index].id}';
                          var orderId = '${item?[index].orderId}';
                          var address = '${item?[index].address}';
                          var phone = '${item?[index].phone}';
                          var totalPrice = '${item?[index].totalPrice}';
                          var totalItems = '${item?[index].totalItems}';
                          var paymentMode = '${item?[index].paymentMode}';
                          var name = '${item?[index].name}';
                          Get.to(OrderDetailPage(
                            id: id,
                            orderId: orderId,
                            name: name,
                            address: address,
                            phone: phone,
                            totalPrice: totalPrice,
                            totalItems: totalItems,
                            paymentMode: paymentMode,
                            date: date,
                          ));
                        },
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

                      Text('Order',
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

    );
    //   Scaffold(
    //   backgroundColor: Colors.grey.shade200,
    //   body:
    //
    // );
  }
}
