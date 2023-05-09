import 'package:flutter/material.dart';

class ValidatorsForm extends StatefulWidget {
  const ValidatorsForm({Key? key}) : super(key: key);

  @override
  State<ValidatorsForm> createState() => _ValidatorsFormState();
}

class _ValidatorsFormState extends State<ValidatorsForm> {

  bool _cpfValido = false;

  bool validarCPF(String cpf) {
    // Remove caracteres não numéricos
    cpf = cpf.replaceAll(RegExp(r'\D'), '');

    if (cpf.length != 11) return false;

    // Verifica se todos os dígitos são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false;

    // Valida os dígitos verificadores
    for (int i = 9; i < 11; i++) {
      int soma = 0;
      for (int j = 0; j < i; j++) {
        soma += int.parse(cpf[j]) * (i + 1 - j);
      }
      int resto = ((soma * 10) % 11) % 10;
      if (resto != int.parse(cpf[i])) return false;
    }
    return true;
  }

  final _formKey = GlobalKey<FormState>();

  void _atualizarValidacao() {
    setState(() {
      _cpfValido = validarCPF(_controladorCPF.text);
      _formKey.currentState!.validate();
    });
  }

  TextEditingController _controladorNome = TextEditingController();
  TextEditingController _controladorCPF = TextEditingController();
  TextEditingController _controladorEmail = TextEditingController();
  TextEditingController _controladorTel = TextEditingController();
  TextEditingController _controladorEndereco = TextEditingController();

  void _validarFormulario() {
    if (_formKey.currentState!.validate()) {
      print('Formulário funcionou');
    } else {
      print('Formulário não funcionou');
    }
  }

  @override
  void initState() {
    super.initState();
    _controladorCPF.addListener(_atualizarValidacao);
  }

  @override
  void dispose() {
    _controladorCPF.removeListener(_atualizarValidacao);
    _controladorCPF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
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
                validator: (String? cpf) {
                  if (cpf == null || cpf.isEmpty) {
                    return 'Por favor, insira o CPF';
                  }
                  if (!validarCPF(cpf)) {
                    return 'CPF inválido';
                  }
                  _cpfValido = true;
                },
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
                onPressed: _cpfValido ? _validarFormulario : null,
                child: Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
