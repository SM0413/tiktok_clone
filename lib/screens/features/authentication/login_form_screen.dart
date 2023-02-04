import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/authentication/widgets/form_button.dart';

import '../onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  bool isThereEmail = false;
  String _password = "";
  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
        );
      }
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onEditingComplete() {
    if (_email != "") {
      if (_password != "") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
        );
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gaps.v28,
                TextFormField(
                  autofocus: true,
                  onChanged: (value) => {_email = value},
                  onEditingComplete: _onEditingComplete,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "i dont like your email";
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData["email"] = newValue;
                    }
                  },
                ),
                Gaps.v16,
                GestureDetector(
                  child: TextFormField(
                    onEditingComplete: _onEditingComplete,
                    onChanged: (value) => {_password = value},
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "wrong password";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData["password"] = newValue;
                      }
                    },
                  ),
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmitTap,
                  child: const FormButton(
                    disabled: false,
                    buttonText: "Login",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
