import 'package:flutter/material.dart';
import '../services/bolsa_service.dart';


class BolsaPage extends StatefulWidget {
  const BolsaPage({super.key});

  @override
  State<BolsaPage> createState() => _BolsaPageState();
}

class _BolsaPageState extends State<BolsaPage> {
  final BolsaService _service = BolsaService();

  // Lista de tickers que você quer exibir
  final List<String> tickers = ['PETR4', 'VALE3', 'ITUB4', 'MGLU3'];

  // Mapas para armazenar dados e erros dinamicamente
  final Map<String, Map<String, dynamic>?> dadosAcoes = {};
  final Map<String, String?> errosAcoes = {};

  @override
  void initState() {
    super.initState();
    for (var ticker in tickers) {
      _carregarAcao(ticker);
    }
  }

  Future<void> _carregarAcao(String ticker) async {
    setState(() {
      dadosAcoes[ticker] = null;
      errosAcoes[ticker] = null;
    });

    try {
      final resultado = await _service.buscarAcao(ticker);
      setState(() {
        dadosAcoes[ticker] = resultado;
        errosAcoes[ticker] = null;
      });
    } catch (e) {
      setState(() {
        dadosAcoes[ticker] = null;
        errosAcoes[ticker] = 'Erro ao carregar $ticker: $e';
      });
    }
  }

  Widget _buildAcaoCard(String ticker) {
    final acao = dadosAcoes[ticker];
    final erro = errosAcoes[ticker];

    if (erro != null) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.red[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                erro,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () => _carregarAcao(ticker),
                  child: const Text('Recarregar')),
            ],
          ),
        ),
      );
    }

    if (acao == null) {
      return const Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    final dividends = List.from(acao['dividends'] ?? []);

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 180, // altura fixa do card
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                acao['longName'] ?? ticker,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text('Ticker: ${acao['symbol'] ?? '-'}'),
              Text('Preço atual: R\$ ${acao['regularMarketPrice'] ?? '-'}'),
              Text('Variação: ${acao['regularMarketChangePercent'] ?? '-'}%'),
              const SizedBox(height: 8),
              const Text('Últimos dividendos:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(), // rolagem interna
                  children: List.from(acao['dividends'] ?? []).map((d) {
                    final date = d['date'] ?? '-';
                    final value = d['value'] ?? '-';
                    final label = d['label'] ?? '-';
                    return Text('$date: R\$ $value ($label)',
                        overflow: TextOverflow.ellipsis);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: tickers.map((ticker) => _buildAcaoCard(ticker)).toList(),
        ),
      ),
    );
  }
}
