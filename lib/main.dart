import 'package:falcon/widgets/navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Falcon());
}

class Falcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: Navbar(),
          ),
        ),
      ),
    );
  }
}
