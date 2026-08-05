import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // Controladores para os campos de email e senha
  // Estado para mostrar/ocultar senha e lembrar-me
  bool esconderSenha = true;
  bool lembrar = false;

  void salvarDados() async {
    //abrir uma instancia do banco
    dynamic banco = await SharedPreferences.getInstance();
    //aguarda o banco salvar dentro do celular no campo email o que foi digitado
    await banco.setString('email', email.text);
    await banco.setString('password', password.text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 40),

                Image.asset(
                  'assets/netflix_logo.png',
                  width: 250,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Erro ao carregar a logo',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    );
                  },
                ),

                const SizedBox(height: 50),

                TextField(
                  controller: email,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
                  controller: password,
                  obscureText: esconderSenha,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    hintText: "Senha",
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        esconderSenha ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          esconderSenha = !esconderSenha;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      salvarDados();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                CheckboxListTile(
                  value: lembrar,
                  onChanged: (value) {
                    setState(() {
                      lembrar = value!;
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    "Lembre-se de mim",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Novo por aqui? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Assine agora.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
