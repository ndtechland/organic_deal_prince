import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/basket_controller/basket_controller.dart';
import 'package:organic_deal/controller/myList_tab_controller/myList_tab_controller.dart';
import 'package:organic_deal/controller/shopSubCategory_controller/shopSubCategory_controller.dart';

class ShopSubCategoryPage extends StatelessWidget {
  final String text;
  ShopSubCategoryPage({Key? key, required this.text}) : super(key: key);

  ShopSubCategoryController _shopSubCategoryController =
      ShopSubCategoryController();
  List _imageList = [
    'https://zagfresh.com/wp-content/uploads/2020/06/lf4.jpg',
    'https://www.jiomart.com/images/product/original/590003515/onion-1-kg-product-images-o590003515-p590003515-0-202203170724.jpg?im=Resize=(1000,1000)',
    'https://media.istockphoto.com/id/1258142863/photo/tomatoes-isolate-on-white-background-tomato-half-isolated-tomatoes-side-view-whole-cut-slice.webp?b=1&s=170667a&w=0&k=20&c=hFvgq7wOVkoxHR7O2KE3DDbO127FJT4Ub_NZJ6FQCTQ='
  ];
  @override
  Widget build(BuildContext context) {
    var base = 'https://organicdeal.in/Images/';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            text,
            style: GoogleFonts.montserrat(
                fontSize: 16, color: white, fontWeight: FontWeight.w600),
          ),
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
        body: Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<WordsController>(
                init: WordsController(),
                builder: (controller) => ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          height: 1.0,
                        ),
                    itemCount: _imageList.length, //3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = _imageList[index]; //controller.words[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SizedBox(
                          height: 150,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Stack(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                        child: Image.network(
                                          _imageList[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: green,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10.0),
                                              topLeft: Radius.circular(10.0),
                                            ),
                                          ),
                                          height: 18,
                                          width: 70,
                                          child: Center(
                                              child: Text(
                                            ' 20% OFF',
                                            style: TextStyle(
                                                color: white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )),
                                        ))
                                  ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'organicdeal'.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              letterSpacing: 0.5),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.addWord();
                                      },
                                      child: Text(
                                        'Vegetable',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            color: white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    //dropdown
                                    Obx(() => Container(
                                          height: 30,
                                          width: 180,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  color: Colors.grey.shade300,
                                                  style: BorderStyle.solid),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2.0)),
                                            ),
                                          ),
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(),
                                            icon: const Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            onChanged: (newValue) {
                                              _shopSubCategoryController
                                                  .selectedDrowpdown(
                                                      newValue.toString());
                                              _shopSubCategoryController
                                                  .update();
                                            },
                                            value: _shopSubCategoryController
                                                        .selectedDrowpdown
                                                        .value ==
                                                    ""
                                                ? null
                                                : _shopSubCategoryController
                                                    .selectedDrowpdown.value,
                                            items: [
                                              for (var data
                                                  in _shopSubCategoryController
                                                      .dropdownText)
                                                DropdownMenuItem(
                                                  value: data,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Text(
                                                      data,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '\u{20B9}100',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '\u{20B9}300',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 35,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 80,
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    foregroundColor: white,
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    elevation: 0),
                                                onPressed: () async {},
                                                child: Text(
                                                  'Add',
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 14,
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
