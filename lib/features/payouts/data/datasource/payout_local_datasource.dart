import 'package:brokr_dashboard_demo/features/payouts/data/models/payout_transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/payout_transaction_entity.dart';

abstract interface class PayoutLocalDataSource {
  Future<List<PayoutTransactionModel>> getPayoutTransactions(String id);
}

class PayoutLocalDataSourceImpl implements PayoutLocalDataSource {
  @override
  Future<List<PayoutTransactionModel>> getPayoutTransactions(String id) {
    // TODO: implement getPayoutTransactions
    // return dummy data
    return Future.value(
      [
        PayoutTransactionModel(
          id: '11850624',
          date: DateTime.now(),
          amount: 100,
          status: PayoutTransactionStatus.pending,
        ),
        PayoutTransactionModel(
          id: '11850654',
          date: DateTime.now(),
          amount: 200,
          status: PayoutTransactionStatus.processed,
        ),
        PayoutTransactionModel(
          id: '15850624',
          date: DateTime.now(),
          amount: 300,
          status: PayoutTransactionStatus.refund,
        ),
        PayoutTransactionModel(
          id: '118506220',
          date: DateTime.now(),
          amount: 300,
          status: PayoutTransactionStatus.pending,
        ),
        PayoutTransactionModel(
          id: '11560624',
          date: DateTime.now(),
          amount: 300,
          status: PayoutTransactionStatus.refund,
        ),
        PayoutTransactionModel(
          id: '11850677',
          date: DateTime.now(),
          amount: 300,
          status: PayoutTransactionStatus.processed,
        ),
        PayoutTransactionModel(
          id: '11850564',
          date: DateTime.now(),
          amount: 300,
          status: PayoutTransactionStatus.refund,
        ),
      ],
    );
  }
}

// In case we are not using Riverpod as a state management
// then we have to use get_it or injectable for dependency
// injection or Service Locator
final payoutLocalDataSourceProvider = Provider<PayoutLocalDataSource>((ref) {
  return PayoutLocalDataSourceImpl();
});
