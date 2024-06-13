import 'package:shoply/core/common/values/constants/error.dart';

class Failure {
  const Failure([this.message = Error.generalError]);

  final String message;
}
