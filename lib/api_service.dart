import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "http://localhost/kejari/api/izinSuratJalan"; // Ganti dengan URL API yang sesuai

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
