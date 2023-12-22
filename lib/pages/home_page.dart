import 'package:bmi_calculator_app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/themes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textController = TextEditingController();

  String weight = "";
  String height = "";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
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
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "WEIGHT",
                      style: TextStyle(
                          color: index == 0 ? objectGreen : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "$weight".isEmpty ? "0" : "$weight",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Height input
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                          color: index == 1 ? objectGreen : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "0",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // BMI score display
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "BMI SCORE",
                      style: TextStyle(
                          color: index == 2 ? objectGreen : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "0",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
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

  // Building buttons function
  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: subBackgroundColor,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: subBackgroundColor)),
        child: InkWell(
          onTap: () => onButtonTap(value),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  // On button tap function
  void onButtonTap(String value) {
    if (value == "Weight") {
      setState(() {
        index = 0;
      });
    } else if (value == "Height") {
      setState(() {
        index = 1;
      });
    } else if (value == "=") {
      setState(() {
        index = 2;
      });
    }

    if (value != Button.dot && int.tryParse(value) == null) {}
    setState(() {
      weight += value;
    });
  }
}
