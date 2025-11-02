import 'package:flutter/material.dart';
import '../services/bolsa_service.dart';

class BolsaPage extends StatefulWidget {
  const BolsaPage({super.key});

  @override
  State<BolsaPage> createState() => _BolsaPageState();
}

class _BolsaPageState extends State<BolsaPage> {
  Map<String, dynamic>? acao;
  String? erro;
  final BolsaService _service = BolsaService();

  @override
  void initState() {
    super.initState();
    _carregarAcao();
  }

  Future<void> _carregarAcao() async {
    try {
      final resultado = await _service.buscarAcao('PETR4');
      setState(() {
        acao = resultado;
        erro = null;
      });
    } catch (e) {
      setState(() {
        acao = null;
        erro = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (erro != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Bolsa de Valores')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                erro!,
                style: const TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _carregarAcao,
                child: const Text('Recarregar'),
              ),
            ],
          ),
        ),
      );
    }

    if (acao == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Tela de dados quando tudo está ok
    final dividends = List.from(acao?['dividends'] ?? []);

    return Scaffold(
      appBar: AppBar(title: const Text('Bolsa de Valores')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              acao?['longName'] ?? 'Nome indisponível',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Ticker: ${acao?['symbol'] ?? '-'}'),
            Text('Preço atual: R\$ ${acao?['regularMarketPrice'] ?? '-'}'),
            Text('Variação: ${acao?['regularMarketChangePercent'] ?? '-'}%'),
            const SizedBox(height: 16),
            const Text('Últimos dividendos:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...dividends.map((d) {
              final date = d['date'] ?? '-';
              final value = d['value'] ?? '-';
              final label = d['label'] ?? '-';
              return Text('$date: R\$ $value ($label)');
            }).toList(),
          ],
        ),
      ),
    );
  }
}
