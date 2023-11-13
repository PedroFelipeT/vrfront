import 'package:flutter/material.dart';
import 'package:front_vr/models/aluno_model.dart';
import 'package:front_vr/provider/aluno_provider.dart';
import 'package:provider/provider.dart';

class AlunosCheckBoxTile extends StatelessWidget {
  final AlunoModel aluno;
  const AlunosCheckBoxTile(this.aluno, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(aluno.nome),
          value: aluno.checkStatus,
          onChanged: (value) {
            Provider.of<AlunosProvider>(context, listen: false)
                .alterarStatusCheckBox(aluno.codigo);
          },
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
