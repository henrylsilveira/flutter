import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/core/patterns.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:DevQuiz/login/EsqueciSenha.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'E-mail',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxStyle,
            height: 60.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.green,
                ),
                hintText: 'Insira seu E-mail',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.green,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.green,
              ),
              hintText: 'Insira sua senha',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => EsqueciSenhaPage())),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Esqueceu sua senha?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Lembre-me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF858585),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(gradient: AppGradients.linear),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('PET', style: AppTextStyles.titleServices),
                            Text(
                              'shop',
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Área do cliente',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
