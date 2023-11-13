// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:front_vr/models/curso_model.dart';
import 'package:front_vr/provider/curso_provider.dart';
import 'package:front_vr/routes/app_routes.dart';
import 'package:provider/provider.dart';

class CursoTile extends StatelessWidget {
  final CursoModel curso;
  const CursoTile(this.curso, {super.key});

  @override
  Widget build(BuildContext context) {
    final CursosProvider cursoProvider = Provider.of(context);
    return Column(
      children: [
        ListTile(
          title: Text(
            'Descrição: ${curso.descricao}',
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            'Ementa: ${curso.ementa}',
            style: const TextStyle(fontSize: 18),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.CURSO_FORM,
                      arguments: curso,
                    );
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.orange,
                ),
                IconButton(
                  onPressed: () async {
                    await cursoProvider.verificaVinculoCursoAluno(curso.codigo);
                    if (cursoProvider.vinculoCursoAluno) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Excluir Curso'),
                          content: const Text(
                              'Curso com aluno vinculado, remover alunos.'),
                          actions: [
                            TextButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Excluir Curso'),
                          content: const Text('Deseja excluir o curso?'),
                          actions: [
                            TextButton(
                              child: const Text('Sim'),
                              onPressed: () {
                                Provider.of<CursosProvider>(context,
                                        listen: false)
                                    .remove(curso);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Cadastro removido com sucesso!'),
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Não'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
