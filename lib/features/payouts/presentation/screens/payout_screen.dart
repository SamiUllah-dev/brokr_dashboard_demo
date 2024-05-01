import 'package:brokr_dashboard_demo/core/constants/drawables.dart';

import 'package:brokr_dashboard_demo/core/presentation/widgets/date_range_filter_selection.dart';
import 'package:brokr_dashboard_demo/core/theme/app_theme.dart';
import 'package:brokr_dashboard_demo/features/payouts/data/models/payout_transaction_model.dart';

import 'package:brokr_dashboard_demo/features/payouts/domain/usecases/get_payout_transactions.dart';
import 'package:brokr_dashboard_demo/features/payouts/presentation/widgets/payout_card.dart';
import 'package:brokr_dashboard_demo/features/payouts/presentation/widgets/payout_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class PayoutScreen extends StatelessWidget {
  const PayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTE:
    // TODO(Sami) Colors should not be hard coded here
    // Use the color scheme from the theme instead
    // This is just for demo purpose
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 25,
      ),
      child: Column(
        children: [
          PayoutCard(
            // Dummy amount
            amount: 983.30,
            nextPayoutDate: DateTime.now().add(const Duration(days: 5)),
            onWithdraw: (amount) {
              // TODO
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('\$$amount withdrawal success demo'),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          _taxInformationWidget(context),
          const SizedBox(height: 30),
          DateRangeFilterSelection(
            onDateRangeSelected: (startDate, endDate) {
              // TODO(SAMI)
            },
          ),
          const SizedBox(height: 30),
          const _Transactions(),
        ],
      ),
    );
  }

  Container _taxInformationWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Color(0xffD3D3D3),
            width: 0.7,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 10,
          end: 6,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xff505050),
                  width: 1.5,
                ),
              ),
              child: Image.asset(
                Drawables.taxIcon,
              ),
            ),
            const SizedBox(width: 32),
            Text(
              'Tax information',
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff3F3E45),
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              Drawables.arrowRightRound,
              height: 18,
              width: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _Transactions extends StatelessWidget {
  const _Transactions();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final payoutTransactions = ref.read(getPayoutTransactionProvider);

      return FutureBuilder(
        future: payoutTransactions.call('dummy_id'),
        builder: (c, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
            );
          }
          final transactions = snapshot.data as List<PayoutTransactionModel>;

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 9),
            itemBuilder: (_, index) {
              final transaction = transactions[index];
              return PayoutTransactionTile(
                transaction: transaction,
              );
            },
          );
        },
      );
    });
  }
}
