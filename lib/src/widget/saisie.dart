import 'package:flutter/material.dart';
import 'package:mes_cycles/src/model/journee.dart';


class Saisie extends StatelessWidget {
  const Saisie({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          children: [
            TextField(

            )
          ],
        ),
      )
    );
  }
}