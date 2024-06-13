import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/common/values/constants/error.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:string_validator/string_validator.dart';

final class Validator {
  const Validator._();

  static Either<Failure, String> isEmailValid(String email) {
    return isEmail(email)
        ? right(email)
        : left(const Failure(Error.invalidEmail));
  }

  static Either<Failure, String> isPasswordValid(String password) {
    if (!isLength(password, 8)) {
      return left(const Failure(Error.invalidPasswordLength));
    }

    if (isAlphanumeric(password) || isAlpha(password) || isNumeric(password)) {
      return left(const Failure(Error.invalidPassword));
    }

    return right(password);
  }

  static Either<Failure, String> isConfirmPasswordValid(
    String password,
    String confirmPassword,
  ) {
    return equals(confirmPassword, password)
        ? right(confirmPassword)
        : left(const Failure(Error.invalidConfirmPassword));
  }

  static Either<Failure, String> isNumber(String value, String? message) {
    return isInt(value)
        ? right(value)
        : left(Failure(message ?? Error.invalidInputValue));
  }

  static Either<Failure, String> isString(String value, String? message) {
    return isAlpha(value)
        ? right(value)
        : left(Failure(message ?? Error.invalidInputValue));
  }

  static Either<Failure, String> isFieldValid(String value, String field) {
    return value.isNotEmpty
        ? right(value)
        : left(Failure('$field is required'));
  }
}
