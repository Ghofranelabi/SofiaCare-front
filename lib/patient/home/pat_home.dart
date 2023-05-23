import 'package:flutter/material.dart';
import 'package:sofiacare/patient/home/app_bar.dart';
import 'package:sofiacare/patient/home/posts.dart';

class PatHome extends StatelessWidget {
  const PatHome({super.key});

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
              Posts(),
              ],
            ),
        ),
      ),
    );
  }
}