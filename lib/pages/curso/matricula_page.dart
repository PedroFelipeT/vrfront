import 'package:flutter/material.dart';
import 'package:front_vr/provider/curso_provider.dart';
import 'package:front_vr/widgets/custom/componets/curso/matricula_tile.dart';
import 'package:provider/provider.dart';

class MatriculaPage extends StatelessWidget {
  const MatriculaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CursosProvider cursos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrícula'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cursos.count,
              itemBuilder: (context, index) {
                return MatriculaTile(cursos.cursosList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
