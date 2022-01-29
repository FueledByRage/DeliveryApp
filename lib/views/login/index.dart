import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/providers/user_provider.dart';
import 'package:delivery/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Consumer<UserController>(
      builder: (BuildContext context, UserController value, _) {
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                roundedInputField(TextField(
                  onChanged: (String value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.redAccent,
                      ),
                      labelText: 'Email',
                      border: InputBorder.none),
                )),
                const SizedBox(
                  height: 30,
                ),
                roundedInputField(TextField(
                  onChanged: (String value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.redAccent,
                      ),
                      labelText: 'Password',
                      border: InputBorder.none),
                )),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: size.width * 8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: primaryColor()),
                            onPressed: () {
                              if (value.handleLogin(email, password)) {
                                Navigator.pushNamed(context, '/');
                              }
                            },
                            child: const Text("Login")))),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                )
              ],
            ));
      },
    ));
  }
}
