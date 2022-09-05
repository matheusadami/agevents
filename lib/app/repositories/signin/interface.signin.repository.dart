abstract class ISignInRepository {
  Future<bool> signIn(String email, String password);
}
