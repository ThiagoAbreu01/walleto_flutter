// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

class AssinaturaDigital {
  final int? id;
  final int idProjeto;
  final int? idFichaValidacao;
  final int idTecnico;
  final Uint8List assinaturaTecnico;
  final String nomeResponsavelObra;
  final Uint8List assinaturaResponsavelObra;
  final DateTime? dataAssinatura;
  AssinaturaDigital({
    required this.id,
    required this.idProjeto,
    required this.idFichaValidacao,
    required this.idTecnico,
    required this.assinaturaTecnico,
    required this.nomeResponsavelObra,
    required this.assinaturaResponsavelObra,
    required this.dataAssinatura,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_projeto': idProjeto,
      'id_ficha_validacao': idFichaValidacao,
      'id_tecnico': idTecnico,
      'assinatura_tecnico': base64Encode(assinaturaTecnico),
      'nome_responsavel_obra': nomeResponsavelObra,
      'assinatura_responsavel_obra': base64Encode(assinaturaResponsavelObra),
      'data_assinatura': dataAssinatura?.toUtc().toIso8601String(),
    };
  }

  factory AssinaturaDigital.fromMap(Map<String, dynamic> map) {
    return AssinaturaDigital(
      id: map['id'] as int,
      idProjeto: map['id_projeto'] as int,
      idFichaValidacao: map['id_ficha_validacao'] as int,
      idTecnico: map['id_tecnico'] as int,
      assinaturaTecnico: base64Decode(
        map['assinatura_tecnico'] as String,
      ),
      nomeResponsavelObra: map['nome_responsavel_obra'] as String,
      assinaturaResponsavelObra: base64Decode(
        map['assinatura_responsavel_obra'] as String,
      ),
      dataAssinatura: DateTime.parse(map['data_assinatura']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AssinaturaDigital.fromJson(String source) =>
      AssinaturaDigital.fromMap(json.decode(source) as Map<String, dynamic>);
}
