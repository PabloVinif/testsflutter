import 'package:flutter/material.dart';
import 'package:controle_academia/models/aluno.dart';

class AlunoListWidget extends StatelessWidget {
  final List<Aluno> alunos;

  AlunoListWidget({required this.alunos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alunos.length,
      itemBuilder: (context, index) {
        final aluno = alunos[index];
        return ListTile(
          title: Text(aluno.nome),
          subtitle: Text(aluno.statusPagamento),
          trailing: Icon(
            aluno.estaRegular() ? Icons.check_circle : Icons.error,
            color: aluno.estaRegular() ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }
}
