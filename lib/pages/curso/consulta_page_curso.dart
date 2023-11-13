import 'package:flutter/material.dart';
import 'package:front_vr/provider/curso_provider.dart';
import 'package:front_vr/widgets/custom/componets/curso/curso_tile.dart';
import 'package:provider/provider.dart';

class ConsultaCursoPage extends StatelessWidget {
  const ConsultaCursoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CursosProvider cursos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Curso'),
      ),
      body: ListView.builder(
        itemCount: cursos.count,
        itemBuilder: (context, index) => CursoTile(cursos.cursosList[index]),
      ),
    );
  }
}
