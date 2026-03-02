import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

class ErrorCell extends StatelessWidget implements Cell {
  const ErrorCell({
    super.key,
    required this.getters,
  });

  final List<num?> Function() getters; // Function returning a List<num?>

  @override
  Widget build(BuildContext context) {
    // Get all values from the function
    List<num?> values = getters();

    // Check for null values
    int nullCount = values.where((value) => value == null).length;

    // Find errors (percentage total is not 100%)
    int under100Count =
        values.where((value) => value != null && value < 100.0).length;
    int over100Count =
        values.where((value) => value != null && value > 100.0).length;

    bool hasNullError = nullCount > 0;
    bool hasUnderError = under100Count > 0;
    bool hasOverError = over100Count > 0;
    bool hasError = hasNullError || hasUnderError || hasOverError;

    // If no errors, return an invisible widget
    if (!hasError) {
      return SizedBox.shrink(); // Makes the widget disappear
    }

    // Error messages
    String errorMessage = "";

    // Scenario 1: Null values
    if (hasNullError) {
      if (nullCount == 1) {
        errorMessage = "Varoitus! Prosenttien kokonaissumma on alle 100%";
      } else {
        errorMessage =
            "Varoitus! $nullCount prosenttien kokonaissumma on alle 100%";
      }
    }

    // Scenario 2: Under 100 errors (but no nulls)
    if (hasUnderError && !hasNullError) {
      errorMessage = (under100Count == 1)
          ? "Varoitus! Prosenttien kokonaissumma on alle 100%"
          : "Varoitus! $under100Count prosenttien kokonaissumma on alle 100%";
    }

    // Scenario 3: Over 100 errors (but no nulls)
    if (hasOverError && !hasNullError) {
      errorMessage = (over100Count == 1)
          ? "Varoitus! Prosenttien kokonaissumma on yli 100%!"
          : "Varoitus! $over100Count prosenttien kokonaissumma on yli 100%!";
    }

    // Scenario 4: Both null and under 100 errors
    if (hasNullError && hasUnderError) {
      errorMessage =
          "Varoitus! ${under100Count + nullCount} prosenttien kokonaissumma on alle 100%.";
    }

    // Scenario 5: Both null and over 100 errors
    if (hasNullError && hasOverError) {
      errorMessage =
          "Varoitus! $nullCount prosenttien kokonaissumma on alle 100% ja $over100Count kokonaissummaa on yli 100%.";
    }

    // Scenario 6: Null, under 100, and over 100 errors
    if (hasNullError && hasUnderError && hasOverError) {
      errorMessage =
          "Varoitus! ${under100Count + nullCount} prosenttien kokonaissumma on alle 100% ja $over100Count kokonaissummaa on yli 100%.";
    }

    // Scenario 7: Both under 100 and over 100 errors (but no nulls)
    if (hasUnderError && hasOverError && !hasNullError) {
      errorMessage =
          "$under100Count prosenttien kokonaissumma on alle 100% ja $over100Count kokonaissummaa on yli 100%.";
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: Center(
        child: Text(
          errorMessage,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
