import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_deal/colors.dart';

class NotificationDrawer extends StatelessWidget {
  final List _title = [
    'Rs.15 store is Live 🥰 🍅 🍑 🍒',
    'Fruits at up to 50% off 😍',
  ];
  final List _subtitle = [
    'All vegetable & Fruits under Rs.15 in one store. Excited to place the order?',
    'Starts your morning fresh,organicdeal! Orange, Banana,Grapes, Strawberry,Pear '
        '& more will be delivered in 15-30 on organicdeal now.',
  ];
  final List _image = [
    'https://png.pngtree.com/background/20210710/original/pngtree-summer-fruits-and-vegetables-hand-painted-geometric-small-fresh-green-background-picture-image_1050502.jpg',
    'https://southfloridareporter.com/wp-content/uploads/2021/03/group-fresh-vegetables-fruits_135427-235.jpg'
  ];
  // ignore: unused_field
  final List _datetime = [
    'December 23 2022 5:59 AM',
    'January 02 2022 2:00 AM'
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: green,
          title: Text('Notification',
              style: GoogleFonts.montserrat(
                  fontSize: 16, color: white, fontWeight: FontWeight.w600)),
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
          bottom: TabBar(
              padding: EdgeInsets.only(left: 10, right: 10),
              labelColor: green,
              unselectedLabelColor: white,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              indicatorColor: Colors.lime,
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Alerts",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Offers",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                )
              ] //_tabx.myTabs,
              ),
        ),
        body: TabBarView(
          children: [_alert(), _offers()],
        ),
      ),
    );
  }

  _alert() {
    return Container(
        color: white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/alert.png',
                scale: 10,
                color: red,
              ),
              Text("No Alerts to show",
                  style: GoogleFonts.montserrat(
                      fontSize: 16, color: black, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text("You don't have any existing alerts!",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, color: grey, fontWeight: FontWeight.w500))
            ],
          ),
        ));
  }

  _offers() {
    return ListView.separated(
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: const Divider(
          height: 1.0,
        ),
      ),
      itemCount: _title.length,
      itemBuilder: (context, index) {
        return Container(
            color: white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_title[index],
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                    child: Text(_subtitle[index],
                        style: GoogleFonts.montserrat(
                          color: grey,
                          fontSize: 12,
                        ))),
                Container(
                    height: 160,
                    width: double.infinity,
                    child: Image.network(
                      _image[index],
                      fit: BoxFit.cover,
                    )),
              ],
            ));
      },
    );
  }
}
