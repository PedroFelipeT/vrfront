import 'dart:convert';

List<CursoModel> cursoFromJson(String str) =>
    List<CursoModel>.from(json.decode(str).map((x) => CursoModel.fromJson(x)));

String cursoToJson(List<CursoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CursoModel {
  int codigo;
  String descricao;
  String ementa;
  int alunosCadastrados;

  CursoModel({
    this.codigo = 0,
    required this.descricao,
    required this.ementa,
    this.alunosCadastrados = 0,
  });

  factory CursoModel.fromJson(Map<String, dynamic> json) => CursoModel(
        codigo: json["codigo"],
        descricao: json["descricao"],
        ementa: json["ementa"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "descricao": descricao,
        "ementa": ementa,
      };
}
