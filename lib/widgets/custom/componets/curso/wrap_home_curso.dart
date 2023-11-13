import 'package:flutter/material.dart';
import 'package:front_vr/provider/curso_provider.dart';
import 'package:front_vr/routes/app_routes.dart';
import 'package:front_vr/widgets/custom/container_title_home.dart';
import 'package:provider/provider.dart';

class WrapModulosCurso extends StatelessWidget {
  const WrapModulosCurso({super.key});

  @override
  Widget build(BuildContext context) {
    final CursosProvider cursos = Provider.of(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomContainerTitle(title: 'Curso'),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 3.0,
          spacing: 3.0,
          direction: Axis.horizontal,
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.CURSO_FORM);
                },
                child: const SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_stories_outlined,
                        size: 75,
                        color: Colors.black,
                      ),
                      Text('Cadastro'),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  cursos.randlerCursos();
                  Navigator.of(context).pushNamed(AppRoutes.CURSO_LIST);
                },
                child: const SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 75,
                        color: Colors.black,
                      ),
                      Text('Consulta'),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  cursos.randlerCursos();
                  cursos.randlerMatriculas();
                  Navigator.of(context).pushNamed(AppRoutes.MATRICULA_LIST);
                },
                child: const SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.border_color_outlined,
                        size: 75,
                        color: Colors.black,
                      ),
                      Text('Matricula'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
