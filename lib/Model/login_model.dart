class Login {
  String model;
  String refreshToken;

  //int userId;
  Login({required this.model, required this.refreshToken});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      model: json['Model']['Token'],
      refreshToken: json['Model']['RefreshToken'],
    );
  }

  bool checkIfAnyIsNull() {
    return [model].contains(null);
  }
}