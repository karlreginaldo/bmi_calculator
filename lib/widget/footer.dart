import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('YOU WANT TO SEE YOUR HISTORY?'),
        FlatButton(
          child: Text(
            'REVIEW',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xff009DF5),
            ),
          ),
          onPressed: showBottomSheet,
        )
      ],
    );
  }
}

showBottomSheet() {
  return Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xff828282), Colors.white],
        ),
      ),
      child: showHistoryList(),
    ),
  );
}

showHistoryList() {
//TODO: Decide if you use either firestore or localdatabase
  return Expanded(
    child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Theme(
            data: ThemeData(
              primaryColor: Colors.black,
              accentColor: Colors.black,
            ),
            child: ListTile(
              title: Text('Title'),
              contentPadding: EdgeInsets.all(20),
              subtitle: Text('Subtitle'),
              trailing: Icon(
                Icons.check,
                color: Colors.green,
              ),
              //TODO: it should beDate Created
              isThreeLine: true,
            ),
          );
        }),
  );
}
