import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organic_deal/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/controller/userProfile_controller/userProfile_controller.dart';
import 'package:organic_deal/drawer/notification_drawer.dart';
import 'package:organic_deal/pages/MyOrder/my_orders_page.dart';
import 'package:organic_deal/pages/login_page.dart';
import 'package:organic_deal/pages/update_profile.dart';

class ProfilePageDrawer extends StatefulWidget {
  ProfilePageDrawer({super.key});

  @override
  State<ProfilePageDrawer> createState() {
    return _ProfilePageDrawerState();
  }
}

class _ProfilePageDrawerState extends State<ProfilePageDrawer> {
  UserProfileController _userProfileController =
      Get.put(UserProfileController());

  final List _textList = [
    'My Order',
    'My Payments',
    'My Rating & Reviews',
    'Notifications',
    'Customer Service',
    'My Gift Cards',
    'My Delivery Address',
    'Delete Account',
    'Logout'
  ];

  final List _icon = [
    'assets/images/order.png',
    'assets/images/payment.png',
    'assets/images/review.png',
    'assets/images/ringing.png',
    'assets/images/headphones.png',
    'assets/images/gift-card.png',
    'assets/images/location.png',
    'assets/images/deletaccount.png',
    'assets/images/logout.png',
  ];

  final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Image.asset(
          'assets/images/logo1.png',
          scale: 12,
          fit: BoxFit.cover,
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
      body: getStorage.read("id") != null
          ? SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Obx(
                          () => _userProfileController.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : _userProfileController
                                          .getuserProfileModel?.fullName ==
                                      null
                                  ? Center(
                                      child: Text("No Data"),
                                    )
                                  : Container(
                                      height: 200,
                                      color: green,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 40.0,
                                              backgroundColor: Colors.grey,
                                              child: Image.asset(
                                                  "assets/images/profile.png"),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "${_userProfileController.getuserProfileModel?.fullName}",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 16,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                // Text("data",textAlign: TextAlign.right,)
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                "${_userProfileController.getuserProfileModel?.emailId}",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    color: white)),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                "${_userProfileController.getuserProfileModel?.phone}",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16, color: white))
                                          ],
                                        ),
                                      ),
                                    ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: Divider(height: 1),
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _textList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Get.to(MyOrderPage());
                                  } else if (index == 1) {
                                  } else if (index == 2) {
                                  } else if (index == 3) {
                                    Get.to(NotificationDrawer());
                                  } else if (index == 7) {
                                    _deleteAccountdialog(context);
                                  } else {
                                    Get.snackbar("title", "no class");
                                  }
                                },
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          _icon[index],
                                          color: Colors.grey[600],
                                          scale: 22,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          _textList[index],
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: Colors.grey[800]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                        margin:
                            const EdgeInsets.fromLTRB(10.0, 170.0, 10.0, 0.0),
                        height: 60,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                        child: ListTile(
                          horizontalTitleGap: 2,
                          dense: true,
                          leading: Image.asset(
                            'assets/images/location.png',
                            scale: 24,
                            color: Colors.red[200],
                          ),
                          title: Text(
                            "Patna Village",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: Colors.black),
                          ),
                          subtitle: Text(
                            "Bihar - 845528",
                            style: GoogleFonts.montserrat(
                                fontSize: 12, color: Colors.black),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red.shade200)),
                            child: Text(
                              'Change',
                              style: GoogleFonts.montserrat(
                                  fontSize: 8, color: Colors.red[200]),
                            ),
                          ),
                        )),
                    Positioned(
                        right: 10,
                        top: 40,
                        child: InkWell(
                            onTap: () {
                              Get.to(UpdateProfile(
                                name: '',
                                mobile: '',
                                email: '',
                              ));
                            },
                            child: Icon(
                              Icons.edit,
                              color: white,
                            )))
                  ],
                ),
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login/Signup",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not Logged in? ',
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: black,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LoginPage());
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: green,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  _deleteAccountdialog(context) {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: const Text('Delete Account?'),
            content: const Text('Are you sure you want to delete account?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                isDefaultAction: false,
                isDestructiveAction: false,
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                isDefaultAction: true,
                isDestructiveAction: true,
                child: const Text('Yes'),
              ),
            ],
          );
        });
  }
}
