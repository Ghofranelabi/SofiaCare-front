import 'dart:convert';
import 'package:sofiacare/constant.dart'
    show loginURL, registerURL, sendEmailUrl, serverError, somethingWentWrong, unauthorized, updateUrl, userURL;
import 'package:sofiacare/models/api_response.dart';
import 'package:sofiacare/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//login
//login
Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();

  final response = await http.post(Uri.parse(loginURL),
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'password': password});
  if (response.statusCode == 200) {
    print("success-> " + response.statusCode.toString());
    print(response.body);
    apiResponse.data = User.formJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print("failure -> " + response.statusCode.toString());
    final errors = jsonDecode(response.body)['errors'];
    apiResponse.error = errors[errors.keys.elementAt(0)][0];
  } else {
    print("else -> " + response.statusCode.toString());
    apiResponse.error = somethingWentWrong;
  }
  print("status code -> " + response.statusCode.toString());
  return apiResponse;
}

//Register

Future<ApiResponse> register(
    String name, String email, String password, String role) async {
  ApiResponse apiResponse = ApiResponse();

  final response = await http.post(Uri.parse(registerURL), headers: {
    'Accept': 'application/json'
  }, body: {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmtion': password,
    'role': role,
  });

  if (response.statusCode == 201) {
    print("success-> " + response.statusCode.toString());
    print(response.body);
    apiResponse.data = User.formJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print("failure -> " + response.statusCode.toString());
    final errors = jsonDecode(response.body)['errors'];
    apiResponse.error = errors[errors.keys.elementAt(0)][0];
  } else {
    print("else -> " + response.statusCode.toString());
    apiResponse.error = somethingWentWrong;
  }
  print("status code -> " + response.statusCode.toString());
  return apiResponse;
}

//user details

Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  String token = await getToken();

  final response = await http.get(Uri.parse(userURL), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  });
  if (response.statusCode == 200) {
    print("success-> " + response.statusCode.toString());
    print(response.body);
    apiResponse.data = User.formJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print("failure -> " + response.statusCode.toString());
    final errors = jsonDecode(response.body)['errors'];
    apiResponse.error = errors[errors.keys.elementAt(0)][0];
  } else {
    print("else -> " + response.statusCode.toString());
    apiResponse.error = somethingWentWrong;
  }
  print("status code -> " + response.statusCode.toString());
  return apiResponse;
}

//Get Token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

//get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

//logout
//get user id
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

/*Future<ApiResponse> logout() async {
  ApiResponse apiResponse = ApiResponse();

  final response = await http.post(
    Uri.parse(logoutURL),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer yourAccessToken'
    },
  );
  if (response.statusCode == 200) {
    print("success-> " + response.statusCode.toString());
    print(response.body);
    apiResponse.data = User.formJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print("failure -> " + response.statusCode.toString());
    final errors = jsonDecode(response.body)['errors'];
    apiResponse.error = errors[errors.keys.elementAt(0)][0];
  } else {
    print("else -> " + response.statusCode.toString());
    apiResponse.error = somethingWentWrong;
  }
  print("status code -> " + response.statusCode.toString());
  return apiResponse;
}
*/
//email Validate
// ignore: non_constant_identifier_names
Future<ApiResponse> SendEmail(String email) async {
  ApiResponse apiResponse = ApiResponse();

  final response = await http.post(Uri.parse(sendEmailUrl),
      headers: {'Accept': 'application/json'}, body: {'email': email});
  if (response.statusCode == 200) {
    print("success-> " + response.statusCode.toString());
    print(response.body);
    apiResponse.data = User.formJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print("failure -> " + response.statusCode.toString());
    final errors = jsonDecode(response.body)['errors'];
    apiResponse.error = errors[errors.keys.elementAt(0)][0];
  } else {
    print("else -> " + response.statusCode.toString());
    apiResponse.error = somethingWentWrong;
  }
  print("status code -> " + response.statusCode.toString());
  return apiResponse;
}

//ConfirmCode
// ignore: non_constant_identifier_names
Future<ApiResponse> ConfirmCode(String code) async {
  ApiResponse apiResponse = ApiResponse();

  final response = await http.post(Uri.parse(updateUrl), headers: {
    'Accept': 'application/json'
  }, body: {
    'verification_code': code,
  });
  if (response.statusCode == 200) {
    print("success-> " + response.statusCode.toString());
    print(response.body);
    apiResponse.data = User.formJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print("failure -> " + response.statusCode.toString());
    final errors = jsonDecode(response.body)['errors'];
    apiResponse.error = errors[errors.keys.elementAt(0)][0];
  } else {
    print("else -> " + response.statusCode.toString());
    apiResponse.error = somethingWentWrong;
  }
  print("status code -> " + response.statusCode.toString());
  return apiResponse;
}

//UpdateMot de passe

// ignore: non_constant_identifier_names
Future<ApiResponse> ModifierMotDePasse(String password) async {
  ApiResponse apiResponse = ApiResponse();

  final response = await http.post(Uri.parse(updateUrl), headers: {
    'Accept': 'application/json'
  }, body: {
    'password': password,
  });
  if (response.statusCode == 200) {
    print("success-> " + response.statusCode.toString());
    print(response.body);
    apiResponse.data = User.formJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print("failure -> " + response.statusCode.toString());
    final errors = jsonDecode(response.body)['errors'];
    apiResponse.error = errors[errors.keys.elementAt(0)][0];
  } else {
    print("else -> " + response.statusCode.toString());
    apiResponse.error = somethingWentWrong;
  }
  print("status code -> " + response.statusCode.toString());
  return apiResponse;
}