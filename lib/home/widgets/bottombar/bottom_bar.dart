import 'package:DevQuiz/core/app_gradients.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add), title: Text("Cadastro Animal")),
        BottomNavigationBarItem(icon: Icon(Icons.pets), title: Text("Animal")),
      ],
    );
  }
}
