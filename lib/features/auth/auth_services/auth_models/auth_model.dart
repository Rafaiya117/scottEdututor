class LoginResponseModel {
  final String access;
  final String refresh;
  final String userRole;
  final String email;
  final int userId;

  LoginResponseModel({
    required this.access,
    required this.refresh,
    required this.userRole,
    required this.email,
    required this.userId,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      access: json['access'] ?? '',
      refresh: json['refresh'] ?? '',
      userRole: json['user_role'] ?? '',
      email: json['email'] ?? '',
      userId: json['user_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "access": access,
      "refresh": refresh,
      "user_role": userRole,
      "email": email,
      "user_id": userId,
    };
  }
}