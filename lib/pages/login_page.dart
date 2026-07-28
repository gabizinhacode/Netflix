import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool lembrar = false;
  bool esconderSenha = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(

              children: [

                const SizedBox(height: 40),

                Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/7/7a/Logonetflix.png',
                 height: 80,
                ),

                const SizedBox(height: 50),

                TextField(
                  controller: emailController,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(

                    filled: true,

                    fillColor: Colors.grey.shade900,

                    hintText: "Email",

                    hintStyle:
                        const TextStyle(color: Colors.grey),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(6),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextField(

                  controller: passwordController,

                  obscureText: esconderSenha,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(

                    filled: true,

                    fillColor: Colors.grey.shade900,

                    hintText: "Senha",

                    hintStyle:
                        const TextStyle(color: Colors.grey),

                    suffixIcon: IconButton(

                      icon: Icon(
                        esconderSenha
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),

                      onPressed: () {

                        setState(() {

                          esconderSenha =
                              !esconderSenha;

                        });

                      },

                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(6),
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

                    onPressed: () {},

                    child: const Text(

                      "Entrar",

                      style: TextStyle(

                        fontSize: 18,

                        color: Colors.white,

                      ),

                    ),

                  ),

                ),

                const SizedBox(height: 18),

                TextButton(

                  onPressed: () {},

                  child: const Text(

                    "Esqueceu a senha?",

                    style: TextStyle(
                      color: Colors.white,
                    ),

                  ),

                ),

                CheckboxListTile(

                  value: lembrar,

                  onChanged: (valor) {

                    setState(() {

                      lembrar = valor!;

                    });

                  },

                  activeColor: Colors.red,

                  title: const Text(

                    "Lembre-se de mim",

                    style: TextStyle(
                      color: Colors.white,
                    ),

                  ),

                  controlAffinity:
                      ListTileControlAffinity.leading,

                ),

                const SizedBox(height: 20),

                Row(

                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const Text(

                      "Novo por aqui? ",

                      style: TextStyle(
                        color: Colors.grey,
                      ),

                    ),

                    GestureDetector(

                      onTap: () {},

                      child: const Text(

                        "Assine agora.",

                        style: TextStyle(

                          color: Colors.white,

                          fontWeight:
                              FontWeight.bold,

                        ),

                      ),

                    )

                  ],

                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}