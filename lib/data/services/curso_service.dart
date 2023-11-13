import 'dart:convert';
import 'package:front_vr/models/curso_model.dart';
import 'package:http/http.dart' as http;

Future<void> createCurso(CursoModel curso) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:3333/cursos'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(curso),
  );

  if (response.statusCode != 201) {
    throw Exception('Failed to create data');
  }
}

Future<List<CursoModel>> getCursos() async {
  const url = 'http://10.0.2.2:3333/cursos';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    List<CursoModel> mstdebitur = [];

    body.forEach((element) {
      mstdebitur.add(CursoModel.fromJson(element));
    });
    return mstdebitur;
  } else {
    throw Exception("Erro ao recuperar os dados de Curso!");
  }
}

Future<List<dynamic>> getMatriculas() async {
  const url = 'http://10.0.2.2:3333/matriculas';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);

    return body;
  } else {
    throw Exception("Erro ao recuperar os dados de Matricula!");
  }
}

Future<void> deletCurso(int id) async {
  String url = 'http://10.0.2.2:3333/cursos/$id';
  final response = await http.delete(Uri.parse(url));

  if (response.statusCode == 204 || response.statusCode == 200) {
    print('Curso excluido com sucesso!');
  } else {
    throw Exception("Erro ao remover curso!");
  }
}

Future<void> updateData(CursoModel curso) async {
  final response = await http.put(
    Uri.parse('http://10.0.2.2:3333/cursos/${curso.codigo}'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(curso),
  );

  if (response.statusCode != 204) {
    throw Exception('Failed to update data');
  }
}
