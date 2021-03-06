import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_mobileforce_gong/services/responsiveness/responsiveness.dart';
import 'package:team_mobileforce_gong/state/authProvider.dart';

import 'password_reset_success.dart';

//import 'package:flutter_login_signup/src/signup.dart';
//import 'package:google_fonts/google_fonts.dart';

//import 'Widget/bezierContainer.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final textController = TextEditingController();
  EmailValidate validateResponse = EmailValidate.NONE;
  final sizeConfig = SizeConfig();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
      height: height,
      child: Container(
        padding: EdgeInsets.all(sizeConfig.yMargin(context, 3.3)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: sizeConfig.yMargin(context, 5.0)),
                padding: EdgeInsets.all(sizeConfig.yMargin(context, 5.0)),
                child: Center(child: Image.asset('assets/images/Gong (3).png')),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: sizeConfig.yMargin(context, 3.0)),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      fontSize: sizeConfig.textSize(context, 5),
                      fontFamily: 'Gilroy'),
                ),
              ),
              Container(
                width: sizeConfig.yMargin(context, 35.0),
                padding: EdgeInsets.only(
                    left: 0.0, top: sizeConfig.yMargin(context, 2.0)),
                child: Text(
                  'Enter your email address below and we’ll send you password reset instructions',
                  style: TextStyle(fontFamily: 'Gilroy'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: sizeConfig.yMargin(context, 5.0)),
                child: Text(
                  'Email Address',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: Colors.blue,
                  ),
                ),
              ),
              TextField(
                controller: textController,
                decoration: InputDecoration(
//                        border: InputBorder.none,
                  hintText: 'example@user.com',
                  hintStyle: TextStyle(fontFamily: 'Gilroy'),
                ),
              ),
              Builder(
                builder: (context) => Container(
                  margin:
                      EdgeInsets.only(top: sizeConfig.yMargin(context, 7.5)),
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        validateResponse = _validateInput(textController.text);
                        _showToast(context);
                        if (validateResponse == EmailValidate.SUCCESS) {
                          Provider.of<AuthenticationState>(context,
                                  listen: false)
                              .forgotPassword(textController.text)
                              .then((value) => {_navigateToSuccess(context)});
                        }
                      },
                      padding: EdgeInsets.symmetric(
                          vertical: sizeConfig.yMargin(context, 2.0),
                          horizontal: sizeConfig.xMargin(context, 15.0)),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        'Reset'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Gilroy', fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
              _bottomText(context),
            ],
          ),
        ),
      ),
    ));
  }

  EmailValidate _validateInput(String emailText) {
    final regex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

//    'Email address is required'
//    'Email sent to ' + emailText : 'Invalid email,  make sure your email is correct.';
    if (emailText.isNotEmpty) {
      return regex.hasMatch(emailText)
          ? EmailValidate.SUCCESS
          : EmailValidate.INVALID;
    } else
      return EmailValidate.NONE;
  }

  void _navigateToSuccess(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PasswordResetSuccess()));
  }

  void _showToast(BuildContext context) {
    final messages = <String>[
      'Email address is required.',
      'Invalid email,  make sure your email is correct.',
      'An email has been sent to ' + textController.text
    ];
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(messages[validateResponse.index]),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Widget _bottomText(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: sizeConfig.yMargin(context, 6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
//                          margin: const EdgeInsets.only(left: 0.0, top: 200),
            child: Text(
              'Don\'t have an account?',
              style: TextStyle(fontFamily: 'Gilroy'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Sign Up',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: Colors.blue,
                        decoration: TextDecoration.underline))),
          ),
        ],
      ),
    );
  }
}

enum EmailValidate {
  NONE, //no email input
  INVALID, //invalid email input
  SUCCESS // valid email input
}
