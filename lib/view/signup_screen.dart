import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:job_app/model/user_model.dart';
import 'package:job_app/providers/auth/auth_provider.dart';
import 'package:job_app/providers/user/user_provider.dart';
import 'package:job_app/theme.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(message)));
    }

    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up', style: greyTextStyle.copyWith(fontSize: 16.0)),
                SizedBox(height: 4.0),
                Text('Begin New Journey',
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 24.0)),
                Center(
                  child: Container(
                      width: 120.0,
                      height: 120.0,
                      padding: EdgeInsets.all(6.0),
                      margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor)),
                      child: Image.asset('assets/images/image_profile.png')),
                ),
                Text('Full Name',
                    style: greyTextStyle.copyWith(fontSize: 16.0)),
                SizedBox(height: 8.0),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: nameController,
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
                SizedBox(height: 20.0),
                Text('Email', style: greyTextStyle.copyWith(fontSize: 16.0)),
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
                Text('Password', style: greyTextStyle.copyWith(fontSize: 16.0)),
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
                SizedBox(height: 20.0),
                Text('Your Goal',
                    style: greyTextStyle.copyWith(fontSize: 16.0)),
                SizedBox(height: 8.0),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: goalController,
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
                  child: isLoading ? Center(child: CircularProgressIndicator()) : TextButton(
                    onPressed: () async {
                      if (nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          goalController.text.isEmpty) {
                        showError('Data must not empty');
                      } else {
                        setState(() {
                        isLoading = true;
                        });
                        UserModel user = await authProvider.register(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            goalController.text);
                        setState(() {
                          isLoading = false;
                        });
                        if (user == null) {
                          showError('Wrong data');
                        } else {
                          userProvider.user = user;
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(65.0)),
                    ),
                    child: Text('Sign Up',
                        style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Text('Back to Sign In',
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
