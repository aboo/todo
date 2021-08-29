import 'package:hooks_riverpod/hooks_riverpod.dart';

final creditStorageProvider = Provider((_) => CreditStorage());

//todo after creating login page complete this class
class CreditStorage {
  static const String _key = 'auth';

  static final CreditStorage _instance = CreditStorage._();

  CreditStorage._();

  factory CreditStorage() => _instance;

  Future<void> saveCredit() async {
    //todo save user
  }

  Future<int> readUserId() async {
    return -1;
  }

  Future<bool> isLogin() async {
    //todo read from credit
    return true;
  }

  Future<void> clearCredit() async {
    //clear
  }
}
