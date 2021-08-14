import 'package:flutter/material.dart';
import 'package:flutter_blog/page_util/validators.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';

import 'package:get/get.dart';

class JoinPage extends StatelessWidget {
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
              funValidate: validateUserName(),
              hint: "Id",
            ),
            CustomTextFormField(
              funValidate: validatePassWorld(),
              hint: "Password",
            ),
            CustomTextFormField(
              funValidate: validateEmail(),
              hint: "Email",
            ),
            CustomElevatedButton(
              funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(LoginPage());
                }
              },
              text: "가입하기",
            ),
            TextButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text("이미 회원이신가요?"),
            ),
          ],
        ));
  }
}
