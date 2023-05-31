import 'package:flutter/material.dart';
import 'package:sofiacare/tools/colors.dart';

class NewPost extends StatelessWidget {
  const NewPost({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 216,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFD9E4EE),
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
                width: 166,
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
                          color: Color(0xFFD9E4EE),
                          child: Icon(
                            Icons.photo,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 40,
                          color: Color(0xFFD9E4EE),
                          child: Text("Photo"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                
                width: 10), // Add a space between the "Photo" section and the button
              ElevatedButton(
                onPressed: () {
                  // Handle the button press event
                },
                child: Text("Poster"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
