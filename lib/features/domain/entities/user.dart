import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String firstName;
    String lastName;
    String birthdate;
    String email;
    String password;
    List<String> addresses;

    User({
        required this.firstName,
        required this.lastName,
        required this.birthdate,
        required this.email,
        required this.password,
        required this.addresses,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthdate: json["birthdate"],
        email: json["email"],
        password: json["password"],
        addresses: List<String>.from(json["addresses"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "birthdate": birthdate,
        "email": email,
        "password": password,
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
    };
}
