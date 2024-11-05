import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:controle_academia/models/aluno.dart';

class AlunoService {
  final http.Client client;

  // Construtor, permite injetar um cliente http para facilitar testes
  AlunoService({required this.client});

  // Método para buscar a lista de alunos a partir de uma API
  Future<List<Aluno>> fetchAlunos() async {
    final response = await client.get(Uri.parse('https://api.exemplo.com/alunos'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Aluno.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar alunos');
    }
  }

  // Método para filtrar alunos com pagamento em dia
  Future<List<Aluno>> filtrarAlunosRegulares() async {
    final alunos = await fetchAlunos();
    return alunos.where((aluno) => aluno.estaRegular()).toList();
  }
}
