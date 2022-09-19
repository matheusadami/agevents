import 'dart:convert';

class UserModel {
  String? uuid;
  String name;
  String phone;
  String email;
  bool isActive;

  UserModel({
    this.uuid,
    required this.name,
    required this.phone,
    required this.email,
    this.isActive = true,
  });

  UserModel copyWith({
    String? uuid,
    String? name,
    String? phone,
    String? email,
    bool? isActive,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'phone': phone,
      'email': email,
      'isActive': isActive,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uuid: map['_id'],
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      isActive: map['isActive'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uuid: $uuid, name: $name, phone: $phone, email: $email, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uuid == uuid &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        isActive.hashCode;
  }
}
