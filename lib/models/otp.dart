class Otp {
  String? code;
  String? email;
  String? typeOfVerification;
  Otp({this.code, this.email, this.typeOfVerification});

  factory Otp.fromJson(Map<String, dynamic> json) {
    return Otp(
      code: json['code'],
      email: json['toEmail'],
      typeOfVerification: json['typeOfVerification'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'typeOfVerification': typeOfVerification,
      'code': code,
    };
  }

  Map<String, dynamic> sendOtpJson() {
    return {
      'toEmail': email,
    };
  }
}
