class User {
  int? id;
  String? name;
  String? image;
  String? email;
  String? token;

  User({this.id, this.name, this.image, this.email, this.token});

  //function to convert json data to user model
  factory User.formJson(Map<String, dynamic> json) {
    return User(
      id: json['data']['id'],
      name: json['data']['name'],
      //image: json['data']['image'],
      email: json['data']['email'],
      token: json['token'],
    );
  }
}
