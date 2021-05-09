import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            NeonButton(
              color: Color(0xFF39FF14),
              onPressed: () {},
              text: 'Button',
              borderRadius: 0,
            ),
            NeonButton(
              color: Color(0xFFFF6700),
              onPressed: () {},
              text: 'Button',
              borderRadius: 20,
            ),
            NeonButton(
              color: Color(0xFFCC00FF),
              onPressed: () {},
              text: 'Button',
              borderRadius: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}

class NeonButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  final double borderRadius;
  NeonButton({
    @required this.color,
    @required this.text,
    @required this.onPressed,
    @required this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            spreadRadius: -6,
            blurRadius: 40,
          ),
        ],
      ),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).scaffoldBackgroundColor,
          ),
          overlayColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          shadowColor: MaterialStateProperty.all(
            color,
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 0, vertical: 18),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: color,
              width: 2,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
