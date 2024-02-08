import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/auto_complete.dart';
import 'package:organic_deal/basket_tab/basket_tab.dart';
import 'package:organic_deal/category_tab/category_tab.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/cartListApi_controller/cartListApi_controller.dart';
import 'package:organic_deal/controller/hometab_controller/hometab_controller.dart';
import 'package:organic_deal/drawer/faq_drawer.dart';
import 'package:organic_deal/drawer/my_wallet.dart';
import 'package:organic_deal/drawer/notification_drawer.dart';
import 'package:organic_deal/drawer/profile_page_drawer.dart';
import 'package:organic_deal/home_tab/home_tab.dart';
import 'package:organic_deal/model/homefilter_model.dart';
import 'package:organic_deal/myList_tab/myList_tab.dart';
import 'package:organic_deal/pages/privacy_policy.dart';
import 'package:organic_deal/wishlist_tab/wishlist_tab.dart';
import '../drawer/customer_support_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeTabController _homeTabController = Get.put(HomeTabController());
  CartListApiController _cartListApiController =
      Get.put(CartListApiController());
  GlobalKey<ScaffoldState> _key = GlobalKey();
  GlobalKey<ScaffoldState> _NavKey = GlobalKey();
  var _selectedIndex = 0;
  var PagesAll = [
    HomeTab(),
    CategoryTab(),
    WishlistTab(),
    MyWallet(),
    ProfileTab()
    ///FGFDGFD
    //CDCDCDCDCDCDECDCCCE
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _onItemTapped(int index) {
  //  if(index !=1){
  //    setState(() {
  //      _selectedIndex = index;
  //    });
  //  }else{
  //    Navigator.of(context).push(
  //      MaterialPageRoute(builder: (context)=> BasketTab()),
  //    );
  //  }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      drawer: _drawer(),
      extendBody: true,
      // backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          //DVDVDVDVDVDVHGMHGMHGMHGMHMHGMHGMHCZCBGNBGFNBGFNGFNGFNGFN
          notchMargin: 4,
          child: BottomNavigationBar(  
          
            
        
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: green,
            unselectedItemColor: Colors.grey,
            items: [
              itemBar(Icons.home, "Home"),
              itemBar(Icons.shop, "Shop"),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.transparent,
                  ),
                  label: ""),
              itemBar(Icons.account_balance_wallet_sharp, "Wallet"),
              itemBar(Icons.person, "Profile"),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: () {
          _cartListApiController.getCartListApi();
          _cartListApiController.update();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BasketTab()));
        },
        child: Image.asset(
          'assets/images/cart4.png',
          scale: 20,
          color: white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Stack(
      //   children: [
      //      // Container(
      //      //   decoration: BoxDecoration(
      //      //     gradient: LinearGradient(
      //      //       colors: [Color(0xFF2C5E1A), Colors.orange],
      //      //       begin: Alignment.topCenter,
      //      //       end: Alignment.topRight,
      //      //       stops: [0.0, 0.8],
      //      //       tileMode: TileMode.clamp,
      //      //     ),
      //      //   ),
      //      //   child: BottomNavigationBar(
      //      //     backgroundColor: Colors.transparent,
      //      //      items: <BottomNavigationBarItem>[
      //      //        BottomNavigationBarItem(
      //      //          icon: Image.asset( _selectedIndex==0 ? 'assets/images/home2.png' : 'assets/images/home1.png',
      //      //            color: _selectedIndex==0 ? green : Colors.grey,scale: 22,),
      //      //          label: 'Home',
      //      //        ),
      //      //        BottomNavigationBarItem(
      //      //          icon: Image.asset( _selectedIndex==1 ? 'assets/images/category2.png' : 'assets/images/category1.png',
      //      //            color: _selectedIndex==1 ? green : Colors.grey,scale: 22,),
      //      //          label: 'Category',
      //      //        ),
      //      //        BottomNavigationBarItem(
      //      //          icon:Image.asset(_selectedIndex==2 ? 'assets/images/list2.png' : 'assets/images/list.png',
      //      //            color: _selectedIndex==2 ? green : Colors.grey,scale: 22,),
      //      //          label: 'My List',
      //      //        ),
      //      //        BottomNavigationBarItem(
      //      //          icon: Image.asset(_selectedIndex==3 ? 'assets/images/cart1.png' : 'assets/images/cart.png',
      //      //            color: _selectedIndex==3 ? green : Colors.grey,scale: 22,),
      //      //          label: 'Basket',
      //      //        ),
      //      //      ],
      //      //      type: BottomNavigationBarType.fixed,
      //      //      currentIndex: _selectedIndex,
      //      //      selectedItemColor: green,
      //      //      unselectedItemColor: Colors.grey,
      //      //      iconSize: 22,
      //      //      onTap: _onItemTapped,
      //      //      elevation: 2,
      //      //      selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,
      //      //          fontFamily: 'Roboto-Regular.ttf'),
      //      //      unselectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,
      //      //          fontFamily: 'Roboto-Regular.ttf'),
      //      //    ),
      //      // ),
      //     CurvedNavigationBar(
      //         height: 50,
      //         backgroundColor: Colors.transparent,
      //         key: _NavKey,
      //         items: [
      //           Image.asset('assets/images/home1.png',
      //             color:  white,scale: 20,),
      //           Image.asset('assets/images/wishlist.png',
      //             color: white ,scale: 18,),
      //           // Image.asset(_selectedIndex==2 ? 'assets/images/list2.png' : 'assets/images/list2.png',
      //           //   color: /*_selectedIndex==2 ? white :*/ Colors.white60,scale: 22,),
      //           Image.asset('assets/images/category2.png',
      //              color: white ,scale: 18,),
      //         ],
      //         buttonBackgroundColor: const Color(0xFF2C5E1A),
      //          onTap: (index){
      //           // _onItemTapped(index);
      //          // _homeTabController.update();
      //
      //          setState(() {
      //            _selectedIndex = index;
      //          });
      //          },
      //       //  animationCurve: Curves.fastLinearToSlowEaseIn,
      //         animationDuration: Duration(milliseconds: 600),
      //         color:const Color(0xFF2C5E1A)
      //     ),
      //     // const Positioned(
      //     //   top: 3,right: 20,
      //     //   child:  CircleAvatar(
      //     //     radius: 10,
      //     //     child: Text(
      //     //       '1',
      //     //       style: TextStyle(
      //     //         fontSize: 10,
      //     //         color: Colors.white,
      //     //       ),
      //     //     ),
      //     //     backgroundColor: Colors.deepOrangeAccent,
      //     //   ),)
      //   ],
      // ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              elevation: 0,
              centerTitle: true,
              backgroundColor: green,
              leading: IconButton(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 6),
                icon: Image.asset(
                  'assets/images/hamburger.png',
                  scale: 22,
                  color: white,
                ),
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
              ),
              title: (_selectedIndex == 1)
                  ? Text(
                      'Order Again',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: white,
                          fontWeight: FontWeight.w600),
                    )
                  : (_selectedIndex == 3)
                      ? Text(
                          'Shop by Category',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: white,
                              fontWeight: FontWeight.w600),
                        )
                      : (_selectedIndex == 4)
                          ? Text(
                              'My Wallet',
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.w600),
                            )
                          : Image.asset(
                              'assets/images/logo1.png',
                              scale: 11,
                              fit: BoxFit.cover,
                            ),
              // actions: [
              //   IconButton(
              //     icon:  _selectedIndex==0 ?  Image.asset('assets/images/cart4.png',scale: 20,)
              //       : Container(),
              //     onPressed: () {
              //       Get.to(BasketTab());
              //     },
              //   ),
              // ],
              bottom: _selectedIndex == 1 ||
                      _selectedIndex == 4 ||
                      _selectedIndex == 3
                  ? null
                  : AppBar(
                      elevation: 0,
                      toolbarHeight: 45,
                      backgroundColor: green,
                      automaticallyImplyLeading: false,
                      titleSpacing: 4.0,
                      title: _filter(),
                      //    Container(
                      //      width: double.infinity,
                      //      height: 40,
                      //      decoration: BoxDecoration(
                      //       color: Colors.grey.shade100,
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: Center(
                      //     child: TextField(
                      //       cursorColor: green,
                      //       decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           isDense: true,
                      //           hintText: 'Search for something',
                      //           hintStyle:  GoogleFonts.montserrat(fontSize: 12,
                      //               color: grey,fontWeight: FontWeight.w500),
                      //           prefixIcon: Icon(Icons.search,color: Colors.grey,size: 22,),
                      //           suffixIcon: Icon(Icons.mic,color: Colors.grey,size: 22,)),
                      //     ),
                      //   ),
                      // ),
                    )),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              PagesAll[_selectedIndex],
            ]),
          ),
        ],
      ),
    );
  }

  // home search filter
  _filter() {
    return Autocomplete<HomeSearchModel>(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<HomeSearchModel>.empty(); //List.empty();
        }
        return _homeTabController.gethomesearch!
            .where((HomeSearchModel pname) => pname.productName
                .toLowerCase()
                .startsWith(textEditingValue.text.toLowerCase()))
            .toList();
      },
      displayStringForOption: (HomeSearchModel pname) => pname.productName,
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: white, //Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: fieldTextEditingController,
                style: GoogleFonts.montserrat(
                    fontSize: 16, color: black, fontWeight: FontWeight.w500),
                cursorColor: grey,
                focusNode: fieldFocusNode,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: 'Search something',
                    hintStyle: GoogleFonts.montserrat(
                        fontSize: 12, color: grey, fontWeight: FontWeight.w500),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 22,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      color: Colors.grey,
                      size: 22,
                    )),
                onChanged: (value) {
                  _homeTabController.homesearchApi(value.toString());
                },
              ),
            ));
      },
      // onSelected: (HomeSearchModel selection){
      // },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<HomeSearchModel> onSelected,
          Iterable<HomeSearchModel> pname) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              width: 330,
              // height: 200,
              color: Colors.grey.shade200,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 10.0),
                  itemCount: pname.length,
                  itemBuilder: (BuildContext context, int index) {
                    final HomeSearchModel option = pname.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        // onSelected(option);
                        Get.to(HomeView(
                          text: option.productName,
                        ));
                      },
                      child: ListTile(
                        title: Text(
                          option.productName,
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    );
  }

  _drawer() {
    final textSize = GoogleFonts.montserrat(
        fontSize: 14, color: black, fontWeight: FontWeight.w500);
    return Drawer(
      backgroundColor: white,
      child: ListView(
        children: [
          //Drawer header for Heading part of drawer
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment(0.3, 0),
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
                colors: [
                  green,
                  Colors.orange,
                ],
              ),
            ),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo1.png',
                    scale: 7,
                  ),
                  Obx(() => Text(
                        _homeTabController.address.value,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: white,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                      fixedSize: const Size(20, 20)),
                  child: const Icon(
                    Icons.home,
                    size: 15,
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Home", style: textSize)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.indigo,
                      shape: const CircleBorder(),
                      fixedSize: const Size(20, 20)),
                  child: const Icon(
                    Icons.person,
                    size: 17,
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(ProfilePageDrawer());
                  },
                  child: Text("My Profile", style: textSize)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: green,
                      shape: const CircleBorder(),
                      fixedSize: const Size(20, 20)),
                  child: const Icon(
                    Icons.shopping_bag,
                    size: 15,
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(BasketTab());
                  },
                  child: Text("My Basket", style: textSize)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.pinkAccent,
                      shape: const CircleBorder(),
                      fixedSize: const Size(20, 20)),
                  child: const Icon(
                    Icons.favorite_sharp,
                    size: 15,
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(WishlistTab());
                  },
                  child: Text("My Wishlist", style: textSize)),
            ],
          ),
          Divider(),
          //SizedBox(height: 5,),
          GestureDetector(
            onTap: () {
              Get.to(NotificationDrawer());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.purple,
                        shape: const CircleBorder(),
                        fixedSize: const Size(20, 20)),
                    child: const Icon(
                      Icons.notifications,
                      size: 17,
                    )),
                Text("Notification", style: textSize),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.lightBlue,
                      shape: const CircleBorder(),
                      fixedSize: const Size(20, 20)),
                  child: const Icon(
                    Icons.privacy_tip_sharp,
                    size: 15,
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(const PrivacyPolicy());
                  },
                  child: Text(
                    "Privacy Policy",
                    style: textSize,
                  )),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.orange,
                      shape: const CircleBorder(),
                      fixedSize: const Size(20, 20)),
                  child: const Icon(
                    Icons.chat_bubble,
                    size: 15,
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(FaqDrawer());
                  },
                  child: Text("FAQ", style: textSize)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                      fixedSize: const Size(20, 20)),
                  child: const Icon(
                    Icons.headphones,
                    size: 15,
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(CustomerSupportDrawer());
                  },
                  child: Text("Customer support", style: textSize)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.teal,
                      shape: const CircleBorder(),
                      fixedSize: const Size(20, 20)),
                  child: const Icon(
                    Icons.login_sharp,
                    size: 15,
                  )),
              Text("Login/Sign Up", style: textSize),
            ],
          ),
        ],
      ),
    );
  }
}

itemBar(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}

// const Positioned(
//   top: 1,right: 1,
//   child:  CircleAvatar(
//     radius: 8,
//     child: Text(
//       'S',
//       style: TextStyle(
//         fontSize: 8,
//         color: Colors.white,
//       ),
//     ),
//     backgroundColor: Colors.orange,
//   ),)
//
//
// CurvedNavigationBar(
//   height: 48,
//   backgroundColor: Colors.transparent,
//   key: _NavKey,
//   items: [
//     Image.asset('assets/images/home.png',scale: 20,color: myindex==0 ? green : Colors.grey,),
//     Image.asset('assets/images/category1.png',scale: 20),
//     // Icon(myindex == 0 ? Icons.home_outlined
//     //     : Icons.home),
//     // Icon(myindex == 1 ? Icons.message
//     //     : Icons.message_outlined),
//     Image.asset('assets/images/cart.png',scale: 20),
//     Image.asset('assets/images/cart.png',scale: 20),
//   ],
//   buttonBackgroundColor: Colors.white,
//   onTap: (index){
//     setState(() {
//       myindex = index;
//     });
//   },
//   animationCurve: Curves.fastLinearToSlowEaseIn,
//   color: Colors.grey.shade100,
// ),