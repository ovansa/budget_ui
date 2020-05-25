import 'package:budget_ui/helpers/color_helper.dart';
import 'package:budget_ui/models/category_model.dart';
import 'package:budget_ui/models/expense_model.dart';
import 'package:budget_ui/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add), onPressed: (){}, iconSize: 30.0,)
      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)]
              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(bgColor: Colors.grey[200], lineColor: getColor(context, percent), percent: percent, width: 15.0),
                child: Center(
                  child: Text('\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount.toStringAsFixed(2)}', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
