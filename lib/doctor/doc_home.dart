import 'package:flutter/material.dart';
import 'package:sofiacare/doctor/home/app_bar.dart';
import 'package:sofiacare/doctor/home/new_post.dart';
import 'package:sofiacare/doctor/home/posts.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              MyAppBar(),
              NewPost(),
              Posts(),
              ],
            ),
        ),
      ),
    );
  }
}