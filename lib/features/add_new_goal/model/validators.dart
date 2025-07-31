class Validators {
  Validators._();

  static String? titleValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a title';
    }
    return null;
  }
}