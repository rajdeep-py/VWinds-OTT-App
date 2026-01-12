class User {
  final String? id;
  final String? fullName;
  final String? phone;
  final String? email;
  final String? location;
  final List<String>? preferences;
  final String? token;

  User({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.location,
    this.preferences,
    this.token,
  });

  User copyWith({
    String? id,
    String? fullName,
    String? phone,
    String? email,
    String? location,
    List<String>? preferences,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      location: location ?? this.location,
      preferences: preferences ?? this.preferences,
      token: token ?? this.token,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String?,
    fullName: json['fullName'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    location: json['location'] as String?,
    preferences: (json['preferences'] as List<dynamic>?)?.cast<String>(),
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'phone': phone,
    'email': email,
    'location': location,
    'preferences': preferences,
    'token': token,
  };
}
