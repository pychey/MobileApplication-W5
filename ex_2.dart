import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum IconPosition { left, right }

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;

  const ButtonType(this.color);
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Button'),
          backgroundColor: Color(0xffdddddd),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: 'Submit', icon: Icons.check ),
              CustomButton(label: 'Time', icon: Icons.timer, type: ButtonType.secondary, position: IconPosition.right),
              CustomButton(label: 'Account', icon: Icons.share,type: ButtonType.disabled, position: IconPosition.right),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType type;

  const CustomButton({
    super.key, required this.label, required this.icon, this.position = IconPosition.left, this.type = ButtonType.primary
  });

  @override
  Widget build(BuildContext context) {
    final children = position == IconPosition.left
      ? [ 
        Icon( icon, color: Colors.white, size: 25 ),
        Gap(20),
        Text( label, style: TextStyle( color: Colors.white, fontSize: 20 ) ) 
      ]  
      : [ 
        Text( label, style: TextStyle( color: Colors.white, fontSize: 20 ) ),
        Gap(20),
        Icon( icon, color: Colors.white, size: 25 ),
      ];

    return Container(
      margin: EdgeInsets.only( bottom: 40 ),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children
        ),
      ),
    );
  }
}