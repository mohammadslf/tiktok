import 'package:flutter/material.dart';
import 'package:tik_tok_clone_dhuru/controller/auth_controller.dart';
import '../../widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "TikTok Clone",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
            ),
            SizedBox(height: 25.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextInputField(
                controller: _emailController,
                myLabelText: "Email",
                myIcon: Icons.email,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextInputField(
                controller: _passwordController,
                myLabelText: "Password",
                myIcon: Icons.lock,
                toHide: true,
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                AuthController.instance
                    .login(_emailController.text, _passwordController.text);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
