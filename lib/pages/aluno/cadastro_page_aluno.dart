import 'package:flutter/material.dart';
import 'package:front_vr/models/aluno_model.dart';
import 'package:front_vr/provider/aluno_provider.dart';
import 'package:provider/provider.dart';

class CadastroPageAluno extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  late int? codigo;

  CadastroPageAluno({super.key, this.codigo});

  void _loadFormDate(AlunoModel user) {
    if (user.codigo != null) {
      codigo = user.codigo;
      nomeController.text = user.nome;
    }
  }

  @override
  Widget build(BuildContext context) {
    int codigoAluno = 0;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      final AlunoModel user =
          ModalRoute.of(context)?.settings.arguments as AlunoModel;
      codigoAluno = user.codigo;
      _loadFormDate(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Aluno'),
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                Provider.of<AlunosProvider>(
                  context,
                  listen: false,
                ).put(
                  AlunoModel(
                    codigo: codigoAluno,
                    nome: nomeController.text,
                  ),
                );
                if (codigoAluno == 0) {
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
                controller: nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo nome não pode ser vazio!';
                  }
                  if (nomeController.text.length > 50) {
                    return 'O campo deve ter até 50 caracteres!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome*",
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
                  hintText: 'Nome do aluno',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
