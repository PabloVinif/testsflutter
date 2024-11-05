import 'package:flutter/material.dart';
import 'package:controle_academia/models/aluno.dart';
import 'package:controle_academia/widgets/aluno_list_widget.dart';

void main() {
  runApp(AcademiaApp());
}

class AcademiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Alunos na Academia',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Aluno> alunos = [
    Aluno(nome: 'Carlos', statusPagamento: 'Em Dia'),
    Aluno(nome: 'Julia', statusPagamento: 'Em Atraso'),
    Aluno(nome: 'Ana', statusPagamento: 'Em Dia'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos da Academia'),
      ),
      body: AlunoListWidget(alunos: alunos),
    );
  }
}
