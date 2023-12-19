import 'package:bmi_calculator_app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/themes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          // Weight input

          // Height input

          // BMI score display
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                  "0000000000000000000000000000",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),

          // Input buttons
          Wrap(
            children: Button.buttonValues
                .map((value) => SizedBox(
                    width: screenSize.width / 3,
                    height: screenSize.width / 5,
                    child: buildButton(value)))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget buildButton(value) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: subBackgroundColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Text(
            value,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
