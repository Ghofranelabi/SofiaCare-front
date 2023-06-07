import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicons/unicons.dart';
import '../../tools/colors.dart';
import '../../utils/config.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key});

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController textController = TextEditingController();
  late ImagePicker _imagePicker;
  XFile? _selectedImage;
  List<String> posts = [];
  List<TextEditingController> postTextControllers = [];

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    for (var controller in postTextControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _openGallery() async {
    final XFile? selectedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        _selectedImage = selectedImage;
      });
    }
  }

  void _addPost() {
    String postText = textController.text;
    if (postText.isNotEmpty) {
      setState(() {
        posts.add(postText);
        postTextControllers.add(TextEditingController(text: postText));
        textController.clear();
      });
    }
  }

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
      postTextControllers.removeAt(index);
    });
  }

  void _editPost(int index) {
    String updatedPostText = postTextControllers[index].text;
    if (updatedPostText.isNotEmpty) {
      setState(() {
        posts[index] = updatedPostText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFD9E4EE),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/doctor2.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Labidi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "à l'instant",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Quoi de neuf ?",
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: _openGallery,
                    icon: Icon(
                      Icons.photo,
                      color: Colors.green,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _addPost,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF013871),
                    ),
                    child: Text(
                      "Poster",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  TextEditingController postController;
                  if (index < postTextControllers.length) {
                    postController = postTextControllers[index];
                  } else {
                    postController = TextEditingController(text: posts[index]);
                    postTextControllers.add(postController);
                  }
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage('assets/images/doctor2.jpg'),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr. Labidi",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "à l'instant",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: postController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // Handle love icon tap
                                      },
                                      icon: Icon(
                                          UniconsLine.thumbs_up,
                                          size: 20,
                                            color: Colors.blue,),
                                    ),
                                    SizedBox(width: 5),
                                    IconButton(
                                      onPressed: () {
                                        // Handle comment icon tap
                                      },
                                      icon: Icon(
                                          UniconsLine.comment_edit,
                                          size: 20,
                                            color: Colors.green,),
                                    ),
                                  ],
                                ),
                               
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _editPost(index);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                _deletePost(index);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
