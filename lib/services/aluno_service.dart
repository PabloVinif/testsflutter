import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:controle_academia/models/aluno.dart';

class AlunoService {
  final http.Client client;

  AlunoService({required this.client});

 
  Future<List<Aluno>> fetchAlunos() async {
    final response = await client.get(Uri.parse('https://api.exemplo.com/alunos'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Aluno.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar alunos');
    }
  }

  Future<List<Aluno>> filtrarAlunosRegulares() async {
    final alunos = await fetchAlunos();
    return alunos.where((aluno) => aluno.estaRegular()).toList();
  }
}
