import 'package:flutter/widgets.dart';
import 'package:front_vr/data/services/curso_service.dart';
import 'package:front_vr/models/curso_model.dart';

class CursosProvider with ChangeNotifier {
  List<CursoModel> cursosList = [];
  List<int> codigosCursos = [];
  List<int> quantidades = [];
  bool vinculoCursoAluno = false;

  void randlerCursos() async {
    final response = await getCursos();
    cursosList.clear();
    cursosList = response;
    notifyListeners();
  }

  void randlerMatriculas() async {
    final response = await getMatriculas();

    if (response.isEmpty) {
      for (var element in cursosList) {
        element.alunosCadastrados = 0;
      }
    } else {
      for (var item in response) {
        int codigoCurso = item['codigo_curso'];
        int quantidade = item['quantidade'];
        for (var element in cursosList) {
          if (element.codigo == codigoCurso) {
            element.alunosCadastrados = quantidade;
          }
        }
      }
    }

    notifyListeners();
  }

  Future verificaVinculoCursoAluno(int cursoId) async {
    final response = await getMatriculas();
    vinculoCursoAluno = false;

    if (vinculoCursoAluno == false) {
      if (response.isEmpty) {
        vinculoCursoAluno = false;
      } else {
        for (var item in response) {
          int codigoCurso = item['codigo_curso'];
          int quantidadeAlunos = item['quantidade'];
          if (quantidadeAlunos > 0 && codigoCurso == cursoId) {
            vinculoCursoAluno = true;
            break;
          }
        }
      }
    }

    notifyListeners();
  }

  int get count {
    return cursosList.length;
  }

  void remove(CursoModel user) async {
    await deletCurso(user.codigo.toInt());
    cursosList.removeWhere(
      (element) => element.codigo == user.codigo,
    );
    notifyListeners();
  }

  void put(CursoModel user) async {
    bool atributoExiste =
        cursosList.any((objeto) => objeto.codigo == user.codigo);
    if (atributoExiste) {
      await updateData(user);

      for (var objeto in cursosList) {
        if (objeto.codigo == user.codigo) {
          objeto.descricao = user.descricao;
          objeto.ementa = user.ementa;
        }
      }
    } else {
      await createCurso(user);
    }

    notifyListeners();
  }
}
