import 'dart:convert';
import 'package:http/http.dart' as http;

class CriptoService {
  Future<void> getCriptoCotacao(String symbol) async {
    final url = Uri.parse('https://brapi.dev/api/v2/crypto?coin=$symbol');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
      } else {
        print('Erro ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      print('Erro ao buscar cotação: $e');
    }
  }
}
