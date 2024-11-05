import 'package:flutter_test/flutter_test.dart';
import 'package:academia_app/models/aluno.dart';

void main() {
  
  test('Verificar se aluno está regular com status de pagamento em dia', () {
    final aluno = Aluno(nome: 'João', statusPagamento: 'Em Dia');
    expect(aluno.estaRegular(), true);
  });

  
  test('Calcular taxa de frequência mensal com 20 presenças de 30 dias', () {
    final aluno = Aluno(nome: 'Maria', totalDiasNoMes: 30, diasDePresenca: 20);
    expect(aluno.calcularFrequenciaMensal(), 0.66);
  });
}
