class GfFormValidators {
  String? Function(String?) getnamevalidator(
      {String? emptyErrorText, String? errorText, int? length}) {
    final int txtlength = length ?? 6;
    emptyErrorText ??= 'Please enter name';
    errorText ??= 'Name should be $txtlength characters or more';
    String? nameValidator(String? value) {
      if (value == null || value.isEmpty) {
        return emptyErrorText;
      }
      if (value.length < txtlength) {
        return errorText;
      }
      return null;
    }

    return nameValidator;
  }

  String? Function(String?) getemailvalidator(
      {String? emptyErrorText, String? errorText, int? length}) {
    final int txtlength = length ?? 6;
    emptyErrorText ??= 'Please enter email id';
    errorText ??= 'Check your email';
    String? emailvalidator(String? value) {
      if (value == null || value.isEmpty) {
        return emptyErrorText;
      } else if (value.length < txtlength &&
          (!value.contains('@') && !value.contains('.'))) {
        return errorText;
      }
      return null;
    }

    return emailvalidator;
  }

  String? Function(String?) getpasswordvalidator(
      {String? emptyErrorText, String? errorText, int? length}) {
    final int txtlength = length ?? 6;
    emptyErrorText ??= 'Please enter Password';
    errorText ??= 'Password should be $txtlength characters or more';

    String? passwordvalidator(String? value) {
      if (value == null || value.isEmpty) {
        return emptyErrorText;
      }
      if (value.length < txtlength) {
        return errorText;
      }
      return null;
    }

    return passwordvalidator;
  }

  String? Function(String?) getphonevalidator(
      {String? emptyErrorText, String? errorText, int? length}) {
    final int txtlength = length ?? 6;
    emptyErrorText ??= 'Please enter phone number';
    errorText ??= 'Enter your $txtlength digit phone number';
    String? phonevalidator(String? value) {
      if (value == null || value.isEmpty) {
        return emptyErrorText;
      } else if (value.length < txtlength) {
        return errorText;
      }
      return null;
    }

    return phonevalidator;
  }

  String? Function(String?) gettextvalidator(
      {String? emptyErrorText, String? errorText, int? length, String? value}) {
    final int txtlength = length ?? 6;
    final String valuename = value ?? 'value';
    emptyErrorText ??= 'Please enter $valuename';
    errorText ??= '$valuename should be $txtlength characters or more';
    String? textvalidator(String? value) {
      if (value == null || value.isEmpty) {
        return emptyErrorText;
      }
      if (value.length < txtlength) {
        return errorText;
      }
      return null;
    }

    return textvalidator;
  }

  String? Function(String?) getnumbervalidator(
      {String? emptyErrorText, String? errorText, int? length, String? value}) {
    final int txtlength = length ?? 6;
    final String valuename = value ?? 'value';
    emptyErrorText ??= 'Please enter $valuename';
    errorText ??= '$valuename should be $txtlength characters or more';
    String? numbervalidator(String? value) {
      if (value == null || value.isEmpty) {
        return emptyErrorText;
      }
      if (value.length < txtlength) {
        return errorText;
      }
      if (int.tryParse(value) == null) {
        return 'Value should be a number';
      }
      return null;
    }

    return numbervalidator;
  }
}
