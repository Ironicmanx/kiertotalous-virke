import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

class MenuCell<T> extends StatefulWidget implements Cell {
  const MenuCell({
    super.key,
    required this.initialValue,
    required this.items,
    required this.setter,
  });

  final T? initialValue;
  final List<DropdownMenuItem<T?>> items;
  final Function(T?) setter;

  @override
  State<MenuCell<T>> createState() => _MenuCellState<T>();
}

class _MenuCellState<T> extends State<MenuCell<T>> {
  late T? currentValue = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        border: Border.all(width: 1),
      ),
      child: DropdownButton<T?>(
        value: currentValue,
        items: widget.items,
        padding: EdgeInsets.symmetric(horizontal: 4),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 15,
        ),
        onChanged: (T? value) {
          widget.setter(value);
          setState(() => currentValue = value);
        },
      ),
    );
  }
}
