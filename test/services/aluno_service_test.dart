import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:controle_academia/services/aluno_service.dart';
import 'package:controle_academia/models/aluno.dart';

// Mock do cliente HTTP para simular requisições
class MockClient extends Mock implements http.Client {}

void main() {
  group('AlunoService', () {
    test('Filtrar alunos com status de pagamento em dia', () async {
      // Cria o mock do cliente HTTP
      final client = MockClient();
      final service = AlunoService(client: client);

      // Simula uma resposta da API com uma lista de alunos
      when(client.get(Uri.parse('https://api.exemplo.com/alunos')))
          .thenAnswer((_) async => http.Response('''
            [
              {"nome": "João", "statusPagamento": "Em Dia"},
              {"nome": "Ana", "statusPagamento": "Em Atraso"},
              {"nome": "Carlos", "statusPagamento": "Em Dia"}
            ]
          ''', 200));

      // Chama o método de filtro
      final alunosRegulares = await service.filtrarAlunosRegulares();

      // Verifica se apenas os alunos "Em Dia" foram filtrados
      expect(alunosRegulares.length, 2);
      expect(alunosRegulares[0].nome, 'João');
      expect(alunosRegulares[1].nome, 'Carlos');
    });
  });
}
