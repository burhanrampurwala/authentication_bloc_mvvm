class LoginResponseModel {
  bool? status;
  String? message;

  LoginResponseModel({
    this.status,
    this.message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
