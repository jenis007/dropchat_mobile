import 'package:intl/intl.dart';

class Validator {
  // Username validation
  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }

    // Check if the username contains '@' symbol
    // if (!value.contains('@')) {
    //   return "Username must contain '@'";
    // }

    // Optional: Check for a minimum length requirement
    if (value.length < 5) {
      return "Username must be at least 5 characters long";
    }

    // Optional: Check for a maximum length requirement
    if (value.length > 20) {
      return "Username must be less than 20 characters";
    }

    return null; // Return null if valid
  }

  // Email or Phone validation (either one is valid)
  static String? emailOrPhoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    // Phone number validation pattern (international and local)
    final phonePattern = r"^\+?[1-9]\d{1,14}$"; // E.164 international format

    // Check if it's a valid phone number
    if (!RegExp(phonePattern).hasMatch(value)) {
      return "Please enter a valid phone number";
    }

    return null; // Return null if valid
  }

  // Password validation
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    // Password length check
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }

    return null; // Return null if valid
  }

  // Confirm Password validation (match with the password)
  static String? confirmPasswordValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    }

    if (value != password) {
      return "Passwords do not match";
    }

    return null; // Return null if valid
  }

  static String? birthDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Birthdate is required";
    }

    // Try to parse the input as a valid date in the format "dd MMM yyyy"
    try {
      DateTime birthDate = DateFormat('dd MMM yyyy').parseStrict(value);

      // Get the current date
      DateTime currentDate = DateTime.now();

      // Calculate age
      int age = currentDate.year - birthDate.year;

      // Adjust if birthday hasn't occurred yet this year
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }

      // Check if the user is at least 18 years old
      if (age < 18) {
        return "You must be at least 18 years old";
      }

      return null; // Return null if valid
    } catch (e) {
      return "Please enter a valid birthdate (e.g., 23 Oct 2010)";
    }
  }

  static bool isEmail(String input) {
    // Simple regex to check if input is a valid email
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(input);
  }
}
