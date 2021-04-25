import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 125, top: 200),
                  child: Row(
                    children: [
                      Text('PET', style: AppTextStyles.titleSplash),
                      Text('shop', style: AppTextStyles.titleSplash2),
                    ],
                  ),
                ),
                Text('O Melhor da cidade para você.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
