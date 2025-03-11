import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String firsName;
    String lastName;
    String bithdate;
    String email;
    String password;
    List<String> addresses;

    User({
        required this.firsName,
        required this.lastName,
        required this.bithdate,
        required this.email,
        required this.password,
        required this.addresses,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        firsName: json["firs_name"],
        lastName: json["last_name"],
        bithdate: json["bithdate"],
        email: json["email"],
        password: json["password"],
        addresses: List<String>.from(json["addresses"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "firs_name": firsName,
        "last_name": lastName,
        "bithdate": bithdate,
        "email": email,
        "password": password,
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
    };
}