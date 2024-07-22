class Register {
  String? name;
  String? surname;
  String email;
  String number = "";
  String password;
  Register({
    this.name,
    this.surname,
    required this.email,
    required this.number,
    required this.password,
  });

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      number: json['number'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'number': number,
      'password': password,
    };
  }
}
