import 'package:flutter/material.dart';

//STINGS--------------
//const baseURL = 'http://10.0.2.2:8000/api';
const baseURL = 'http://192.168.200.124:8000/api';
const loginURL = baseURL + '/auth/login';
const registerURL = baseURL + '/auth/register';
const logoutURL = baseURL + '/auth/logout';
const sendEmailUrl = baseURL + '/auth/verify';
const valideCodeUrl = baseURL + '/auth/update_pass';
const updateUrl = baseURL + '/update_pass';
const userURL = baseURL + '/users';
const postsURL = baseURL + '/posts';
const commentsURL = baseURL + '/comments';

//ERRORS-----------
const serverError = 'Server error';
const unauthorized = 'unauthorized';
const somethingWentWrong = 'Something Went Wrong, try again';

//---Input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.green)));
}

//---Button

TextButton kTextButton(
    String label, Function onPressed, Null Function() param2) {
  return TextButton(
    onPressed: () => onPressed(),
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
      backgroundColor:
          MaterialStateColor.resolveWith((states) => Color(0xFF013871)),
      padding: MaterialStateProperty.resolveWith(
        (states) => EdgeInsets.symmetric(vertical: 10),
      ),
    ),
  );
}

//Login Inscription
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        child: Text(
          label,
          style:
              TextStyle(color: Color(0xFF013871), fontWeight: FontWeight.bold),
        ),
        onTap: () => onTap(),
      ),
    ],
  );
}
