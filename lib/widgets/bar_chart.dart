import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  const BarChart({this.expenses});
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((element) {
      if (element > mostExpensive) {
        mostExpensive = element;
      }
    });
    return Column(
      children: [
        Text(
          "Weekly Spending",
          style: TextStyle(fontSize: 18.00, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            Text(
              "Nov , 10, 2020 - Nov 16, 2020",
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Bar(
              label: "Su",
              amountSpent: expenses[0],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: "Mo",
              amountSpent: expenses[1],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: "Tu",
              amountSpent: expenses[2],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: "We",
              amountSpent: expenses[3],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: "Th",
              amountSpent: expenses[4],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: "Fr",
              amountSpent: expenses[5],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: "Sa",
              amountSpent: expenses[6],
              mostExpensive: mostExpensive,
            )
          ],
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  const Bar({this.label, this.amountSpent, this.mostExpensive});
  final double _maxBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text("${amountSpent.toStringAsFixed(2)}"),
        Container(
          width: 10,
          height: barHeight,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
        ),
        Text("$label")
      ],
    );
  }
}
