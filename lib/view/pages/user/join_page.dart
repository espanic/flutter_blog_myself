import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/page_util/validators.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';

import 'package:get/get.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool? _success;
  String _userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              child: Text(
                "회원가입 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _idController,
              funValidate: validateUserName(),
              hint: "Id",
            ),
            CustomTextFormField(
              controller: _passwordController,
              funValidate: validatePassWorld(),
              hint: "Password",
            ),
            CustomTextFormField(
              controller: _emailController,
              funValidate: validateEmail(),
              hint: "Email",
            ),
            _success == null
                ? SizedBox()
                : Text(_success == true
                    ? 'Successfully registered $_userEmail'
                    : 'Registration failed'),
            CustomElevatedButton(
              funPageRoute: () async {
                if (_formKey.currentState!.validate()) {
                  await _register();
                  Future.delayed(
                    Duration(seconds: 2),
                    () => Get.to(
                      () => LoginPage(),
                    ),
                  );
                }
              },
              text: "가입하기",
            ),
            TextButton(
              onPressed: () {
                Get.to(() => LoginPage());
              },
              child: Text("이미 회원이신가요?"),
            ),
          ],
        ));
  }

  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    _idController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      _success = false;
    }
  }
}
