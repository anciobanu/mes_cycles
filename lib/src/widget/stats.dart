import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mes_cycles/src/model/journee.dart';


class Stats extends StatelessWidget {
  const Stats({super.key, required this.cycles});

  final Box<Journee> cycles;

  @override
  Widget build(BuildContext context) {
    return const Text('Stats');
  }
}