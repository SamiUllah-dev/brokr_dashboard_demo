import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum PayoutTransactionStatus {
  pending,
  processed,
  refund,
}

@immutable
class PayoutTransactionEntity extends Equatable {
  final String id;
  final DateTime date;
  final double amount;
  final PayoutTransactionStatus status;

  const PayoutTransactionEntity({
    required this.id,
    required this.date,
    required this.amount,
    required this.status,
  });

  @override
  List<Object?> get props => [id];
}
