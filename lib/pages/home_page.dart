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
  String bmi = "";
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Text(
            "WEIGHT",
            style: TextStyle(
                color: index == 0 ? objectGreen : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          // Weight input
          SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "$weight".isEmpty ? "0" : "$weight",
                    style: TextStyle(
                        color: index == 0 ? objectGreen : Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),

          Text(
            "HEIGHT",
            style: TextStyle(
                color: index == 1 ? objectGreen : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),

          // Height input
          SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.vertical,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "$height".isEmpty ? "0" : "$height",
                    style: TextStyle(
                        color: index == 1 ? objectGreen : Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),

          Text(
            "BMI SCORE",
            style: TextStyle(
                color: index == 2 ? objectGreen : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          // BMI score display
          SingleChildScrollView(
            reverse: true,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "$bmi".isEmpty ? "0" : "$bmi",
                    style: TextStyle(
                        color: index == 2 ? objectGreen : Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ],
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
    } else if (value == "Calculate") {
      setState(() {
        index = 2;
        final double doubleWeight = double.parse(weight);
        final double doubleHeight = double.parse(height);

        double result = doubleWeight / (doubleHeight * doubleHeight / 10000);
        String finalResult = result.toStringAsFixed(2);
        setState(() {
          bmi = finalResult;
        });
      });
    } else if (value == "Clear") {
      setState(() {
        weight = "";
        height = "";
        bmi = "";
        if (index == 2) {
          setState(() {
            index = 0;
          });
        }
      });
    }

    if ((value == Button.dot || double.tryParse(value) != null) && index == 0) {
      setState(() {
        weight += value;
      });
    }

    if ((value == Button.dot || double.tryParse(value) != null) && index == 1) {
      setState(() {
        height += value;
      });
    }
  }
}
