import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  var num = 0;
  var checkboxStates = List<bool>.filled(5, false);
  var checkboxValues = [100, 200, 300, 400, 500];
  var textColor = Colors.black;
  var colors = [Colors.black, Colors.red, Colors.blue];
  var colorsStrings = ['Black', 'Red', 'Blue'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          '$num',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: checkboxStates.length,
                itemBuilder: ((context, index) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('${checkboxValues[index]}'),
                    value: checkboxStates[index],
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxStates[index] = value!;
                        if (value) {
                          num += checkboxValues[index];
                        } else {
                          num -= checkboxValues[index];
                        }
                      });
                    })))),
        Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => RadioListTile(
                    title: Text(colorsStrings[index]),
                    value: colors[index],
                    groupValue: textColor,
                    onChanged: (Color? value) {
                      setState(() {
                        textColor = value!;
                      });
                    })))
      ],
    );
  }
}
