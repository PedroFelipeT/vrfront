import 'package:flutter/material.dart';
import 'package:front_vr/models/aluno_model.dart';
import 'package:front_vr/provider/aluno_provider.dart';
import 'package:front_vr/routes/app_routes.dart';
import 'package:provider/provider.dart';

class AlunoTile extends StatelessWidget {
  final AlunoModel aluno;
  const AlunoTile(this.aluno, {super.key});

  @override
  Widget build(BuildContext context) {
    final AlunosProvider alunos = Provider.of(context);

    return Column(
      children: [
        ListTile(
          title: Text(aluno.nome),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.ALUNO_FORM,
                      arguments: aluno,
                    );
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.orange,
                ),
                IconButton(
                  onPressed: () async {
                    await alunos.verificaVinculoAlunoCurso(aluno.codigo);
                    if (alunos.vinculoAlunoCurso) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Excluir o Aluno'),
                          content: const Text(
                              'Aluno com vinculo com curso, remova do curso para concluir a exclusão.'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Excluir o Aluno'),
                          content: const Text('Deseja excluir o curso?'),
                          actions: [
                            TextButton(
                              child: const Text('Sim'),
                              onPressed: () {
                                Provider.of<AlunosProvider>(context,
                                        listen: false)
                                    .remove(aluno);
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
