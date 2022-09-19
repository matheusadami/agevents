abstract class SignUpEvent {}

class SubmitFormSignUpEvent extends SignUpEvent {
  String name;
  String phone;
  String email;
  String password;

  SubmitFormSignUpEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}
