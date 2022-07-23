import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_restaurants/view/login_page.dart';
import 'package:local_restaurants/view_model/register_page_view_model.dart';
import 'package:local_restaurants/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  late final String user;
  late final String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final registerProvider =
        Provider.of<RegisterPageViewModel>(context, listen: true);

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
                  "REGISTER",
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
                    isPassword: false,
                    hintText: 'User',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingresa el usuario que deseas crear';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      user = value!;
                      //model.birthDate = value;
                    },
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: MyTextFormField(
                  isPassword: true,
                  hintText: 'Password',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Ingresa el password que desea crear';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    password = value!;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.05),
              //botón registrar
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      registerProvider.savePrefs(user, password);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    padding: const EdgeInsets.all(0),
                    child: const Text(
                      "SIGN UP",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()))
                  },
                  child: const Text(
                    "Already Have an Account? Sign in",
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
