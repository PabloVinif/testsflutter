import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:controle_academia/services/aluno_service.dart';
import 'package:controle_academia/models/aluno.dart';


class MockClient extends Mock implements http.Client {}

void main() {
  group('AlunoService', () {
    test('Filtrar alunos com status de pagamento em dia', () async {
      
      final client = MockClient();
      final service = AlunoService(client: client);

    
      when(client.get(Uri.parse('https://api.exemplo.com/alunos')))
          .thenAnswer((_) async => http.Response('''
            [
              {"nome": "João", "statusPagamento": "Em Dia"},
              {"nome": "Ana", "statusPagamento": "Em Atraso"},
              {"nome": "Carlos", "statusPagamento": "Em Dia"}
            ]
          ''', 200));

    
      final alunosRegulares = await service.filtrarAlunosRegulares();

      
      expect(alunosRegulares.length, 2);
      expect(alunosRegulares[0].nome, 'João');
      expect(alunosRegulares[1].nome, 'Carlos');
    });
  });
}
