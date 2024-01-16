import 'package:flutter/material.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
     int _currentIndex = 0;
    void ontap(int index){
      setState(() {
        _currentIndex = index;
      });
    }
  @override
  Widget build(BuildContext context) {
 
    return const Scaffold();
  }
}
