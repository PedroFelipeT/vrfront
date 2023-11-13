import 'package:flutter/material.dart';
import 'package:front_vr/provider/aluno_provider.dart';
import 'package:front_vr/provider/curso_provider.dart';
import 'package:front_vr/widgets/custom/componets/curso/alunos_checkbox_tile.dart';
import 'package:provider/provider.dart';

class MatriculaAlunoPage extends StatelessWidget {
  const MatriculaAlunoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AlunosProvider alunos = Provider.of(context);
    alunos.codigoCursoTemp = ModalRoute.of(context)?.settings.arguments as int;
    final CursosProvider cursos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matricular Aluno'),
        actions: [
          IconButton(
            onPressed: () {
              cursos.randlerMatriculas();
              Future.delayed(const Duration(milliseconds: 100), () {
                Navigator.of(context).pop();
              });
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: alunos.count,
              itemBuilder: (context, index) {
                return AlunosCheckBoxTile(alunos.alunosList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
