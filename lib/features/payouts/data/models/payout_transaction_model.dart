import 'package:brokr_dashboard_demo/features/payouts/domain/entities/payout_transaction_entity.dart';

class PayoutTransactionModel extends PayoutTransactionEntity {
  const PayoutTransactionModel({
    required super.id,
    required super.date,
    required super.amount,
    required super.status,
  });

  factory PayoutTransactionModel.fromJson(Map<String, dynamic> json) {
    return PayoutTransactionModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      amount: json['amount'],
      status: PayoutTransactionStatus.values
          .firstWhere((e) => e.toString() == json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'amount': amount,
      'status': status.toString(),
    };
  }
}
