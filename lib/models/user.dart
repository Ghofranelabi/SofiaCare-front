class User {
  int? id;
  String? name;
  String? image;
  String? email;
  String? token;

  User({this.id, this.name, this.image, this.email, this.token});

  // Function to convert JSON data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['data']['id'],
      name: json['data']['name'],
      image: json['data']['image'],
      email: json['data']['email'],
      token: json['token'],
    );
  }
}

class Rendvous {
  int? id;
  String? time;
  String? date;
  String? medic_id;
  String? patient_id;
  String? token;

  Rendvous({
    this.id,
    this.time,
    this.date,
    this.medic_id,
    this.patient_id,
    this.token,
  });

  // Function to convert JSON data to Rendvous model
  factory Rendvous.fromJson(Map<String, dynamic> json) {
    return Rendvous(
      id: json['data']['id'],
      time: json['data']['time'],
      date: json['data']['date'],
      medic_id: json['data']['medic_id'],
      patient_id: json['data']['patient_id'],
      token: json['token'],
    );
  }
}

class Specialite {
  String? nom;

  Specialite({
    this.nom,
  });

  factory Specialite.fromJson(Map<String, dynamic> json) {
    return Specialite(
      nom: json['data']['nom'],
    );
  }
}

class Patient {
  String? medic_id;
  String? user_id;
  String? token;

  Patient({
    this.medic_id,
    this.user_id,
    this.token,
  });

  // Function to convert JSON data to Patient model
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      medic_id: json['data']['medic_id'],
      user_id: json['data']['user_id'],
      token: json['token'],
    );
  }
}

class Medic {
  String? medic_id;
  String? user_id;
  String? token;

  Medic({
    this.medic_id,
    this.user_id,
    this.token,
  });

  // Function to convert JSON data to Medic model
  factory Medic.fromJson(Map<String, dynamic> json) {
    return Medic(
      medic_id: json['data']['medic_id'],
      user_id: json['data']['user_id'],
      token: json['token'],
    );
  }
}

class Medicament {
  String? period;
  int? dossier_id;

  Medicament({
    this.period,
    this.dossier_id,
  });

  // Function to convert JSON data to Medicament model
  factory Medicament.fromJson(Map<String, dynamic> json) {
    return Medicament(
      period: json['data']['period'],
      dossier_id: json['data']['dossier_id'],
    );
  }
}

class Question {
  String? question;
  String? medic_id;
  String? user_id;

  Question({
    this.question,
    this.medic_id,
    this.user_id,
  });
  // Function to convert JSON data to Medicament model
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['data']['question'],
      medic_id: json['data']['medic_id'],
      user_id: json['data']['user_id'],
    );
  }
}

class Response {
  String? response;
  String? question_id;
  String? medic_id;
  String? user_id;

  Response({
    this.response,
    this.question_id,
    this.medic_id,
    this.user_id,
  });
  // Function to convert JSON data to Medicament model
  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      response: json['data']['response'],
      question_id: json['data']['question_id'],
      medic_id: json['data']['medic_id'],
      user_id: json['data']['user_id'],
    );
  }
}

class Post {
  String? title;
  String? image;
  String? type;
  String? description;
  String? user_id;

  Post({
    this.title,
    this.image,
    this.type,
    this.description,
    this.user_id,
  });
  // Function to convert JSON data to Medicament model
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['data']['title'],
      image: json['data']['image'],
      type: json['data']['type'],
      description: json['data']['description'],
      user_id: json['data']['user_id'],
    );
  }
}

class Like {
  String? like;
  String? post_id;
  String? user_id;

  Like({
    this.like,
    this.post_id,
    this.user_id,
  });
// Function to convert JSON data to Medicament model
  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      like: json['data']['like'],
      post_id: json['data']['post_id'],
      user_id: json['data']['user_id'],
    );
  }
}

class Comment {
  String? comment;
  String? post_id;
  Stream? user_id;

  Comment({
    this.comment,
    this.post_id,
    this.user_id,
  });
  // Function to convert JSON data to Medicament model
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      comment: json['data']['comment'],
      post_id: json['data']['post_id'],
      user_id: json['data']['user_id'],
    );
  }
}

class Dossier {
  String? nom;
  String? prenom;
  String? date_naissance;
  String? sexe;
  String? tel;
  String? email;
  String? cnam;
  String? diagnostique;
  String? medicament;
  String? symptome;
  String? description;
  String? medic_id;

  Dossier({
    this.nom,
    this.prenom,
    this.date_naissance,
    this.sexe,
    this.tel,
    this.email,
    this.cnam,
    this.diagnostique,
    this.medicament,
    this.symptome,
    this.description,
    this.medic_id,
  });
  // Function to convert JSON data to Medicament model
  factory Dossier.fromJson(Map<String, dynamic> json) {
    return Dossier(
      nom: json['data']['nom'],
      prenom: json['data']['prenom'],
      date_naissance: json['data']['date_naissance'],
      sexe: json['data']['sexe'],
      tel: json['data']['tel'],
      email: json['data']['email'],
      cnam: json['data']['diagnostique'],
      medicament: json['data']['medicament'],
      symptome: json['data']['symptome'],
      description: json['data']['description'],
      medic_id: json['data']['medic_id'],
    );
  }
}

class Fiche {
  String? dossier_id;
  String? image;
  String? note;

  Fiche({
    this.dossier_id,
    this.image,
    this.note,
  });
  // Function to convert JSON data to Medicament model
  factory Fiche.fromJson(Map<String, dynamic> json) {
    return Fiche(
      dossier_id: json['data']['comment'],
      image: json['data']['post_id'],
      note: json['data']['user_id'],
    );
  }
}

