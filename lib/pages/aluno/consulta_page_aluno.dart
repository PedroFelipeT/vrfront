import 'package:flutter/material.dart';
import 'package:front_vr/provider/aluno_provider.dart';
import 'package:front_vr/widgets/custom/componets/aluno/aluno_tile.dart';
import 'package:provider/provider.dart';

class ConsultaAlunoPage extends StatelessWidget {
  const ConsultaAlunoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AlunosProvider alunos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Aluno'),
      ),
      body: ListView.builder(
        itemCount: alunos.count,
        itemBuilder: (context, index) => AlunoTile(alunos.alunosList[index]),
      ),
    );
  }
}
