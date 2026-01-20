class UserModel {
  final String uid;
  final String fullName;
  final String phone;
  final String email;
  final bool isEmailVerified;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.isEmailVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'createdAt': DateTime.now(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      phone: map['phone'],
      email: map['email'],
      isEmailVerified: map['isEmailVerified'],
    );
  }
}
