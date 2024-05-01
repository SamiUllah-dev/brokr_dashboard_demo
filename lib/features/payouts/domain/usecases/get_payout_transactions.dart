import 'package:brokr_dashboard_demo/features/payouts/data/repositories/payout_repository_impl.dart';
import 'package:brokr_dashboard_demo/features/payouts/domain/entities/payout_transaction_entity.dart';
import 'package:brokr_dashboard_demo/features/payouts/domain/repositories/payout_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetPayoutTransactions {
  final PayoutRepository repository;

  GetPayoutTransactions(this.repository);

  Future<List<PayoutTransactionEntity>> call(String id) async {
    return await repository.getPayoutTransactions(id);
  }
}

final getPayoutTransactionProvider =
    Provider.autoDispose<GetPayoutTransactions>((ref) {
  final repository = ref.read(payoutRepositoryProvider);
  return GetPayoutTransactions(repository);
});
