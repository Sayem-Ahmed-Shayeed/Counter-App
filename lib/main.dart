import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  void increaseCounter() {
    setState(() {
      count++;
    });
  }

  bool isPositive(int number) {
    return number > 0;
  }

  void decreaseCounter() {
    if (isPositive(count)) {
      setState(() {
        count--;
      });
    }
  }

  void resetCounter() {
    if (isPositive(count)) {
      setState(() {
        count = 0;
      });
    }
  }

  ButtonStyle? elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Color(0xffF5FEFD),
    elevation: 15,
    shadowColor: Color(0xffF5FEFD),
    foregroundColor: Colors.black,
  );

  Widget customButton(void Function()? onPressed, String text) {
    return ElevatedButton(
      style: elevatedButtonStyle,
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }

  Widget customTextWidget(
    String text,
    double fontSize,
    double? letterSpacing,
    FontWeight fontWeight,
  ) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff1A2421),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextWidget("Counter App", 12, 2, FontWeight.w200),
              SizedBox(height: 5),
              customTextWidget("$count", 30, 0, FontWeight.w700),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customButton(decreaseCounter, "―"),
                  SizedBox(width: 20),
                  customButton(resetCounter, "↺"),
                  SizedBox(width: 20),
                  customButton(increaseCounter, "✚"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
