import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right<L, R>).value;
  L asLeft() => (this as Left<L, R>).value;
}

extension DateTimeFormatter on DateTime {
  String mmmdyyyy() => DateFormat.yMMMd().format(this);
}

extension MoneyFormat on double {
  String inMoneyFormat([String currency = 'PHP']) =>
      NumberFormat.simpleCurrency(name: currency).format(this);
}
