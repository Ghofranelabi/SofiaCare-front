import 'package:flutter/material.dart';
import 'package:sofiacare/patient/screens/colors.dart';

class NewPost extends StatelessWidget {
  const NewPost({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 110,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container( 
                child: CircleAvatar(
  radius: 30,
  backgroundImage: AssetImage('assets/images/doctor2.jpg'),
),
                margin: EdgeInsets.only(left: 10),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                width: 100,
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Quoi de neuf ?",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
  margin: EdgeInsets.only(top: 10),
  alignment: Alignment.center,
  color: wColor,
  height: 15,
  width: MediaQuery.of(context).size.width * 0.22,
  child: Container(
    width: 90,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 30,
            child: Icon(
              Icons.photo,
              color: Colors.green,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 40,
            child: Text("Photo"),
          ),
        ],
      ),
    ),
  ),
),


            ],
          ),
        ],
      ),
    );
  }
}
