import 'package:flutter/material.dart';

class Telahome extends StatefulWidget {
  const Telahome({super.key});

  @override
  State<Telahome> createState() => _TelahomeState();
}

class _TelahomeState extends State<Telahome> {
  String? email = '';
  String? password = '';
  void carregarDados() async {
    //abrir uma instancia do banco
    dynamic banco = await SharedPreferences.getInstance();
    //aguarda o banco salvar dentro do celular no campo email o que foi digitado
    setState(() {
      email = banco.getString('email');
      password = banco.getString('password');
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}