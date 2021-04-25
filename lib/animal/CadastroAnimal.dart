import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroAnimalPage extends StatefulWidget {
  @override
  CadastroAnimalState createState() => CadastroAnimalState();
}

class CadastroAnimalState extends State<CadastroAnimalPage> {
  int _actualIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF000000),
                        Color(0xFF000000),
                        Color(0xFF000000),
                        Color(0xFF000000),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 0.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 120.0),
                        Text(
                          'CADASTRE SEU PET',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        SizedBox(
                          height: 443.0,
                        ),
                        BottomNavigationBar(
                          currentIndex: _actualIndex,
                          onTap: onTabTapped,
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.home), title: Text("Home")),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.list_alt),
                                title: Text("Cadastrar")),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.pets), title: Text("Animais")),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _actualIndex = index;
    });
    if (_actualIndex == 0) {
      _actualIndex = 1;
      Navigator.pushNamed(context, "/home");
    }
    if (_actualIndex == 1) {}
    if (_actualIndex == 2) {
      _actualIndex = 1;
      Navigator.pushNamed(context, "/listarAnimal");
    }
  }
}
