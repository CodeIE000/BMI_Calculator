import 'package:bmi_calculator_app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/themes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String weight = "";
  String height = "";
  String bmi = "";
  String classification = "";
  int index = 0;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),

          // Weight text display
          Text(
            "WEIGHT(kg)",
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
              padding: const EdgeInsets.all(1),
              child: Column(
                children: [
                  Text(
                    weight.isEmpty ? "0" : weight,
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

          // Height text display
          Text(
            "HEIGHT(cm)",
            style: TextStyle(
                color: index == 1 ? objectGreen : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),

          // Height input
          SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(1),
              child: Column(
                children: [
                  Text(
                    height.isEmpty ? "0" : height,
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

          // BMI Score text display
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
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(1),
              child: Column(
                children: [
                  Text(
                    bmi.isEmpty ? "0" : bmi,
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

          // BMI Classification text
          Text(
            classification.isEmpty ? "NONE" : classification,
            style: TextStyle(
                color: index == 2 ? objectGreen : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(
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
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  // On button tap function, calculations and logics
  void onButtonTap(String value) {
    if (value == "Weight") {
      // User clicked weight key
      setState(() {
        index = 0;
      });
    } else if (value == "Height") {
      // User clicked height key
      setState(() {
        index = 1;
      });
    } else if (value == "Calculate") {
      // User clicked calculate key
      setState(() {
        index = 2;

        // Convert strings to double
        final double doubleWeight = double.parse(weight);
        final double doubleHeight = double.parse(height);

        // BMI score calculation
        double result = doubleWeight / (doubleHeight * doubleHeight / 10000);

        // Classifications
        if (result < 16.5) {
          setState(() {
            classification = "SEVERELY WASTED";
          });
        } else if (result >= 16.5 && result < 18.5) {
          setState(() {
            classification = "UNDERWEIGHT";
          });
        } else if (result >= 18.5 && result < 25) {
          setState(() {
            classification = "NORMAL";
          });
        } else if (result >= 25 && result < 30) {
          setState(() {
            classification = "OVERWEIGHT";
          });
        } else if (result >= 30 && result < 35) {
          setState(() {
            classification = "OBESITY CLASS I";
          });
        } else if (result >= 35 && result < 40) {
          setState(() {
            classification = "OBESITY CLASS II";
          });
        } else if (result >= 40) {
          setState(() {
            classification = "OBESITY CLASS III";
          });
        }

        // Convert BMI score to string
        String finalResult = result.toStringAsFixed(2);

        // Change BMI score value and display
        setState(() {
          bmi = finalResult;
        });
      });
    } else if (value == "Clear") {
      //User clicked clear key
      setState(() {
        weight = "";
        height = "";
        bmi = "";
        classification = "NONE";
        if (index == 2) {
          setState(() {
            index = 0;
          });
        }
      });
    }

    // Inputs when weight is selected
    if ((value == Button.dot || double.tryParse(value) != null) && index == 0) {
      setState(() {
        weight += value;
      });
    }

    // Inputs when height is selected
    if ((value == Button.dot || double.tryParse(value) != null) && index == 1) {
      setState(() {
        height += value;
      });
    }
  }
}
