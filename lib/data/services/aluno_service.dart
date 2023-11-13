import 'dart:convert';
import 'package:front_vr/models/aluno_model.dart';
import 'package:http/http.dart' as http;

Future<void> createAluno(AlunoModel aluno) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:3333/alunos'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(aluno),
  );

  if (response.statusCode != 201) {
    throw Exception('Erro ao cadastrar o aluno!');
  }
}

Future<void> createMatricula(int codAluno, int codCurso) async {
  Map<String, dynamic> corpoDaRequisicao = {
    'codigo_curso': codCurso,
    'codigo_aluno': codAluno,
  };

  print(corpoDaRequisicao);

  final response = await http.post(
    Uri.parse('http://10.0.2.2:3333/matriculas'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(corpoDaRequisicao),
  );

  if (response.statusCode != 201) {
    throw Exception('Erro ao matricular o aluno!');
  }
}

//Remove o aluno de curso
Future<void> deletMatriculaAluno(int idAluno, idCurso) async {
  String url = 'http://10.0.2.2:3333/matriculas/$idAluno/$idCurso';
  final response = await http.delete(Uri.parse(url));

  if (response.statusCode == 204 || response.statusCode == 200) {
    print('Aluno excluido do curso com sucesso!');
  } else {
    throw Exception("Erro ao remover Aluno!");
  }
}

//Retorna aluno matriculado por curso
Future<List<dynamic>> getAlunosMatriculados() async {
  const url = 'http://10.0.2.2:3333/matriculados';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);

    return body;
  } else {
    throw Exception("Erro ao recuperar os alunos matriculados!");
  }
}

//Retorna a quantidade matriculado por curso
Future<List<dynamic>> getAlunosMatriculadosQuantidade() async {
  const url = 'http://10.0.2.2:3333/matriculas';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);

    return body;
  } else {
    throw Exception("Erro ao recuperar a quantidade de matriculas!");
  }
}

Future<List<AlunoModel>> getAlunos() async {
  const url = 'http://10.0.2.2:3333/alunos';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    List<AlunoModel> alunos = [];

    body.forEach((element) {
      alunos.add(AlunoModel.fromJson(element));
    });
    return alunos;
  } else {
    throw Exception("Erro ao recuperar os dados de Aluno!");
  }
}

Future<void> deletAluno(int id) async {
  String url = 'http://10.0.2.2:3333/alunos/$id';
  final response = await http.delete(Uri.parse(url));

  if (response.statusCode == 204 || response.statusCode == 200) {
    print('Aluno excluido com sucesso!');
  } else {
    throw Exception("Erro ao remover Aluno!");
  }
}

Future<void> updateDataAluno(AlunoModel aluno) async {
  final response = await http.put(
    Uri.parse('http://10.0.2.2:3333/alunos/${aluno.codigo}'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(aluno),
  );

  if (response.statusCode != 204) {
    throw Exception('Erro ao atualizar aluno!');
  }
}
