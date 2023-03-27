import 'package:flutter/material.dart';
import 'package:tik_tok_clone_dhuru/controller/auth_controller.dart';
import '../../widgets/text_input.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _setPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to TikTok",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
              ),
              SizedBox(height: 25.0),
              InkWell(
                onTap: () {
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children: [
                    const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png"),
                        radius: 60),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
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
                  controller: _setPasswordController,
                  myLabelText: "Set Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextInputField(
                  controller: _confirmPasswordController,
                  myLabelText: "Confirm Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextInputField(
                  controller: _usernameController,
                  myLabelText: "UserName",
                  myIcon: Icons.person,
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  AuthController.instance.SignUp(
                      _usernameController.text,
                      _emailController.text,
                      _setPasswordController.text,
                      AuthController.instance.proimg);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Text("Sign Up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
