import 'package:brokr_dashboard_demo/features/payouts/data/models/payout_transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class PayoutRemoteDataSource {
  Future<List<PayoutTransactionModel>> getPayoutTransactions(String id);
}

class PayoutRemoteDataSourceImpl implements PayoutRemoteDataSource {
  @override
  Future<List<PayoutTransactionModel>> getPayoutTransactions(String id) {
    // TODO: implement getPayoutTransactions
    // Here we should fetch data from remote source
    return Future.value(
      [],
    );
  }
}

// In case we are not using Riverpod as a state management
// then we have to use get_it or injectable for dependency
// injection or Service Locator
final payoutRemoteDataSourceProvider = Provider<PayoutRemoteDataSource>((ref) {
  return PayoutRemoteDataSourceImpl();
});
