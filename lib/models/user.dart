class UserModel {
  String name;
  String surname;
  String email;
  String phoneNumber;
  String? roleId;
  String? password;

  UserModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
    this.roleId,
    this.password,
  });

  // Méthode pour convertir un objet JSON en instance de UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      roleId: json['roleId'],
      password: json['password'],
    );
  }

  // Méthode pour convertir une instance de UserModel en objet JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'phone_number': phoneNumber,
      'roleId': roleId,
      'password': password,
    };
  }
}
