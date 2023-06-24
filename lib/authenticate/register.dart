import 'package:csgostats/csgostats/Theme/app_colors.dart';
import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/Theme/loading.dart';
import 'package:csgostats/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final dynamic toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    final ButtonStyle signupStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: AppColors.mainDarkBlue,
      foregroundColor: AppColors.textColor,
    );
    // final errorText = this.errorText;
    return loading == true
        ? const Loading()
        : Scaffold(
            backgroundColor: const Color.fromRGBO(27, 31, 35, 1),
            appBar: AppBar(
              backgroundColor: AppColors.barColor,
              title: const Text('Sign Up To Application'),
              elevation: 0.0,
              actions: [
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.barColor)),
                    icon: const Icon(Icons.person_3),
                    label: const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Play',
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      widget.toggleView();
                    })
              ],
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Email',
                            hintStyle: const TextStyle(fontFamily: 'Play'),
                          ),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (val) => val!.length < 6
                              ? 'Password must be 6+ chars long'
                              : null,
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: signupStyle,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result is String) {
                                  setState(() {
                                    error = result;
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: const Text('Register'),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          error,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
