final class Error {
  const Error._();

  static const invalidForm = 'All fields are required';

  static const invalidName = 'Name is required';

  static const invalidEmail = 'Email Id is invalid';

  static const invalidPassword =
      'Password should contain a letter, number and symbol';

  static const invalidPasswordLength =
      'Password must be of at least of 8 characters';

  static const incorrectCredentials = 'Email or Password is incorrect';

  static const invalidInputValue = 'Input value is invalid';

  static const invalidConfirmPassword = 'Confirm Password does not match';

  static const invalidShoppingList = 'List is empty, please add some items';

  static const serverError = 'Something went wrong, please try again later';

  static const generalError = 'An unexpected error occured';
}
