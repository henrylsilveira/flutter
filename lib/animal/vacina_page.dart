import 'dart:convert';

import 'package:PETshop/core/app_colors.dart';
import 'package:PETshop/core/app_gradients.dart';
import 'package:PETshop/core/core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/vacina.dart';

class VacinaPage extends StatefulWidget {
  int id = 0;
  VacinaPage(this.id);

  @override
  _VacinaPageState createState() => _VacinaPageState();
}

var vacinas = [];
String baseUrl = '192.168.1.68:5000';

class api {
  static Future getVacina() {
    var url = baseUrl;
    return http.get(Uri.http(url, '/vacina/?id='));
  }
}

class _VacinaPageState extends State<VacinaPage> {
  _getVacina() {
    api.getVacina().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        vacinas = list.map((model) => Vacina.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.id);
    _getVacina();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(vacinas.length);
    return Scaffold(
      body: ListView.builder(
        itemCount: vacinas.length,
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
                                      Text(""),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                            "Raça: " + vacinas[index].motivo),
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
