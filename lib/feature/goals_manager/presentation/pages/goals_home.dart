import 'package:flutter/material.dart';

class GoalsHome extends StatefulWidget {
  const GoalsHome({super.key});

  @override
  State<GoalsHome> createState() => _GoalsHomeState();
}

class _GoalsHomeState extends State<GoalsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Objetivos')));
  }
}
