import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:academia_app/widgets/aluno_list_widget.dart';
import 'package:academia_app/models/aluno.dart';

void main() {
  testWidgets('Exibir lista de alunos', (WidgetTester tester) async {
    final alunos = [
      Aluno(nome: 'Carlos', statusPagamento: 'Em Dia'),
      Aluno(nome: 'Julia', statusPagamento: 'Em Atraso'),
    ];

    await tester.pumpWidget(MaterialApp(
      home: AlunoListWidget(alunos: alunos),
    ));

    expect(find.text('Carlos'), findsOneWidget);
    expect(find.text('Julia'), findsOneWidget);
    expect(find.text('Em Dia'), findsOneWidget);
    expect(find.text('Em Atraso'), findsOneWidget);
  });
}
