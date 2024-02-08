import 'package:flutter/material.dart';

class MyListTab1 extends StatefulWidget {
  const MyListTab1({Key? key}) : super(key: key);

  @override
  State<MyListTab1> createState() => _MyListTab1State();
}

class _MyListTab1State extends State<MyListTab1> {
  List<String> name = ['January', 'February', 'March', 'April'];
  List<String> tempArray = [];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: name.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(name[index].toString()),
                trailing: InkWell(
                  onTap: () {
                    setState(() {});
                    if (tempArray.contains(name[index].toString())) {
                      tempArray.remove(name[index].toString());
                    } else {
                      tempArray.add(name[index].toString());
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 100,
                    color: tempArray.contains(name[index].toString())
                        ? Colors.red
                        : Colors.green,
                    child: Center(
                      child: Text(tempArray.contains(name[index].toString())
                          ? "Remove"
                          : "Add"),
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
}
