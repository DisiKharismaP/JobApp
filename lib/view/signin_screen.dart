import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign In', style: greyTextStyle.copyWith(fontSize: 16.0)),
                SizedBox(height: 4.0),
                Text('Build Your Career',
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 24.0)
                ),
                SizedBox(height: 30.0),
                Center(
                    child: Image.asset('assets/images/image_sign_in.png', width: 270),
                ),
                SizedBox(height: 30),
                Text('Full Name',
                    style: greyTextStyle.copyWith(fontSize: 16.0)),
                SizedBox(height: 8.0),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 26.0, vertical: 20.0),
                      fillColor: formColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: EmailValidator.validate(emailController.text)
                                ? primaryColor
                                : Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: EmailValidator.validate(emailController.text)
                                ? primaryColor
                                : Colors.red),
                      ),
                      hintText: ''),
                  style: EmailValidator.validate(emailController.text)
                      ? purpleTextStyle
                      : redTextStyle,
                ),
                SizedBox(height: 20.0),
                Text('Password',
                    style: greyTextStyle.copyWith(fontSize: 16.0)),
                SizedBox(height: 8.0),
                TextFormField(
                  obscureText: true,
                  cursorColor: primaryColor,
                  controller: passwordController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 26.0, vertical: 20.0),
                      fillColor: formColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: ''),
                  style: purpleTextStyle,
                ),
                SizedBox(height: 30.0),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: TextButton(
                    onPressed: () async {
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(65.0)),
                    ),
                    child: Text('Sign In',
                        style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('Back to Sign Up',
                        style: greyTextStyle.copyWith(
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
