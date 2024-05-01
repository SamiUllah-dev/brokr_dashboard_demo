import 'package:brokr_dashboard_demo/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PayoutCard extends StatelessWidget {
  const PayoutCard({
    super.key,
    this.cardNumber,
    required this.amount,
    required this.nextPayoutDate,
    required this.onWithdraw,
  });

  final String? cardNumber;
  final double amount;
  final DateTime nextPayoutDate;
  final void Function(double amount) onWithdraw;

  @override
  Widget build(BuildContext context) {
    final formattedNextPayDate =
        DateFormat('MMM dd, yyyy').format(nextPayoutDate);
    return Ink(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff6366F1),
            Color(0xff393B8B),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 26,
            ),
            child: addOrEditOption(context),
          ),
          const SizedBox(height: 9),
          _cardNumber(context),
          const SizedBox(height: 21),
          const Divider(
            color: Color(0xffD3D3D3),
            thickness: 0.7,
            height: 0.7,
          ),
          const SizedBox(height: 15),
          Text(
            'Available Balance',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          _accountBalance(context),
          const SizedBox(height: 17),
          _nextPayAndWithdrawal(formattedNextPayDate, context),
          const SizedBox(height: 14)
        ],
      ),
    );
  }

  Row addOrEditOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Bank Info',
          style: context.textTheme.bodySmall?.copyWith(
            // These data should not be hard coded
            // The Text font scheme should be defined
            // Inside text theme data if provided by the designer
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${cardNumber == null ? 'Add' : 'Edit'} button tapped',
                ),
              ),
            );
          },
          child: Text(
            cardNumber != null ? 'Edit' : 'Add',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 15,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Align _cardNumber(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 26),
        child: Text(
          cardNumber ?? 'No payout method has been set',
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Row _accountBalance(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'USD',
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 9),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Padding _nextPayAndWithdrawal(
      String formattedNextPayDate, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text('Next payout $formattedNextPayDate')),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              onWithdraw(amount);
            },
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 6,
                ),
                child: Text(
                  'Request withdraw',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
