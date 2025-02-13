class UserData {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? role;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  String? about;
  String? studentCampus;
  String? studentNumber;
  String? agentNumber;
  String? token;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.role,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.about,
    this.studentCampus,
    this.studentNumber,
    this.agentNumber,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      username: json['username'],
      role: json['role'],
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      about: json['about'],
      studentCampus: json['studentCampus'],
      studentNumber: json['studentNumber'],
      agentNumber: json['agentNumber'],
      token: json['accessToken'],
    );
  }
}

class UserResponse {
  UserData? data;
  int? message;

  UserResponse({
    this.data,
    this.message,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      message: json['message'],
    );
  }
}
