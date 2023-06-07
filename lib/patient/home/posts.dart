import 'package:flutter/material.dart';
import 'package:sofiacare/patient/profile/doc_profile.dart';
import 'package:sofiacare/settings/fav_doc.dart';
import 'package:unicons/unicons.dart';

import '../../tools/colors.dart';

class Posts extends StatefulWidget {
  const Posts();

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<bool> isLovedList = [];
  List<String> commentsList = [];
  bool showCommentField = false;

  // Function to handle submitting a comment
  void submitComment(int index, String comment) {
    setState(() {
      commentsList[index] = comment;
      showCommentField = false; // Hide the comment field after submitting
    });
  }

  // Function to add a new comment
  void addComment(int index, String comment) {
    setState(() {
      commentsList[index] = comment;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the lists based on the number of posts
    int numberOfPosts = 2; // Replace with the actual number of posts
    isLovedList = List.generate(numberOfPosts, (index) => false);
    commentsList = List.generate(numberOfPosts, (index) => "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2, // Replace with the actual number of posts
              itemBuilder: (BuildContext context, int index) {
                bool isLoved = isLovedList[index];
                String timeAgo = "6min"; // Replace with actual time logic
                String confidentiality = "public"; // Replace with actual confidentiality logic
                int likesCount = 10; // Replace with actual likes count
                int commentsCount = 5; // Replace with actual comments count

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DoctorProfile()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('assets/images/lilia.jpg'),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. Lilia Jemai",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        timeAgo,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        confidentiality == "public" ? Icons.public : Icons.person,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 150,
                              minWidth: 150,
                              maxHeight: 350.0,
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            child: Container(
                              child: Image.asset(
                                "assets/images/conseil.jpg",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0.1, bottom: 0.1),
                          child: Transform.scale(
                            scale: 1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isLovedList[index] = !isLoved;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 1),
                                    alignment: Alignment.center,
                                    color: wColor,
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: 20,
                                          color: Color(0xFFD9E4EE),
                                          child: Icon(
                                            isLoved ? Icons.favorite : Icons.favorite_border,
                                            size: 20,
                                            color: isLoved ? Colors.red : Colors.red,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 60,
                                          color: Color(0xFFD9E4EE),
                                          child: Text(
                                            isLoved ? "1 J'aime" : "J'aime",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: isLoved ? Colors.grey : Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showCommentField = !showCommentField;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    alignment: Alignment.center,
                                    color: wColor,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: 30,
                                          color: Color(0xFFD9E4EE),
                                          child: Icon(
                                            UniconsLine.comment_edit,
                                            size: 20,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 100,
                                          color: Color(0xFFD9E4EE),
                                          child: Text(
                                            "Commentaires ($commentsCount)",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        showCommentField
                            ? Container(
                                padding: EdgeInsets.all(3),
                                margin: EdgeInsets.only(bottom: 10),
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Ecrire un commentaire...",
                                          border: InputBorder.none,
                                        ),
                                        onSubmitted: (comment) {
                                          addComment(index, comment);
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showCommentField = false;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          UniconsLine.times_circle,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        commentsList[index].isNotEmpty
                            ? Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Nom de patient",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        commentsList[index],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
