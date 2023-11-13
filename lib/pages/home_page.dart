import 'package:flutter/material.dart';
import 'package:front_vr/widgets/custom/componets/aluno/wrap_home_aluno.dart';
import 'package:front_vr/widgets/custom/componets/curso/wrap_home_curso.dart';
import 'package:front_vr/widgets/custom/drawer_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 241, 130, 3),
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text(
          'Menu Inicial',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            WrapModulosCurso(),
            SizedBox(
              height: 20,
            ),
            WrapModulosAluno(),
          ],
        ),
      ),
    );
  }
}
