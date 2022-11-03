import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal.shade200,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 75.0, right: 20.0, bottom: 20.0),
        child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Rechercher sur Amazon',
                prefixIcon: const Align(
                  widthFactor: 2.0,
                  heightFactor: 2.0,
                  child: Icon(Icons.search),
                ),
                suffixIcon: const Align(
                  widthFactor: 2.0,
                  heightFactor: 2.0,
                  child: Icon(Icons.center_focus_strong),
                ))),
      ),
    );
  }
}
