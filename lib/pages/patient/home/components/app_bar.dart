import 'package:flutter/material.dart';
import 'package:sofiacare/pages/components/tools/colors.dart';

class ApplicationBar extends StatelessWidget {
  const ApplicationBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 50),
            child: Image.asset(
              'assets/Asset2.png', // Replace with your logo image path
              width: 30,
              height: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "SofiaCare",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: wColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
