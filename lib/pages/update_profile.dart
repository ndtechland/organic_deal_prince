import 'package:flutter/material.dart';

import '../colors.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({
    Key? key,
    required this.name,
    required this.mobile,
    required this.email,
  }) : super(key: key);
  String name;
  String mobile;
  String email;

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String? name1,mobile1,email1;
  void initState() {
    name1 = widget.name;
    mobile1 = widget.mobile;
    email1 = widget.email;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final name = TextEditingController(text: name1);
    final mobile = TextEditingController(text: mobile1);
    final email = TextEditingController(text: email1);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title:  const Text(
          'Update',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  [
            TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter Your Name',
              ),
            ),
            const SizedBox(height: 5,),
            TextField(
               controller: mobile,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter Your Name',
              ),
            ),
            const SizedBox(height: 5,),
             TextField(
               controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter Your Name',
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50,
                color: green,
                child: const Center(
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
