import 'dart:convert';
import 'package:http/http.dart' as http;

class RestClient<T> {
  final String baseUrl;
  final Map<String, String> headers;

  RestClient({required this.baseUrl, required this.headers});

  Future<T> get(String endpoint) async {
    var response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: headers);

    if (response.statusCode == 200) {
      return _parseResponse(response.body);
    } else {
      throw Exception('Failed to get data');
    }
  }

  T _parseResponse(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed as T;
  }

}
