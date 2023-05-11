class Validator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserte su correo';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Inserta un correo valido';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserte su contaseña';
    }
    if (value.length < 8) {
      return 'Inserte 8 o mas dígitos';
    }
    return null;
  }
}
