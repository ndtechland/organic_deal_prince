import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/productdetail_page_controller/productdetail_page_controller.dart';
import 'package:organic_deal/controller/subProduct_controller/subProduct_controller.dart';

class ShopCategoryDetailPage extends StatefulWidget {
  String id,image,desc,price,ourprice;
  ShopCategoryDetailPage({Key? key,required this.id,required this.image,required this.price,required this.ourprice,
    required this.desc,}) : super(key: key);

  @override
  State<ShopCategoryDetailPage> createState() => _ShopCategoryDetailPageState();
}

class _ShopCategoryDetailPageState extends State<ShopCategoryDetailPage> {
  // MyListTabController myListTabController = MyListTabController();
  // WordsController wordsController = WordsController();
  ProductDetailController productDetailController= Get.put(ProductDetailController());
  SubProductController _subProductController= Get.put(SubProductController());

  @override
  Widget build(BuildContext context) {
    var base = 'https://admin.organicdeal.in/Images/';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: green,
        title: Text("Product Detail",
          style:GoogleFonts.montserrat(fontSize: 16,color: white,fontWeight: FontWeight.w600),),
        leading: IconButton(
          iconSize: 20,
          alignment: Alignment.centerLeft,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Image.network('$base${widget.image}',fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Center(child: const Text('😢',style: TextStyle(fontSize: 20),));
                  },),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text('\u{20B9} ${widget.price}',
                    style:GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500)),
                const SizedBox(width: 5,),
                Text('\u{20B9} ${widget.ourprice } ',
                    style:GoogleFonts.montserrat(fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: red,fontWeight: FontWeight.w500)
                ),
                // Spacer(),
                // SizedBox(
                //   width: 100,
                //   child:
                //   //increment decrement button
                //   Container(
                //     width: 90,
                //     height: 28,
                //     decoration: BoxDecoration(
                //       border:  Border.all(width: 0.5,color: Colors.redAccent),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         InkWell(
                //             onTap: () {
                //               productDetailController.subtract();
                //             },
                //             child: const Icon(
                //               Icons.remove,
                //               color: Colors.redAccent,
                //               size: 20,
                //             )),
                //         Obx(() => Container(
                //           width: 20,
                //           color: Colors.redAccent,
                //           child:  Center(
                //             child: Text('${productDetailController.value}',
                //               style: TextStyle(color: Colors.white, fontSize: 14),
                //             ),
                //           ),
                //         ),),
                //         InkWell(
                //             onTap: () {
                //               productDetailController.add();
                //             },
                //             child: const Icon(
                //               Icons.add,
                //               color: Colors.redAccent,
                //               size: 20,
                //             )),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 10,),
            Text(widget.desc,
              style:GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500),),
            const Spacer(),
            GestureDetector(
              onTap: (){
                _subProductController.AddToCart("${widget.id}");
              },
              child: Container(
                padding: const EdgeInsets.all(9),
                margin: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(0.0),
                      bottomRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0)),
                  ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Add to Cart",
                        style:GoogleFonts.montserrat(fontSize: 16,color: white,fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)
                          ),
                        ),
                        child: Image.asset('assets/images/cart.png',scale: 24,),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
