import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String token;
  const LoginResponseModel({
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };

  @override
  String toString() => 'LoginResponseModel(token: $token)';

  @override
  List<Object> get props => [token];
}
