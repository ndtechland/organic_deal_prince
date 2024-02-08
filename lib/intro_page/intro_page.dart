//import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/Home_page/home_page.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/pages/login_page.dart';
import 'package:pinput/pinput.dart';

import '../pages/signup_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  TextEditingController countryController = TextEditingController();
  int pageIndex = 0;
  List<Widget> _demo = [
    Image.asset(
      'assets/images/intro1.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/intro2.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/vegetable.webp',
      fit: BoxFit.cover,
    ),
    // Column(
    //   children: [
    //     // Text('Organic Deal',
    //     //   style: TextStyle(
    //     //     color: Color(0xFFB40284A),
    //     //     fontSize: 28,
    //     //   ),),
    //     Container(
    //       // height: 300,
    //       color: Colors.transparent,
    //       child: Image.asset('assets/images/intro1.png',height: 300,fit: BoxFit.cover,),),
    //   ],
    // ),
    // Column(
    //   children: [
    //     // Text('Organic Deal',
    //     //   style: TextStyle(
    //     //     color: Color(0xFFB40284A),
    //     //     fontSize: 28,
    //     //   ),),
    //     Container(
    //       // height: 300,
    //       color: Colors.transparent,
    //       child: Image.asset('assets/images/intro2.png',height: 300,fit: BoxFit.cover,),),
    //   ],
    // ),
    // Container(child: Image.asset('assets/images/intro2.png',fit: BoxFit.cover,),),
    // Container(child: Image.asset('assets/images/intro1.png',fit: BoxFit.cover,),),
  ];
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10, left: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo1.png',
                        scale: 7,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Organic & Natural',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          'Our Products are always kept fresh. They are 100% natural,healthy and safe for consumption.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )),
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Container(
                  //height: 500,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: PageView(
                    children: _demo,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 5.0),
              //     child: CarouselIndicator(
              //       space: 1,
              //       height: 3,
              //       color: Colors.grey,
              //       activeColor: Colors.green.shade600,
              //       count: _demo.length,
              //       index: pageIndex,
              //     ),
              //   ),
              // ),
              Spacer(),
              Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(child: _isVisible ? _phoneView() : _pinView()),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade600,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            showToast();
                            // _isVisible ? _phoneView() : _pinView();
                          },
                          child: _isVisible
                              ? Text(
                                  "Send the code",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "Edit Phone Number",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(LoginPage());
                            },
                            child: Text(
                              "Email Login",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(SignupPage());
                            },
                            child: Text(
                              "New User?",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _phoneView() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Phone Verification",
            style: GoogleFonts.montserrat(
                fontSize: 16, color: black, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "We need to register your phone without getting started!",
          style: GoogleFonts.montserrat(
              fontSize: 16, color: black, fontWeight: FontWeight.w500),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 40,
                child: TextField(
                  controller: countryController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.montserrat(
                      fontSize: 16, color: black, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Text(
                "|",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextField(
                cursorColor: grey,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Phone",
                    hintStyle: GoogleFonts.montserrat(
                        fontSize: 16, color: grey, fontWeight: FontWeight.w500),
                    counterText: ''),
              ))
            ],
          ),
        ),
      ],
    );
  }

  _pinView() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Otp Verification",
            style: GoogleFonts.montserrat(
                fontSize: 16, color: black, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "We need to verify Otp without getting started!",
          style: GoogleFonts.montserrat(
              fontSize: 16, color: black, fontWeight: FontWeight.w500),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 55,
          child: Pinput(
              length: 4,
              // defaultPinTheme: defaultPinTheme,
              // focusedPinTheme: focusedPinTheme,
              // submittedPinTheme: submittedPinTheme,

              showCursor: true,
              onCompleted: (pin) => Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()))
              //Get.to(() => const HomePage())//print(pin),
              ),
        ),
      ],
    );
  }
}
