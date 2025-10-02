// ignore_for_file: constant_identifier_names

enum Permissao { GESTOR, ORCAMENTO, ENGENHARIA, TECNICO }

Permissao? permissaofromString(String data) {
  switch (data) {
    case 'GESTOR':
      return Permissao.GESTOR;
    case 'ORCAMENTO':
      return Permissao.ORCAMENTO;
    case 'ENGENHARIA':
      return Permissao.ENGENHARIA;
    case 'TECNICO':
      return Permissao.TECNICO;
    default:
      return null;
  }
}

String? permissaoToString(Permissao? data) {
  switch (data) {
    case Permissao.GESTOR:
      return 'GESTOR';
    case Permissao.ORCAMENTO:
      return 'ORCAMENTO';
    case Permissao.ENGENHARIA:
      return 'ENGENHARIA';
    case Permissao.TECNICO:
      return 'TECNICO';
    default:
      return null;
  }
}

String? permissaoToStringView(Permissao? data) {
  switch (data) {
    case Permissao.GESTOR:
      return 'Gestor';
    case Permissao.ORCAMENTO:
      return 'Orçamento';
    case Permissao.ENGENHARIA:
      return 'Engenharia';
    case Permissao.TECNICO:
      return 'Técnico';
    default:
      return null;
  }
}
