import 'package:ecobin/shared/navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Navbar(username: username);
  }
}
