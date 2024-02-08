import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';
import 'package:organic_deal/controller/loginemail_controller/loginemail_controller.dart';
import 'package:organic_deal/pages/signup_page.dart';
import 'package:organic_deal/widgets/my_textfield.dart';
import 'package:organic_deal/widgets/square_tile.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  LoginEmailController _loginEmailController = Get.put(LoginEmailController());
  final _formKey = new GlobalKey<FormState>();
  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Image.asset('assets/images/logo1.png',scale: 8,),
                const SizedBox(height: 10),
                // welcome back, you've been missed!
                Text(
                  'Reset Password !',
                  style:GoogleFonts.montserrat(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 25),
                // username textfield
                MyTextField(
                  controller: _loginEmailController.Email,
                  hintText: 'Email',
                  obscureText: false,
                  validator: (value) => value.isEmpty ? 'Email cannot be blank':null,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
                    validateAndSave();
                    // _loginEmailController.isLoading(true);
                    // _loginEmailController.checkLogin();
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
                        "Submit",
                        style:GoogleFonts.montserrat(fontSize: 16,color: white,fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
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
                          'Or continue with',
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

                const SizedBox(height: 20),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/images/google_icon.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/images/apple_icon.png')
                  ],
                ),

                const SizedBox(height: 20),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style:GoogleFonts.montserrat(fontSize: 14,color: grey,fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: (){
                        Get.to(SignupPage());
                      },
                      child: Text(
                        'Register now',
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
    );
  }
  void validateAndSave(){
    final form = _formKey.currentState;
    if(form!.validate())
    {
      print ('Form is valid');
    }
    else
    {
      print('form is invalid');
    }
  }
}