import 'package:ecobin/screens/onboarding/onboarding_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: OnboardingScreens()));
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
