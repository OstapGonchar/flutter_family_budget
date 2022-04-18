import 'package:family_budget/models/transaction.dart';

class TransactionService {
  List<Transaction> getTransactions() {
    return [
      Transaction(1, 100, "USD", DateTime(2022, 4, 12)),
      Transaction(2, 10, "USD", DateTime(2022, 4, 13)),
      Transaction(3, 20, "USD", DateTime(2022, 4, 13)),
    ];
  }
}
