import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';

class SimpleForm extends StatefulWidget {
  const SimpleForm({Key? key}) : super(key: key);

  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {

  TextEditingController _controladorNome = TextEditingController();
  TextEditingController _controladorCPF = TextEditingController();
  TextEditingController _controladorEmail = TextEditingController();
  TextEditingController _controladorTel = TextEditingController();
  TextEditingController _controladorEndereco = TextEditingController();

  void validarDadosFormulario() {
    if (_controladorNome.text.isNotEmpty
        && _controladorCPF.text.isNotEmpty
        && _controladorEmail.text.isNotEmpty) {
        String cpf = _controladorCPF.text.replaceAll(RegExp(r'\D'), '');
        if (CPFValidator.isValid(cpf)) {
          print('CPF Válido - ' + CPFValidator.format(cpf));
      }else{
          print('CPF Inválido');
        }
    }else{
      print('Ou Nome ou CPF ou Email estão vazios');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Formulário de Cadastro de Pessoa'),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 15, 32, 10),
            child: TextFormField(
              controller: _controladorNome,
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Nome Completo', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 5, 32, 10),
            child: TextFormField(
              controller: _controladorCPF,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'CPF',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 5, 32, 10),
            child: TextFormField(
              controller: _controladorEmail,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 5, 32, 10),
            child: TextFormField(
              controller: _controladorTel,
              maxLines: 1,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: 'Telefone', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 5, 32, 10),
            child: TextFormField(
              controller: _controladorEndereco,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: 'Endereço', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 440,
            height: 50,
            child: ElevatedButton(
              onPressed: validarDadosFormulario,
              child: Text('Cadastrar'),
            ),
          ),
        ],
      ),
    );
  }
}
