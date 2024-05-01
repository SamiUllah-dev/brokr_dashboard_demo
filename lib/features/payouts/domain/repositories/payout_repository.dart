import 'package:brokr_dashboard_demo/features/payouts/domain/entities/payout_transaction_entity.dart';

abstract interface class PayoutRepository {
  Future<List<PayoutTransactionEntity>> getPayoutTransactions(String id);
}
