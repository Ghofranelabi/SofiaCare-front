import 'package:shared_preferences/shared_preferences.dart';
// ignore: unused_import
import 'package:sofiacare/constant.dart';
// ignore: unused_import
import 'package:sofiacare/patient/home/home_screen.dart';
import 'package:sofiacare/welcome_animation/sign/reset_pas/mdp_oubli%C3%A9.dart';
// ignore: unused_import
import 'package:sofiacare/welcome_animation/sign/register.dart';

import 'package:flutter/material.dart';

// ignore: unused_import
import '../../model/api_response.dart';
import '../../model/user.dart';
// ignore: unused_import
import '../../services/user_service.dart';

// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? _isCheked = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _login() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
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
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
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
                        borderSide: BorderSide(width: 1, color: Colors.green))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: txtPassword,
                validator: (val) =>
                    val!.length < 6 ? 'Minimum 6 caractére' : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Password',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black))),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MdpOublie()),
                      );
                    },
                    child: Text(
                      'Mot de passe oublié',
                      style: TextStyle(
                        color: Color(0xFF013871),
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
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
                            _login();
                          });
                        }
                      },
                      child: Text(
                        'Valider',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xFF013871),
                        ),
                        padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: CheckboxListTile(
                title: const Text("J'accepte les termes et les conditions",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 15, 85, 142))),
                value: _isCheked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isCheked = newValue;
                  });
                },
                activeColor: Color(0xFF013871),
                checkColor: Colors.white,
                controlAffinity: ListTileControlAffinity.leading,
                //tristate: true,
              )),
            ],
          )),
    );
  }
}
