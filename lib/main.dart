import 'package:flutter/material.dart';
import 'package:front_vr/pages/aluno/cadastro_page_aluno.dart';
import 'package:front_vr/pages/aluno/consulta_page_aluno.dart';
import 'package:front_vr/pages/curso/cadastro_page_curso.dart';
import 'package:front_vr/pages/curso/consulta_page_curso.dart';
import 'package:front_vr/pages/aluno/matricula_aluno_page.dart';
import 'package:front_vr/pages/curso/matricula_page.dart';
import 'package:front_vr/pages/home_page.dart';
import 'package:front_vr/provider/aluno_provider.dart';
import 'package:front_vr/provider/curso_provider.dart';
import 'package:front_vr/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CursosProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AlunosProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Vr Desafio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'Roboto',
        ),
        routes: {
          AppRoutes.HOME: (context) => const HomePage(),
          AppRoutes.CURSO_FORM: (context) => CadastroCursoPage(),
          AppRoutes.CURSO_LIST: (context) => const ConsultaCursoPage(),
          AppRoutes.ALUNO_FORM: (context) => CadastroPageAluno(),
          AppRoutes.ALUNO_LIST: (context) => const ConsultaAlunoPage(),
          AppRoutes.MATRICULA_LIST: (context) => const MatriculaPage(),
          AppRoutes.MATRICULA_ALUNO: (context) => const MatriculaAlunoPage(),
        },
      ),
    );
  }
}
