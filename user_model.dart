class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });

  // Factory constructor để chuyển JSON thành Object User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
      token:
          json['accessToken'] ??
          json['token'] ??
          '', // DummyJSON trả về accessToken là 'token' hoặc 'accessToken' tùy endpoint, auth/login trả về 'accessToken' (nhưng check log thực tế nó trả về accessToken, tuy nhiên trong docs cũ là token. Code dưới mình sẽ xử lý an toàn)
    );
  }

  // Getter để lấy tên đầy đủ
  String get fullName => '$firstName $lastName';
}
