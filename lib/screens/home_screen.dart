import 'package:budget_ui_app/helpers/color_helper.dart';
import 'package:budget_ui_app/models/category_model.dart';
import 'package:budget_ui_app/widgets/bar_chart.dart';
import 'package:flutter/material.dart';
import "package:budget_ui_app/data/data.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(Category category, double totalAmountSpent) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))
          ]),
      margin: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              Text(
                "${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)}" +
                    "/ ${category.maxAmount}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double maxBarWidth = constraints.maxWidth;
              final double percent =
                  (category.maxAmount - totalAmountSpent) / category.maxAmount;
              double barWidth = percent * maxBarWidth;
              if (barWidth < 0) {
                barWidth = 0;
              }
              return Stack(
                children: [
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  Container(
                    height: 20.0,
                    width: barWidth,
                    decoration: BoxDecoration(
                        color: getColor(context, percent),
                        borderRadius: BorderRadius.circular(20.0)),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }

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
              if (indext == 0) {
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
              } else {
                final Category category = categories[indext - 1];
                double totalAmountSpent = 0;
                category.expenses.forEach((element) {
                  totalAmountSpent += element.cost;
                });
                return _buildCategory(category, totalAmountSpent);
              }
            }, childCount: 1 + categories.length),
          )
        ],
      ),
    ));
  }
}
