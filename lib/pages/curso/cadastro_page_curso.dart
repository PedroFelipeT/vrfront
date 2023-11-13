import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_vr/models/curso_model.dart';
import 'package:front_vr/provider/curso_provider.dart';
import 'package:provider/provider.dart';

class CadastroCursoPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController ementaController = TextEditingController();
  late int? codigo;

  CadastroCursoPage({super.key, this.codigo});

  void _loadFormDate(CursoModel user) {
    codigo = user.codigo;
    descricaoController.text = user.descricao;
    ementaController.text = user.ementa;
  }

  @override
  Widget build(BuildContext context) {
    int cursoId = 0;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      final CursoModel user =
          ModalRoute.of(context)?.settings.arguments as CursoModel;
      cursoId = user.codigo;
      _loadFormDate(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Curso'),
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                Provider.of<CursosProvider>(
                  context,
                  listen: false,
                ).put(
                  CursoModel(
                    codigo: cursoId,
                    descricao: descricaoController.text,
                    ementa: ementaController.text,
                  ),
                );
                if (cursoId == 0) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro realizado com sucesso!'),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.green,
                      ),
                    );
                  });
                } else {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro atualizado com sucesso!'),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.green,
                      ),
                    );
                  });
                }
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                controller: descricaoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo descricao não pode ser vazio!';
                  }
                  if (descricaoController.text.length > 50) {
                    return 'O campo deve ter até 50 caracteres!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Descrição*",
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  hintText: 'Digite um nome',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: ementaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo ementa não pode ser vazio!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Ementa*",
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  hintText: 'Digite a ementa',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
