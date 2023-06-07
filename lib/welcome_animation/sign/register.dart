import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sofiacare/doctor/home/doc_home.dart';
import 'package:sofiacare/patient/home/pat_home.dart';

import '../../model/api_response.dart';
import '../../model/user.dart';
import '../../services/user_service.dart';

enum UserRole { patient, doctor }

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController(text: '+216');
  bool loading = false;
  UserRole? userRole = UserRole.patient;
  bool? _isChecked = false;

  void _register() async {
    ApiResponse response = await register(
        nomController.text,
        emailController.text,
        passwordController.text,
        userRole == UserRole.patient ? 'patient' : 'doctor');
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        if (mounted) loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (userRole == UserRole.doctor) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DoctorHome()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => PatHome()),
          (route) => false);
    }
  }

  void _showValidationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Validation'),
          content: Text('Your email has been successfully validated.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
              controller: nomController,
              validator: (val) => val!.isEmpty ? 'Invalid username' : null,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'UserName',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (val) =>
                  val!.isEmpty ? 'Invalid email adress' : null,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              validator: (val) =>
                  val!.isEmpty ? 'Minimum 6 characters' : null,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: 'Password',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: confirmPasswordController,
              validator: (val) => val != passwordController.text
                  ? 'Confirm password does not match'
                  : null,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: 'Confirm Password',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          'Patient',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        leading: Radio<UserRole>(
                          value: UserRole.patient,
                          groupValue: userRole,
                          onChanged: (UserRole? value) {
                            setState(() {
                              userRole = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          'Docteur',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        leading: Radio<UserRole>(
                          value: UserRole.doctor,
                          groupValue: userRole,
                          onChanged: (UserRole? value) {
                            setState(() {
                              userRole = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                if (userRole == UserRole.doctor) ...[
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Diplômes et formations required' : null,
                    decoration: InputDecoration(
                      labelText: 'Diplômes et formations',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? 'Adresse required' : null,
                    decoration: InputDecoration(
                      labelText: 'Adresse',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: phoneNumberController,
                    validator: (val) =>
                        val!.isEmpty ? 'Numéro de téléphone required' : null,
                    decoration: InputDecoration(
                      labelText: 'Numéro de téléphone',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: CheckboxListTile(
                      title: const Text(
                        "J'accepte les termes et les conditions",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 15, 85, 142),
                        ),
                      ),
                      value: _isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue;
                        });
                      },
                      activeColor: Color(0xFF013871),
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  SizedBox(height: 15),
                ],
                loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                              _register();
                              _showValidationPopup(); // Call the function to show the validation popup
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
