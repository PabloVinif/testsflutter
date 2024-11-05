import 'package:flutter_test/flutter_test.dart';
import 'package:academia_app/models/aluno.dart';

void main() {
  // Teste Unitário 1: Verificar se aluno está regular
  test('Verificar se aluno está regular com status de pagamento em dia', () {
    final aluno = Aluno(nome: 'João', statusPagamento: 'Em Dia');
    expect(aluno.estaRegular(), true);
  });

  // Teste Unitário 2: Calcular a frequência mensal
  test('Calcular taxa de frequência mensal com 20 presenças de 30 dias', () {
    final aluno = Aluno(nome: 'Maria', totalDiasNoMes: 30, diasDePresenca: 20);
    expect(aluno.calcularFrequenciaMensal(), 0.66);
  });
}
