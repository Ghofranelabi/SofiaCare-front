import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicons/unicons.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key});

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController textController = TextEditingController();
  late ImagePicker _imagePicker;
  XFile? _selectedImage;
  String? _selectedImagePath;
  List<String> posts = [];
  List<TextEditingController> postTextControllers = [];
  List<int> likesCount = [];

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
        _selectedImagePath = selectedImage.path;
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
        _selectedImage = null;
        _selectedImagePath = null;
        likesCount.add(0); // Initialize like count as zero for the new post
      });
    }
  }

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
      postTextControllers.removeAt(index);
      likesCount.removeAt(index);
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

  void _toggleLike(int index) {
    setState(() {
      if (likesCount[index] == 0) {
        likesCount[index] = 1; // If post is not liked, set like count to 1
      } else {
        likesCount[index] = 0; // If post is already liked, set like count to 0
      }
    });
  }

  Widget _buildPostContent() {
    if (_selectedImagePath != null) {
      return Image.file(File(_selectedImagePath!));
    } else {
      return TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: "Quoi de neuf ?",
          border: InputBorder.none,
        ),
      );
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
                    backgroundImage: AssetImage('assets/images/lilia.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr.Lilia Jemai",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildPostContent(),
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
                                  backgroundImage: AssetImage('assets/images/lilia.jpg'),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr.Lilia Jemai",
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
                                        _toggleLike(index); // Call the _toggleLike method
                                      },
                                      icon: Icon(
                                        UniconsLine.heart,
                                        size: 20,
                                        color: likesCount[index] == 1 ? Colors.red : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'J\'aime ${likesCount[index]}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    IconButton(
                                      onPressed: () {
                                        // Handle comment icon tap
                                      },
                                      icon: Icon(
                                        UniconsLine.comment_edit,
                                        size: 20,
                                        color: Colors.green,
                                      ),
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
