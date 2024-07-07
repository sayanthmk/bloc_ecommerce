import 'package:http/http.dart' as http;

class AuthRepository {
  Future<http.Response> authenticate({
    required String username,
    required String password,
  }) async {
    Uri url = Uri.parse('https://fakestoreapi.com/auth/login');

    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    return response;
  }
}
