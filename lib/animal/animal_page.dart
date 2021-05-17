import 'dart:convert';
import 'package:PETshop/animal/consulta_page.dart';
import 'package:PETshop/animal/vacina_page.dart';
import 'package:http/http.dart' as http;
import 'package:PETshop/core/app_colors.dart';
import 'package:PETshop/core/app_gradients.dart';
import 'package:PETshop/core/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../models/animal.dart';

class AnimalPage extends StatefulWidget {
  AnimalPage({listAnimal});

  @override
  _AnimalPageState createState() => _AnimalPageState();
}

var animais = [];
String baseUrl = '192.168.1.68:5000';

class api {
  static Future getAnimal() {
    var url = baseUrl;
    return http.get(Uri.http(url, '/animal/list'));
  }
}

class _AnimalPageState extends State {
  _getAnimal() {
    api.getAnimal().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        animais = list.map((model) => Animal.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAnimal();
  }

  dispose() {
    super.dispose();
  }

  void goVacina(int id) {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VacinaPage(id)));
    });
  }

  void goConsulta(int id) {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ConsultaPage(id)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: animais.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 120,
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
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        animais[index].nome,
                                        style: AppTextStyles.titleServices,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child:
                                            Text("Raça:" + animais[index].raca),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: OutlinedButton.icon(
                                                onPressed: () {
                                                  goVacina(animais[index].id);
                                                },
                                                icon: Icon(Icons.add, size: 12),
                                                label: Text("Vacinas"),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: OutlinedButton.icon(
                                                onPressed: () {
                                                  goConsulta(animais[index].id);
                                                },
                                                icon: Icon(Icons.add, size: 12),
                                                label: Text("Consultas"),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
