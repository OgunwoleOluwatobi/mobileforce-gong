import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_mobileforce_gong/UI/screens/sign_in.dart';
import 'package:team_mobileforce_gong/services/navigation/app_navigation/navigation.dart';
import 'package:team_mobileforce_gong/services/responsiveness/responsiveness.dart';

//import 'package:flutter_login_signup/src/signup.dart';
//import 'package:google_fonts/google_fonts.dart';

//import 'Widget/bezierContainer.dart';

class PasswordResetSuccess extends StatefulWidget {
  PasswordResetSuccess({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PasswordResetSuccess createState() => _PasswordResetSuccess();
}

class _PasswordResetSuccess extends State<PasswordResetSuccess> {
  final sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        splashColor: Color(0xff0984e3),
        onPressed: (){
          Navigation().pushToAndReplace(context, LoginPage());
        }, 
        label: Text('Proceed to Login', style: TextStyle(
          color: Color(0xff0984e3),
        ),)),
        body: Container(
          height: height,
         color: Color(0xff0984e3),
        // color: Colors.blue,
          child: Center(
//            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
//                    margin: const EdgeInsets.only(top: 20),
//                    padding: const EdgeInsets.all(10),
                    child: Center(child: Image.asset('assets/images/Vector.png')),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(top: sizeConfig.yMargin(context, 1.0)),
                    child: Center(
                      child: Text('A password reset link has been sent to your email'.toUpperCase(),
                        style: TextStyle(letterSpacing: 0.07 ,fontWeight: FontWeight.bold, fontSize: sizeConfig.textSize(context, 3.8), fontFamily: 'Gilroy', color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
} 