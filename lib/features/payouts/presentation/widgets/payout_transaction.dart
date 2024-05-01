import 'package:brokr_dashboard_demo/core/constants/drawables.dart';
import 'package:brokr_dashboard_demo/core/extensions/core_extensions.dart';
import 'package:brokr_dashboard_demo/core/theme/app_theme.dart';
import 'package:brokr_dashboard_demo/features/payouts/data/models/payout_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/payout_transaction_entity.dart';

class PayoutTransactionTile extends StatelessWidget {
  const PayoutTransactionTile({
    super.key,
    required this.transaction,
  });

  final PayoutTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (transaction.status) {
      PayoutTransactionStatus.pending => const Color(0xffE5DD11),
      PayoutTransactionStatus.processed => const Color(0xff4AE511),
      _ => const Color(0xffF64C4C),
    };

    final amountColor = switch (transaction.status) {
      PayoutTransactionStatus.refund => const Color(0xffF64C4C),
      _ => Colors.black,
    };
    final formattedDate = DateFormat('MMM dd, yyyy').format(transaction.date);
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 4,
        top: 4,
        bottom: 4,
        end: 13,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              Drawables.transferFlat,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.id,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                formattedDate,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${transaction.amount}',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: amountColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                transaction.status.name.capitalizeFirstLetter(),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
