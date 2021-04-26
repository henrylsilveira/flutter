import 'package:PETshop/core/app_colors.dart';
import 'package:PETshop/core/app_gradients.dart';
import 'package:PETshop/core/app_text_styles.dart';
import 'package:PETshop/core/patterns.dart';
import 'package:PETshop/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/animal.dart';

class CadastroAnimalPage extends StatefulWidget {
  @override
  CadastroAnimalState createState() => CadastroAnimalState();
}

class CadastroAnimalState extends State<CadastroAnimalPage> {
  Future<Animal> createAnimal(String _nome, String _raca, String _user) async {
    final response = await http.post(
      Uri.http('192.168.1.68:5000', '/animal/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'nome': _nome, 'raca': _raca, 'user_id': '1'}),
    );
    if (response.statusCode == 201) {
      return _showMyDialog();
    } else {
      throw Exception('Erro ao cadastrar');
    }
  }

  _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('SUCESSO!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Novo animalzinho cadastrado.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final TextEditingController _nome = TextEditingController();
  final TextEditingController _raca = TextEditingController();
  Future<Animal>? _animal;

  int _actualIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: AppColors.white,
          gradient: AppGradientsCard.linear,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome do amigo",
                            style: AppTextStyles.titleServices,
                          ),
                          TextField(
                            controller: _nome,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 8.0),
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Raça",
                            style: AppTextStyles.titleServices,
                          ),
                          TextField(
                            controller: _raca,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 8.0),
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: RaisedButton(
                elevation: 5.0,
                onPressed: () {
                  setState(() {
                    _animal = createAnimal(_nome.text, _raca.text, '1');
                  });
                },
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.blue,
                child: Text(
                  'CADASTRAR',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    letterSpacing: 1.0,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
          ],
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
