import 'package:PETshop/animal/CadastroAnimal.dart';
import 'package:PETshop/animal/animal_page.dart';
import 'package:PETshop/home/widgets/appbar/app_bar_widget.dart';
import 'package:PETshop/home/widgets/card/card_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    CardServicesWidget(),
    CadastroAnimalPage(),
    AnimalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add), title: Text("Cadastro Animal")),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets), title: Text("Animal")),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
