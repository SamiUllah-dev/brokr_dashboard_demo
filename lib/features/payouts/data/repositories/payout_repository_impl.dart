import 'package:brokr_dashboard_demo/features/payouts/data/datasource/payout_local_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/payout_transaction_entity.dart';
import '../../domain/repositories/payout_repository.dart';
import '../datasource/payout_remote_datasource.dart';

class PayoutRepositoryImpl implements PayoutRepository {
  final PayoutRemoteDataSource remoteDataSource;
  final PayoutLocalDataSource localDataSource;

  PayoutRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<List<PayoutTransactionEntity>> getPayoutTransactions(String id) async {
    return await localDataSource.getPayoutTransactions(id);
  }
}

// In case we are not using Riverpod as a state management
// then we have to use get_it or injectable for dependency
// injection or Service Locator
final payoutRepositoryProvider = Provider<PayoutRepository>((ref) {
  final remoteDataSource = ref.read(payoutRemoteDataSourceProvider);
  final localDataSource = ref.read(payoutLocalDataSourceProvider);
  return PayoutRepositoryImpl(
    remoteDataSource,
    localDataSource,
  );
});
