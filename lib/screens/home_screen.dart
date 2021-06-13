import 'package:budget_ui_app/widgets/bar_chart.dart';
import 'package:flutter/material.dart';
import "package:budget_ui_app/data/data.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
              floating: true,
              expandedHeight: 50,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 30.00,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
              title: Text("Budget Ui App"),
              leading: IconButton(
                icon: Icon(Icons.settings, size: 30.00, color: Colors.white),
                onPressed: () {},
              )),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int indext) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: BarChart(expenses: weeklySpending),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 5.0)
                      ]),
                ),
              );
            }, childCount: 1),
          )
        ],
      ),
    ));
  }
}
