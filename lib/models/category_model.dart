import 'expense_model.dart';

class Category {
  final String name;
  final double maxAmount;
  final List<Expense> expenses;

  const Category({this.name, this.maxAmount, this.expenses});
}
