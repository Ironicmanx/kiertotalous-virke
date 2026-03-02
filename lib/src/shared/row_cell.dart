import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

class RowCell extends StatelessWidget implements Cell {
  const RowCell({
    super.key,
    this.initialValue,
    this.checkbox = false,
    this.checkboxTitle,
    this.checkboxSetter,
    this.checkboxValue,
    this.iconButton,
    this.centerText = false,
  });

  final dynamic initialValue;
  final bool checkbox;
  final String? checkboxTitle;
  final Function? checkboxSetter;
  final bool? checkboxValue;
  final Widget? iconButton;
  final bool centerText;

  @override
  Widget build(BuildContext context) {
    final bool hasText =
        initialValue != null && initialValue.toString().isNotEmpty;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: hasText ? BoxDecoration(border: Border.all(width: 1)) : null,
      child: Padding(
        // Remove left padding when there's no text
        padding: EdgeInsets.only(left: hasText ? 4.0 : 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (hasText)
              Expanded(
                child: Align(
                  alignment:
                      centerText ? Alignment.center : Alignment.centerLeft,
                  child: Text(initialValue?.toString() ?? ""),
                ),
              ),
            if (checkbox)
              hasText
                  ? _buildCheckboxWidget()
                  : Expanded(
                      child: Container(
                        margin: EdgeInsets.zero, // Ensure no extra margin
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEAEA),
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: Center(
                          // Center checkbox horizontally
                          child: _buildCheckboxContent(),
                        ),
                      ),
                    ),
            if (iconButton != null) iconButton!,
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxWidget() {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEAEAEA),
          border: Border.all(width: 1, color: Colors.black),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: _buildCheckboxContent(),
      ),
    );
  }

  Widget _buildCheckboxContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (checkboxTitle != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(checkboxTitle!),
          ),
        Checkbox(
          value: checkboxValue ?? false,
          onChanged: (bool? newValue) => checkboxSetter?.call(newValue),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}
