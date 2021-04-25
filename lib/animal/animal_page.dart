import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/bottombar/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../animal.dart';

class AnimalPage extends StatefulWidget {
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  List<Animal> _animal = [];
  List<Animal> listAnimal = [];

  Future<List<Animal>> _getAnimal() async {
    try {
      String url = '192.168.1.68:5000';
      final response = await http.get(Uri.http(url, '/animal/list'));
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        print(decodeJson[0]['nome']);
        decodeJson.forEach((item) => listAnimal.add(Animal.fromJson(item)));
        return listAnimal;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception('Failed to load Animal list');
    }
  }

  @override
  void initState() {
    super.initState();
    _getAnimal().then((map) {
      _animal = map;
      print(_animal.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_animal.length);
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _animal.length,
          itemBuilder: (BuildContext context, int index) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _animal[index].nome,
                                          style: AppTextStyles.titleServices,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                              "Raça:" + _animal[index].raca),
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
                                                    // Respond to button press
                                                  },
                                                  icon:
                                                      Icon(Icons.add, size: 12),
                                                  label: Text("Vacinas"),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
                                                child: OutlinedButton.icon(
                                                  onPressed: () {
                                                    // Respond to button press
                                                  },
                                                  icon:
                                                      Icon(Icons.add, size: 12),
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
      ),
    );
  }
}
