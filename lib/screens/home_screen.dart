import 'package:budget_ui/data/data.dart';
import 'package:budget_ui/models/category_model.dart';
import 'package:budget_ui/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            floating: true,
            pinned: true,
            expandedHeight: 100.0,
            leading: IconButton(
                iconSize: 30.0, icon: Icon(Icons.settings), onPressed: () {}),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Budget"),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 30.0,
                onPressed: (){},
              )
            ],
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if(index == 0) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 6.0)
                            ],
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: BarChart(expenses: weeklySpending),
                      );
                    } else {
                      final Category category = categories[index - 1];
                      return Container();
                    }
          },
            childCount: 1 + categories.length,
          ))
        ],
      ),
    );
  }
}
