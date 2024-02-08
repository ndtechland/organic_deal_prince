import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';

class CancelOrderPage extends StatelessWidget {

 List _text = [
   'I am not at home',
   'i placed a wrong order',
   'I forgot to apply voucher',
   'I forgot to add additional item/product',
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        title: Text('Cancel Order',
            style: GoogleFonts.montserrat(fontSize: 18,color: white,fontWeight: FontWeight.w500)),
        centerTitle: true,
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
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.black87,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Select a reason to cancel",
                        style: GoogleFonts.montserrat(fontSize: 14,color: white,fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              ListView.separated(
                  separatorBuilder: (context, index) => const Divider(height: 1.0,),
                itemCount: _text.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Container(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(width: 5,),
                          Icon(Icons.circle_outlined,color: green,),
                          SizedBox(width: 10,),
                          Text("${_text[index]}",
                              style: GoogleFonts.montserrat(fontSize: 14,color: black,fontWeight: FontWeight.w500))
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      )
    );
  }
}
