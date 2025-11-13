import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobbies'),
          backgroundColor: Color(0xffdddddd),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(icon: Icons.travel_explore, title: 'Travelling', backgroundColor: Colors.green),
              HobbyCard(icon: Icons.skateboarding, title: 'Skating', backgroundColor: Colors.blueGrey),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  const HobbyCard({
    super.key, required this.icon, required this.title, required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( bottom: 40 ),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only( right: 20 ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}