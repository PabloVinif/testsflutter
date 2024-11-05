class Aluno {
  final String nome;
  final String statusPagamento;
  final int? totalDiasNoMes;
  final int? diasDePresenca;

  Aluno({
    required this.nome,
    required this.statusPagamento,
    this.totalDiasNoMes,
    this.diasDePresenca,
  });

  bool estaRegular() {
    return statusPagamento == 'Em Dia';
  }

  double calcularFrequenciaMensal() {
    if (totalDiasNoMes != null && diasDePresenca != null) {
      return diasDePresenca! / totalDiasNoMes!;
    }
    return 0.0;
  }
}
