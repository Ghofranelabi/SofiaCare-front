import 'package:flutter/material.dart';
import 'package:sofiacare/patient/profile/presentation.dart';
import 'package:sofiacare/patient/profile/quest_ans.dart';
import 'package:sofiacare/patient/profile/search_screen.dart';

import '../../tools/colors_palette.dart';
import '../../welcome_animation/sign/button/button_sign.dart';
import '../screens/colors.dart';

class Appoint extends StatefulWidget {
  const Appoint({Key? key}) : super(key: key);

  @override
  State<Appoint> createState() => _AppointScreen();
}

class _AppointScreen extends State<Appoint> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (currentFocus.hasPrimaryFocus == false &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF013871),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            ),
            elevation: 0,
            actions: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                  ],
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10), // Adjust the top padding value as needed
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF013871),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Transform.scale(
                    scale: 0.8,
                    child: Image.asset(
                      'assets/images/doctor1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsPalette.primaryColor.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ButtonSign(
                      text: "Présentation",
                      isSelected: currentPage == 0,
                      onTap: () {
                        setState(() {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 25,
                    color: Colors.grey.shade300,
                  ),
                  Expanded(
                    child: ButtonSign(
                      text: "Questions/réponses",
                      isSelected: currentPage == 1,
                      onTap: () {
                        setState(() {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  controller: _controller,
                  children: [
                    Presentation(),
                    QuestionAnswerScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
