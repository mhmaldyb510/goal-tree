class Validators {

  static String? titleValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a title';
    }
    return null;
  }

  static String? resourceNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a resource name';
    }
    return null;
  }
}
