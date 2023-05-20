import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sofiacare/patient/profile/presentation.dart';
import 'package:sofiacare/patient/profile/quest_ans.dart';

import '../../tools/colors_palette.dart';
import '../../welcome_animation/sign/button/button_sign.dart';

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
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1), // Adjust the height as needed
          child: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
          body: Column(
  children: [
   Container(
  height: 100,
  width: 100,
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
                    QuestionAnswerScreen()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
