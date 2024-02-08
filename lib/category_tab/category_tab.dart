import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/categorytabbottom_controller/categorytabbottom_controller.dart';
import 'package:organic_deal/pages/shopSubCategory.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  // ignore: unused_field
  int? _activeMeterIndex;
  CategoryTabBottomController _categorytabbottomController = Get.put(CategoryTabBottomController());
  List <String> icon=[
    'assets/images/veg.png',
    'assets/images/oil.png',
    'assets/images/cake.png',
    'assets/images/fast-food.png',
    'assets/images/snacks.png',
    'assets/images/beauty.png',
    'assets/images/cleaning.png',
    'assets/images/protein.png',
  ];
  List<String> heading=[
    'Fruits & Vegetables',
    'Foodgrains, Oil & Masala',
    'Bakery, Cake & Dairy',
    'Beverages',
    'Snacks & Branded Foods',
    'Beauty & Hygiene',
    'Cleaning & Household',
    'Egg, Meat & Fish'
  ];
  List<String> subheading1=
  [
  'All Fruits & Vegetables',
  'Fresh Vegetables',
    'Fresh Fruits',
    'All Fruits & Vegetables',
    'Fresh Vegetables',
    'Fresh Fruits',
    'Fresh Vegetables',
    'Fresh Fruits',
  ];


  @override
  Widget build(BuildContext context) {
    var base = 'https://organicdeal.in/Images/';
    return   Obx(() => (_categorytabbottomController.isLoading.value)
        ? Center(child: CircularProgressIndicator())
        : _categorytabbottomController.getcategorytab?.category == null
        ? Center(child: Text('No data'),)
        : MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child:  ListView.separated(
            physics: ScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(height: 1.0,),
          itemCount: _categorytabbottomController.getcategorytab!.category.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return ListTile(
              tileColor: white,
              contentPadding: EdgeInsets.only(left: 4.0),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('$base${_categorytabbottomController.getcategorytab?.category[index].categoryImage}'),
              ),
              title:   Text('${_categorytabbottomController.getcategorytab?.category[index].categoryName}',
                style:  GoogleFonts.montserrat(fontSize: 15,color: black,fontWeight: FontWeight.w500),
              ),
              onTap: (){
                Get.to(ShopSubCategoryPage(text: '${_categorytabbottomController.getcategorytab?.category[index].categoryName}',));
              },
            );
          }),
    )
    );
  }
}
