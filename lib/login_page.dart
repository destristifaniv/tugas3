import 'main.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String useremail = "username@pensmail.com";
  String pass = "123456";
  String notif = " ";

  void login(String email, String password) {
    if (email == useremail && password == pass) {
      setState(() {
        notif = " ";
      });
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => MyHomePage())
      );
    } else {
      setState(() {
        notif = "Email atau password salah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // Warna pastel pink muda
      appBar: AppBar(
        backgroundColor: Colors.purple[200], // Warna ungu pastel
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter Email",
                filled: true,
                fillColor: Colors.blue[50], // Warna biru pastel
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                filled: true,
                fillColor: Colors.green[50], // Warna hijau pastel
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => login(emailController.text.toString(),
                  passwordController.text.toString()),
              child: Container(
                height: 45,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.purple[200], // Warna ungu pastel
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              notif,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
