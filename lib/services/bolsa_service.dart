import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:another_flushbar/flushbar.dart';

class BolsaService {
  final String baseUrl = 'https://brapi.dev/api/quote/';

  Future<Map<String, dynamic>> buscarAcao(String ticker) async {
    try {
      final url = Uri.parse('$baseUrl$ticker');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['results'] != null && (data['results'] as List).isNotEmpty) {
          return data['results'][0];
        } else {
          throw Exception('Nenhum resultado encontrado');
        }
      } else {
        throw Exception('Erro ao carregar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar ação: $e');
      throw Exception('Falha ao buscar ação. Recarregue a página.');
    }
  }
}
