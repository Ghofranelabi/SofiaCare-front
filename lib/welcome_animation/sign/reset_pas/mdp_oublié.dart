import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sofiacare/welcome_animation/sign/reset_pas/verif._pass.dart';

import '../../../model/api_response.dart';
import '../../../model/user.dart';
import '../../../services/user_service.dart';

class MdpOublie extends StatefulWidget {
  const MdpOublie({super.key});

  @override
  State<MdpOublie> createState() => _MdpOublieState();
}

class _MdpOublieState extends State<MdpOublie> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  bool loading = false;

  void _sendEmail() async {
    ApiResponse response = await SendEmail(txtEmail.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  // ignore: unused_element
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Verification()),
        (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF013871),
        title: Text('Récupérer votre compte'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
            key: formkey,
            child: ListView(
              padding: EdgeInsets.all(32),
              children: [
                Text(
                  'Saisir votre Email',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: txtEmail,
                  validator: (val) =>
                      val!.isEmpty ? 'Invalid email adress' : null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.green))),
                ),
                SizedBox(
                  height: 15,
                ),
                loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                            _sendEmail();
                          });
                        }
                      },
                      child: Text(
                        'Valider',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Color(0xFF013871),),
                        padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
              ],
            )),
      ),
    );
  }
}
