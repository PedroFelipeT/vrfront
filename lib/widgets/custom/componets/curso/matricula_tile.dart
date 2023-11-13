import 'package:flutter/material.dart';
import 'package:front_vr/models/curso_model.dart';
import 'package:front_vr/provider/aluno_provider.dart';
import 'package:front_vr/routes/app_routes.dart';
import 'package:provider/provider.dart';

class MatriculaTile extends StatelessWidget {
  final CursoModel curso;
  const MatriculaTile(this.curso, {super.key});

  @override
  Widget build(BuildContext context) {
    final AlunosProvider alunoProvider = Provider.of(context);

    return GestureDetector(
      onTap: () {
        alunoProvider.randlerAlunosMatriculados(curso.codigo);
        Navigator.of(context)
            .pushNamed(arguments: curso.codigo, AppRoutes.MATRICULA_ALUNO);
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                curso.descricao,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(curso.ementa),
              const SizedBox(height: 8.0),
              Text(
                'Alunos: ${curso.alunosCadastrados}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
