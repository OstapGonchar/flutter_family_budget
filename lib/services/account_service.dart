import 'package:family_budget/models/account.dart';

class AccountService {
  List<Account> getAccounts() {
    return [
      const Account('Nordea', id: 1),
      const Account('Wallet', id: 2),
    ];
  }
}
