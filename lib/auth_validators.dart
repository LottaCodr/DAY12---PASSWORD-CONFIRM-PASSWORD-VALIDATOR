class AuthValidators {
  //creating error messages to send in 9 steps
  //#1

  static const String emailErrMsg =
      "Invalid Email Address, Kindly provide a valid email";
  static const String passwordErrMsg =
      "Password must have atleast 6 characters";
  static const String confirmPasswordErrMsg = "Two passwords dont match";

  //A simple email validator that checks presence and position of @
  //#2
  String? emailValidator(String? val) {
    final String email = val as String;

    //checking if length of email is <=3 then its invalid
    //#3
    if (email.length <= 3) return emailErrMsg;

    //checking if it has @
    //#4
    final hasAtSymbol = email.contains('@');

    //find position of @
    //#5
    final indexOfAt = email.indexOf('@');

    //checking numbers of @
    //#6
    final numberOfAt = "@".allMatches(email).length;

    //cross checking valid if has @
    //7
    if (!hasAtSymbol) return emailErrMsg;

    //and if number of @ is only 1
    //#8
    if (numberOfAt != 1) return emailErrMsg;

    //ad if '@' is not the first or last character
    //#9
    if (indexOfAt == 0 || indexOfAt == email.length - 1) return emailErrMsg;

    //if not, then its valid
    return null;
  }

  //password Validator
  String? passwordValidator(String? val) {
    final String password = val as String;

    if (password.isEmpty || password.length <= 5) return passwordErrMsg;
    return null;
  }

  //confirm password validator
  String? confirmPassValidator(String? val, firstPasswordInpTxt) {
    final String firstPassword = firstPasswordInpTxt;
    final String secondPassword = val as String;

    //if either of the password field is empty
    //or if their length doest match, then no need to compare their content

    if (firstPassword.isEmpty ||
        secondPassword.isEmpty ||
        firstPassword.length != secondPassword.length) {
      return confirmPasswordErrMsg;
    }

    // if the 2 passwords do not match then send error message
    if (firstPassword != secondPassword) return confirmPasswordErrMsg;
    return null;
  }
}
