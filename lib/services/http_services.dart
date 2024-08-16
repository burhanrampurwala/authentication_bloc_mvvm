import 'dart:convert';
import 'package:http/http.dart' as http;

class DataService {
  final String baseUrl;

  DataService(this.baseUrl);

  Future<Map<String, dynamic>> _makeRequest(
      String method,
      String endpoint, {
        Map<String, String>? headers,
        Object? body,
      }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    http.Response response;

    try {
      switch (method) {
        case 'POST':
          response = await http.post(
            url,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case 'PUT':
          response = await http.put(
            url,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case 'DELETE':
          response = await http.delete(
            url,
            headers: headers,
          );
          break;
        case 'GET':
        default:
          response = await http.get(url, headers: headers);
          break;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (error) {
      throw Exception('Error occurred: $error');
    }
  }

  Future<Map<String, dynamic>> get(String endpoint, {Map<String, String>? headers}) {
    return _makeRequest('GET', endpoint, headers: headers);
  }

  Future<Map<String, dynamic>> post(
      String endpoint, {
        Map<String, String>? headers,
        Object? body,
      }) {
    return _makeRequest('POST', endpoint, headers: headers, body: body);
  }

  Future<Map<String, dynamic>> put(
      String endpoint, {
        Map<String, String>? headers,
        Object? body,
      }) {
    return _makeRequest('PUT', endpoint, headers: headers, body: body);
  }

  Future<Map<String, dynamic>> delete(
      String endpoint, {
        Map<String, String>? headers,
      }) {
    return _makeRequest('DELETE', endpoint, headers: headers);
  }
}
