import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:certicode_mobile/features/home/models/seminar_model.dart';
import 'package:network_info_plus/network_info_plus.dart';

class SeminarService {
  Future<String> _getBaseUrl() async {
    final info = NetworkInfo();
    String? ip = await info.getWifiIP();

    if (ip != null && ip.startsWith('192.168')) {
      return 'http://$ip:8000'; // Doesn't work
    } else {
      return 'http://10.0.2.2:8000';
    }
  }

  Future<List<Seminar>> fetchSeminars() async {
    try {
      final baseUrl = await _getBaseUrl();
      final response = await http.get(Uri.parse('$baseUrl/api/seminars'))
          .timeout(Duration(seconds: 5)); // adjust when there's image

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => Seminar.fromJson(item, baseUrl)).toList();
      } else {
        throw Exception('Failed to load seminars');
      }
    } on Exception catch (e) {
      // TODO
      throw Exception('Failed to load seminar or API is not available');
    }
  }

  Future<List<Seminar>> searchSeminars(String query) async {
    final baseUrl = await _getBaseUrl();
    final response = await http.get(Uri.parse('$baseUrl/api/seminars?search=$query'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Seminar.fromJson(item, baseUrl)).toList();
    } else {
      throw Exception('Failed to search seminars');
    }
  }

}

