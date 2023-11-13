// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<AlunoModel> alunoFromJson(String str) =>
    List<AlunoModel>.from(json.decode(str).map((x) => AlunoModel.fromJson(x)));

String alunoToJson(List<AlunoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlunoModel {
  int codigo;
  String nome;
  bool checkStatus;

  AlunoModel({this.codigo = 0, required this.nome, this.checkStatus = false});

  factory AlunoModel.fromJson(Map<String, dynamic> json) => AlunoModel(
        codigo: json["codigo"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nome": nome,
      };
}
