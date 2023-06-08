import 'package:flutter/material.dart';
import 'package:sofiacare/patient/profile/doc_profile.dart';
import 'package:unicons/unicons.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<String> imgs = [
    "lilia.jpg",
    "siwar.jpg",
    "bassemmk.jpg",
    "ichrak.jpg",
  ];

  List<String> postImages = [
    "post1.jpeg",
    "post2.png",
    "post3.jpeg",
    "post4.jpg",
  ];

  List<String> names = [
    "Dr. Lilia Jemai",
    "Dr. Siwar Hajri",
    "Dr. Bassem Mkadmi",
    "Dr. Ichrak ben Rhouma",
  ];

  List<int> likesList = [10, 20, 30, 40];
  List<String> commentsList = [];
  List<bool> isLovedList = [false, false, false, false]; // Track if post is loved

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

  // Function to toggle love status
  void toggleLove(int index) {
    setState(() {
      isLovedList[index] = !isLovedList[index];
      if (isLovedList[index]) {
        likesList[index] += 1;
      } else {
        likesList[index] -= 1;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the lists based on the number of posts
    int numberOfPosts = names.length;
    commentsList = List.generate(numberOfPosts, (index) => "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1500,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                int likesCount = likesList[index];
                int commentsCount = 10; // Replace with actual comments count

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for all sides
                    child: Hero(
                      tag: postImages[index],
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostImageScreen(imageUrl: postImages[index]),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorProfile(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10, top: 10),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            AssetImage("assets/images/${imgs[index]}"),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          names[index],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              // Placeholder text instead of image
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/${postImages[index]}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          UniconsLine.heart,
                                          color: isLovedList[index] ? Colors.red : Colors.grey,
                                        ),
                                        onPressed: () {
                                          toggleLove(index);
                                        },
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        likesCount.toString(),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(width: 10),
                                      IconButton(
                                        icon: Icon(
                                          UniconsLine.comment_edit,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            showCommentField = !showCommentField;
                                          });
                                        },
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        commentsCount.toString(),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              showCommentField
                                  ? Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: "Ecrire un commentaire...",
                                                border: InputBorder.none,
                                              ),
                                              onFieldSubmitted: (value) {
                                                submitComment(index, value);
                                              },
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.send),
                                            onPressed: () {
                                              submitComment(index, commentsList[index]);
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showCommentField = true;
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          "Voir tous les commentaires",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 10),
                              showCommentField
                                  ? Container()
                                  : Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        commentsList[index],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
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

class PostImageScreen extends StatelessWidget {
  final String imageUrl;

  const PostImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: Image.asset(
            "assets/images/$imageUrl",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Posts(),
  ));
}
