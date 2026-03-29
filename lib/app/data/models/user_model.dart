class UserModel {
  final String uid;
  final String fullName;
  final String username; //  جديد
  final String phone;
  final String email;
  final bool isEmailVerified;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.username,
    required this.phone,
    required this.email,
    required this.isEmailVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'username': username.toLowerCase(), //  نخزنها lowercase
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
      username: map['username'],
      phone: map['phone'],
      email: map['email'],
      isEmailVerified: map['isEmailVerified'],
    );
  }
}
