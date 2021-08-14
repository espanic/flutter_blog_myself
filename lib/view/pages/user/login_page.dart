import 'package:flutter/material.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/page_util/validators.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/user/join_page.dart';

import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
              funValidate: validateUserName(),
              hint: "Id",
            ),
            CustomTextFormField(
              funValidate: validatePassWorld(),
              hint: "Password",
            ),
            CustomElevatedButton(
              funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  // Get.to(HomePage());
                  UserRepository u = UserRepository();
                  u.login("ssar", "1234");
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
}
