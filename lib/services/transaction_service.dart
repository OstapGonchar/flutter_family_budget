import 'package:family_budget/models/transaction.dart';

class TransactionService {
  List<Transaction> getTransactions() {
    return [
      Transaction(100, "USD", DateTime(2022, 4, 12)),
      Transaction(10, "USD", DateTime(2022, 4, 13)),
      Transaction(20, "USD", DateTime(2022, 4, 13)),
    ];
  }
}
