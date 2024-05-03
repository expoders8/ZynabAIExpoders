import 'package:flutter/material.dart';

class Helth extends StatefulWidget {
  const Helth({super.key});

  @override
  State<Helth> createState() => _HelthState();
}

class _HelthState extends State<Helth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text(" My Health")),
    );
  }
}
