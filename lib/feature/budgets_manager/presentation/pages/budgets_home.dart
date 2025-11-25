import 'package:flutter/material.dart';

class BudgetsHome extends StatefulWidget {
  const BudgetsHome({super.key});

  @override
  State<BudgetsHome> createState() => _BudgetsHomeState();
}

class _BudgetsHomeState extends State<BudgetsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Presupuestos')));
  }
}
