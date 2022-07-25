import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  var data = [
    Data(name: 'A', value: 500),
    Data(name: 'B', value: 500),
  ];

  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SfCircularChart(
          tooltipBehavior: TooltipBehavior(enable: true),
          legend: Legend(isVisible: true),
          series: <CircularSeries>[
            PieSeries<Data, String>(
              dataSource: data,
              xValueMapper: (Data data, _) => data.name,
              yValueMapper: (Data data, _) => data.value,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            )
          ],
        ),
        Slider(
            min: 0,
            max: 1000,
            value: data[0].value.toDouble(),
            onChanged: (newValue) => setState(() {
                  data[0].value = newValue.toInt();
                  data[1].value = 1000 - newValue.toInt();
                })),
        const SizedBox(
          height: 50,
        ),
        Slider(
            thumbColor: Colors.red[900],
            activeColor: Colors.red,
            inactiveColor: Colors.red[200],
            min: 0,
            max: 1000,
            value: data[1].value.toDouble(),
            onChanged: (newValue) => setState(() {
                  data[1].value = newValue.toInt();
                  data[0].value = 1000 - newValue.toInt();
                })),
        const SizedBox(
          height: 30,
        ),
        const SelectableText('Hello, how are you?'),
        const SizedBox(
          height: 30,
        ),
        Switch(
            value: flag,
            onChanged: (value) {
              flag = value;
              setState(() {
                var temp = data[0].value;
                data[0].value = data[1].value;
                data[1].value = temp;
              });
            }),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Reset'),
                        content: const Text('Do you wanna reset?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  data[0].value = 500;
                                  data[1].value = 500;
                                });
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'You just reset the values!')));
                              },
                              child: const Text('Yes')),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('No')),
                        ],
                      ));
            },
            child: const Text('Reset'))
      ],
    );
  }
}

class Data {
  Data({required this.name, required this.value});

  String name;
  int value;
}
