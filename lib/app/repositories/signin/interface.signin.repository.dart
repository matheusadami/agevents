abstract class ISignInRepository {
  Future<Map<String, dynamic>> signIn(Map<String, dynamic> variables);
  Future<Map<String, dynamic>> getUserById(Map<String, dynamic> variables);
}
