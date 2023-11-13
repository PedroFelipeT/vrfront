import 'package:flutter/material.dart';
import 'package:front_vr/provider/aluno_provider.dart';
import 'package:front_vr/routes/app_routes.dart';
import 'package:front_vr/widgets/custom/container_title_home.dart';
import 'package:provider/provider.dart';

class WrapModulosAluno extends StatelessWidget {
  const WrapModulosAluno({super.key});

  @override
  Widget build(BuildContext context) {
    final AlunosProvider alunoProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomContainerTitle(title: 'Aluno'),
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
                  Navigator.of(context).pushNamed(AppRoutes.ALUNO_FORM);
                },
                child: const SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.assignment_ind_outlined,
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
                  alunoProvider.randlerAlunos();
                  Navigator.of(context).pushNamed(AppRoutes.ALUNO_LIST);
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
          ],
        ),
      ],
    );
  }
}
