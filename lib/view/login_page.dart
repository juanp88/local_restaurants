import 'package:flutter/material.dart';
import 'package:local_restaurants/utils/authenticated.dart';
import 'package:local_restaurants/view/register_page.dart';
import 'package:local_restaurants/view/search_pages.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _user = '';
    String _password = '';

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: MyTextFormField(
                    controller: userController,
                    isPassword: false,
                    hintText: 'User',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Debe ingresar el usuario';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _user = value!;
                    },
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: MyTextFormField(
                    controller: passwordController,
                    isPassword: true,
                    hintText: 'Password',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Debe ingresar el password';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _password = value!;
                    },
                  )),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                ),
              ),

              //botón login
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      var response =
                          Authenticate().validateLogin(_user, _password);
                      if (response == 'Acceso conecedido') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                        passwordController.clear();
                        userController.clear();
                      } else if (response == 'No hay datos disponibles') {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: Text(response),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: Text(response),
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    padding: const EdgeInsets.all(0),
                    child: const Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (RegisterPage())))
                  },
                  child: const Text(
                    "Don't Have an Account? Sign up",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
