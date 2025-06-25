import 'package:ecobin/shared/navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Navbar(username: name);
  }
}
