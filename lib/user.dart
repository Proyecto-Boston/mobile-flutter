import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? name;
    String? surname;
    String email;
    String password;
    int? id;

    User({
        this.name,
        this.surname,
        required this.email,
        required this.password,
        this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] as String?,
        surname: json["surname"] as String?,
        email: json["email"] as String,
        password: json["password"] as String,
        id: json["id"] as int,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        
    };
}