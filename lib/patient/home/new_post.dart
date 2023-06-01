import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sofiacare/tools/colors.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key});

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController textController = TextEditingController();
  late ImagePicker _imagePicker;
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _openGallery() async {
    final XFile? selectedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        _selectedImage = selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                color: Color(0xFFD9E4EE),
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
                child: GestureDetector(
                  onTap: _openGallery,
                  child: Container(
                    color: Color(0xFFD9E4EE),
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
              ),
              SizedBox(
  width: 10,
),
Container(
  padding: EdgeInsets.only(top: 20),
  child: ElevatedButton(
    onPressed: () {
      // Handle the button press event
    },
    style: ElevatedButton.styleFrom(
      primary: Color(0xFF013871), // Set the button background color
    ),
    child: Text(
      "Poster",
      style: TextStyle(
        color: Colors.white, // Set the button text color
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
