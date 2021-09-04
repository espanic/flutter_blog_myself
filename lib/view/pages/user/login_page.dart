import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/page_util/validators.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/user/join_page.dart';

import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic token = '';

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
                "로그인 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Form _loginForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _emailController,
              funValidate: validateEmail(),
              hint: "Email",
            ),
            CustomTextFormField(
              controller: _passwordController,
              funValidate: validatePassWorld(),
              hint: "Password",
            ),
            CustomElevatedButton(
              funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  _signIn();
                }
              },
              text: "로그인",
            ),
            TextButton(
              child: Text("회원가입"),
              onPressed: () {
                Get.to(JoinPage());
              },
            ),
          ],
        ));
  }

  Future<void> _signIn() async {
    final UserCredential? result = await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (result == null) {
      print('입력이 잘못되었습니다.');
    } else {
      User? user = result.user;
      token = user.toString();
      print("token : $token");
      Get.to(() => HomePage());
    }
  }
}
