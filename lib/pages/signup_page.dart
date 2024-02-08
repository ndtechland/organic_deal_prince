
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/Home_page/home_page.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/signup_controller/signup_controller.dart';
import 'package:organic_deal/intro_page/intro_page.dart';
import 'package:organic_deal/widgets/my_textfield.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final SignupController _signupController = Get.put(SignupController());
  bool _isVisible = false;
  void showToast() {
    // setState(() {
    //   _isVisible = !_isVisible;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
             key:  _signupController.SignupFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Image.asset('assets/images/logo1.png',scale: 8,),
                  const SizedBox(height: 10),
                  // welcome back, you've been missed!
                  Text(
                    'Please fill the form to Create an account',
                    style:GoogleFonts.montserrat(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 25),
                  // username textfield
                  MyTextField(
                    controller: _signupController.Fullname,
                    hintText: 'Full name',
                    obscureText: false,
                    validator: (value) => value.isEmpty ? 'Full name cannot be blank':null,
                  ),
                  const SizedBox(height: 10),
                  // password textfield
                  MyTextField(
                    controller: _signupController.Email,
                    hintText: 'Email',
                    obscureText: false,
                    validator: (value) => value.isEmpty ? 'Email cannot be blank':null,
                    // onChanged: '',
                  ),
                  const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    cursorColor: grey,
                    maxLength: 10,
                    style:GoogleFonts.montserrat(fontSize: 16,color: black,fontWeight: FontWeight.w500),
                    controller: _signupController.Phone,
                    validator: (value) => value!.isEmpty ? 'Phone cannot be blank': value.length<10 ?
                    'Phone number is not correct' : null,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Phone",
                      hintStyle: GoogleFonts.montserrat(fontSize: 16,color: grey,fontWeight: FontWeight.w500),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade400),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade400),
                      ),
                      counterText: ''
                    ),
                    //onChanged: onChanged,
                   // validator: validator,
                  )
                ),
                  // MyTextField(
                  //   controller: _signupController.Phone,
                  //   hintText: 'Phone',
                  //   obscureText: false,
                  //   validator: (value) => value.isEmpty ? 'Phone cannot be blank':null,
                  //   // onChanged: '',
                  // ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _signupController.Password,
                    hintText: 'Password',
                    obscureText: true,
                    validator: (value) => value.isEmpty ? 'Password cannot be blank':null,
                    //onChanged: '',
                  ),
                  const SizedBox(height: 10),
                  Obx(()=> _signupController.isVisible.value?
                       _register() : _otpButton()
                  ) ,
                  const SizedBox(height: 10),
                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or',
                            style:GoogleFonts.montserrat(fontSize: 14,color: grey,fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account?',
                        style:GoogleFonts.montserrat(fontSize: 14,color: grey,fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: (){
                          Get.to(const IntroPage());
                        },
                        child: Text(
                          'Login',
                          style:GoogleFonts.montserrat(fontSize: 15,color: green,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  _register(){
    return Column(
      children: [
        MyTextField(
          controller: _signupController.Otp,
          hintText: 'Otp',
          obscureText: false,
          validator: (value) => value.isEmpty ? 'Otp cannot be blank':null,
          //onChanged: '',
        ),
        const SizedBox(height: 10),
        // sign in button
        GestureDetector(
          onTap: (){
            _signupController.checkSignupOtp();
          // _signupController.isVisible.value = !_signupController.isVisible.value;
          //   if(_signupController.Fullname.text==''|| _signupController.Phone.text==''||_signupController.Email.text==''||
          //       _signupController.Password.text==''){
          //
          //     Get.snackbar("Failed", "Please fill all fields");
          //   }else{
          //     _signupController.verifyOtpApi();
          //   }
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Register",
                style:GoogleFonts.montserrat(fontSize: 16,color: white,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ]
    );
  }
  _otpButton(){
    return   GestureDetector(
      onTap: (){
        _signupController.checkSignup();
      //  _signupController.isVisible.value = !_signupController.isVisible.value;
        // if(_signupController.Fullname.text==''|| _signupController.Phone.text==''||_signupController.Email.text==''||
        //     _signupController.Password.text==''){
        //   _signupController.signupApi();
        //   Get.snackbar("Failed", "Please fill all fields");
        // }else{
        //   _signupController.signupApi();
        //   _signupController.isVisible.value = !_signupController.isVisible.value;
        // }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "Send otp",
            style:GoogleFonts.montserrat(fontSize: 16,color: white,fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   var _textstyle=GoogleFonts.montserrat(fontSize: 16,color: white,fontWeight: FontWeight.w500);
  //   final radius = BorderRadius.circular(8.0);
  //   return Scaffold(
  //       appBar: AppBar(
  //         elevation: 0,
  //         backgroundColor: green,
  //         title: Text("Signup",
  //             style: _textstyle),
  //         centerTitle: true,
  //         leading: IconButton(
  //           iconSize: 20,
  //           alignment: Alignment.centerLeft,
  //           onPressed: (){
  //             Navigator.pop(context);
  //           },
  //           icon: Icon(Icons.arrow_back_ios_outlined,),
  //         ),
  //       ),
  //       body: SingleChildScrollView(
  //         child: Container(
  //           margin: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
  //           child: Column(children: [
  //             Container(
  //               height: 50,
  //               child: TextFormField(
  //                 style: TextStyle(color: black,fontSize: 16),
  //                 controller: _signupController.Fullname,
  //                 cursorColor: Colors.black,
  //                 decoration: InputDecoration(
  //                   enabledBorder:  OutlineInputBorder(
  //                     borderRadius: radius,
  //                     borderSide:  BorderSide(color: grey, width: 1.0),
  //                   ),
  //                   contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
  //                   isDense: true,
  //                   border: OutlineInputBorder(
  //                       borderRadius: radius
  //                   ),
  //                   labelStyle: TextStyle(color: grey,fontSize: 16),
  //                   labelText: 'Full Name',
  //                   //hintText: 'Ravi',
  //                   focusedBorder:OutlineInputBorder(
  //                     borderSide: BorderSide(color: grey, width: 1.0),
  //                     borderRadius: radius,
  //                   ),
  //                   floatingLabelStyle:   TextStyle(color: primaryColor),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 8,),
  //             Container(
  //               height: 50,
  //               child: TextFormField(
  //                 style: TextStyle(color: black,fontSize: 16),
  //                 controller: _signupController.Email,
  //                 cursorColor: Colors.black,
  //                 decoration: InputDecoration(
  //                   enabledBorder:  OutlineInputBorder(
  //                     borderRadius: radius,
  //                     borderSide:  BorderSide(color: grey, width: 1.0),
  //                   ),
  //                   contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
  //                   isDense: true,
  //                   border: OutlineInputBorder(
  //                       borderRadius: radius
  //                   ),
  //                   labelStyle: TextStyle(color: grey,fontSize: 16),
  //                   labelText: 'Email',
  //                   //hintText: 'Ravi',
  //                   focusedBorder:OutlineInputBorder(
  //                     borderSide: BorderSide(color: grey, width: 1.0),
  //                     borderRadius: radius,
  //                   ),
  //                   floatingLabelStyle:   TextStyle(color: primaryColor),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 8,),
  //             Container(
  //               height: 50,
  //               child: TextFormField(
  //                 style: TextStyle(color: black,fontSize: 16),
  //                 controller: _signupController.Phone,
  //                 cursorColor: Colors.black,
  //                 decoration: InputDecoration(
  //                   enabledBorder:  OutlineInputBorder(
  //                     borderRadius: radius,
  //                     borderSide:  BorderSide(color: grey, width: 1.0),
  //                   ),
  //                   contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
  //                   isDense: true,
  //                   border: OutlineInputBorder(
  //                       borderRadius: radius
  //                   ),
  //                   labelStyle: TextStyle(color: grey,fontSize: 16),
  //                   labelText: 'Phone Number',
  //                   //hintText: 'Ravi',
  //                   focusedBorder:OutlineInputBorder(
  //                     borderSide: BorderSide(color: grey, width: 1.0),
  //                     borderRadius: radius,
  //                   ),
  //                   floatingLabelStyle:   TextStyle(color: primaryColor),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 8,),
  //             Container(
  //               height: 50,
  //               child: TextFormField(
  //                 style: TextStyle(color: black,fontSize: 16),
  //                 controller: _signupController.Password,
  //                 cursorColor: Colors.black,
  //                 decoration: InputDecoration(
  //                   enabledBorder:  OutlineInputBorder(
  //                     borderRadius: radius,
  //                     borderSide:  BorderSide(color: grey, width: 1.0),
  //                   ),
  //                   contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
  //                   isDense: true,
  //                   border: OutlineInputBorder(
  //                       borderRadius: radius
  //                   ),
  //                   labelStyle: TextStyle(color: grey,fontSize: 16),
  //                   labelText: 'Password',
  //                   //hintText: 'Ravi',
  //                   focusedBorder:OutlineInputBorder(
  //                     borderSide: BorderSide(color: grey, width: 1.0),
  //                     borderRadius: radius,
  //                   ),
  //                   floatingLabelStyle:   TextStyle(color: primaryColor),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 5.0),
  //             Container(
  //               height: 47,width: 250.0,
  //               child:
  //               ElevatedButton(
  //                 child: Text('Signup'),
  //                 style: ElevatedButton.styleFrom(
  //                     primary: Colors.green,
  //                     textStyle:   GoogleFonts.montserrat(fontSize: 16,color: white,fontWeight: FontWeight.w500)
  //                 ),
  //                 onPressed: () {
  //                   if(_signupController.Fullname.text==''|| _signupController.Phone.text==''||_signupController.Email.text==''||
  //                       _signupController.Password.text==''){
  //                     showToast('Text Field is empty, Please Fill All Data',
  //                         context: context,
  //                         animation: StyledToastAnimation.slideFromRight,
  //                         reverseAnimation: StyledToastAnimation.slideToRight,
  //                         position: StyledToastPosition.center,
  //                         startOffset: Offset(1.0, 0.0),
  //                         reverseEndOffset: Offset(1.0, 0.0),
  //                         animDuration: Duration(seconds: 1),
  //                         duration: Duration(seconds: 4),
  //                         curve: Curves.linearToEaseOut,
  //                         reverseCurve: Curves.fastOutSlowIn,
  //                         backgroundColor: primaryColor.withOpacity(0.7));
  //                   }else{
  //                     _signupController.checkLogin();
  //                   }
  //                 },
  //               ),
  //               // RaisedButton(
  //               //   disabledColor: grey,
  //               //   shape: RoundedRectangleBorder(
  //               //       borderRadius: radius),
  //               //   color: primaryColor,
  //               //   elevation: 0,
  //               //   onPressed: (){
  //               //     // if(_nameController.text==''||_companyController.text==''||
  //               //     //     _phoneController.text==''||_emailController.text==''||_addressController.text==''||
  //               //     //     _cityController.text==''||_stateController.text==''||
  //               //     //     _zipController.text==''){
  //               //     //   _toast1();
  //               //     //   // print('Text Field is empty, Please Fill All Data');
  //               //     // }else{
  //               //     //   // login(_nameController.text,_companyController.text,
  //               //     //   //     _phoneController.text, _emailController.text,
  //               //     //   //     _addressController.text,_cityController.text,
  //               //     //   //     _stateController.text,_zipController.text);
  //               //     // }
  //               //   },
  //               //   child:  Text("Create",
  //               //     style: TextStyle(color: white,fontSize: 16),
  //               //   ),
  //               // ),
  //
  //             ),
  //           ],),
  //         ),
  //       ));
  // }
  // _toast1(){
  //   return   showToast('Text Field is empty, Please Fill All Data',
  //       //context: context,
  //       animation: StyledToastAnimation.slideFromRight,
  //       reverseAnimation: StyledToastAnimation.slideToRight,
  //       position: StyledToastPosition.center,
  //       startOffset: Offset(1.0, 0.0),
  //       reverseEndOffset: Offset(1.0, 0.0),
  //       animDuration: Duration(seconds: 1),
  //       duration: Duration(seconds: 4),
  //       curve: Curves.linearToEaseOut,
  //       reverseCurve: Curves.fastOutSlowIn,
  //       backgroundColor: primaryColor.withOpacity(0.7));
  // }

