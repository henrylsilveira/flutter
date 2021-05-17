import 'package:PETshop/core/app_colors.dart';
import 'package:PETshop/core/app_gradients.dart';
import 'package:PETshop/core/core.dart';
import 'package:flutter/material.dart';

class ConsultaPage extends StatefulWidget {
  int id = 0;
  ConsultaPage(this.id);

  @override
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: 400,
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
          children: [],
        ),
      ),
    );
  }
}
