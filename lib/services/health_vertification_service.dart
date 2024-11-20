import 'package:http/http.dart' as http;
import 'dart:convert';

class HealthVerificationService {
  static const String _baseUrl =
      'https://api.example.com'; // Replace with actual API URL

  Future<bool> submitHealthCertification(
      String userId, Map<String, dynamic> healthData) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/health-certification'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'userId': userId,
          'healthData': healthData,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['verified'] == true;
      } else {
        throw Exception('Failed to submit health certification');
      }
    } catch (e) {
      print('Error submitting health certification: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>> getHealthCertificationStatus(
      String userId) async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl/health-certification-status/$userId'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to get health certification status');
      }
    } catch (e) {
      print('Error getting health certification status: $e');
      return {'error': 'Failed to retrieve status'};
    }
  }
}
