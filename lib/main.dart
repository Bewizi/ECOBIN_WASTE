import 'package:ecobin/screens/register/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Register()));
}

class EcoBinApp extends StatefulWidget {
  const EcoBinApp({super.key});

  @override
  State<EcoBinApp> createState() => _EcoBinAppState();
}

class _EcoBinAppState extends State<EcoBinApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
