import 'package:flutter/widgets.dart';
import 'package:front_vr/data/services/aluno_service.dart';
import 'package:front_vr/models/aluno_model.dart';

class AlunosProvider with ChangeNotifier {
  List<AlunoModel> alunosList = [];
  int codigoCursoTemp = 0;
  bool vinculoAlunoCurso = false;

  void randlerAlunos() async {
    final response = await getAlunos();
    alunosList.clear();
    alunosList = response;
    notifyListeners();
  }

  int get count {
    return alunosList.length;
  }

  void remove(AlunoModel user) async {
    if (!vinculoAlunoCurso) {
      await deletAluno(user.codigo.toInt());
      alunosList.removeWhere(
        (element) => element.codigo == user.codigo,
      );
    }

    notifyListeners();
  }

  void put(AlunoModel user) async {
    bool atributoExiste =
        alunosList.any((objeto) => objeto.codigo == user.codigo);

    if (atributoExiste) {
      await updateDataAluno(user);

      for (var objeto in alunosList) {
        if (objeto.codigo == user.codigo) {
          objeto.nome = user.nome;
        }
      }
    } else {
      await createAluno(user);
    }

    notifyListeners();
  }

  void putMatricula(int codigoAluno, int codigoCurso) async {
    await createMatricula(codigoAluno, codigoCurso);

    notifyListeners();
  }

  void deleteMatriculaAluno(int codigoAluno) async {
    await deletMatriculaAluno(codigoAluno, codigoCursoTemp);

    notifyListeners();
  }

  void alterarStatusCheckBox(int codigoAluno) {
    for (var element in alunosList) {
      if (element.codigo == codigoAluno) {
        if (element.checkStatus == true) {
          deleteMatriculaAluno(codigoAluno);
          element.checkStatus = false;
        } else {
          putMatricula(codigoAluno, codigoCursoTemp);
          element.checkStatus = true;
        }
      }
    }

    notifyListeners();
  }

  void randlerAlunosMatriculados(int codigoCursoSelec) async {
    randlerAlunos();
    final response = await getAlunosMatriculados();

    for (var element in response) {
      int codigoCurso = element['codigo_curso'];
      int codigoAluno = element['codigo_aluno'];
      for (var objeto in alunosList) {
        if (objeto.codigo == codigoAluno && codigoCursoSelec == codigoCurso) {
          objeto.checkStatus = true;
        }
      }
    }

    notifyListeners();
  }

  Future verificaVinculoAlunoCurso(int alunoId) async {
    final response = await getAlunosMatriculados();
    vinculoAlunoCurso = false;

    if (vinculoAlunoCurso == false) {
      for (var element in response) {
        int codigoAluno = element['codigo_aluno'];
        if (codigoAluno == alunoId) {
          vinculoAlunoCurso = true;
          break;
        }
      }
    }

    notifyListeners();
  }
}
