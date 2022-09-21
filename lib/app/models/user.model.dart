import 'dart:convert';

class UserModel {
  String? id;
  String name;
  String phone;
  String email;

  UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  UserModel copyWith({
    String? uuid,
    String? name,
    String? phone,
    String? email,
    bool? isActive,
  }) {
    return UserModel(
      id: uuid ?? id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'],
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uuid: $id, name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ phone.hashCode ^ email.hashCode;
  }
}
