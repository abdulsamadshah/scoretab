import 'package:flutter/material.dart';
import 'package:scoretab/app/data/shared/color.dart';

class FilterChipWidget extends StatefulWidget {
  final String chipName;
  bool isSelected;
  bool shouldUnSelect;
  double? width;
  void Function(bool) onSelected;
  FilterChipWidget(
      {Key? key,
      required this.chipName,
      required this.onSelected,
      required this.shouldUnSelect,
      this.width,
      this.isSelected = false})
      : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<FilterChipWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomChip(
      text: widget.chipName,
      width: widget.width,
      isSelected: widget.isSelected,
      shouldUnSelect: widget.shouldUnSelect,
      onSelected: (isSelected) {
        setState(() {
          widget.isSelected = isSelected;
        });
        widget.onSelected(widget.isSelected);
      },
    );
  }
}

class CustomChip extends StatefulWidget {
  final Color? disabledColor;
  final Color? selectedColor;
  bool isSelected;
  void Function(bool) onSelected;
  final String? text;
  bool shouldUnSelect;
  final double? width;

  CustomChip(
      {this.disabledColor,
      this.selectedColor,
      required this.shouldUnSelect,
      this.width,
      this.isSelected = false,
      required this.onSelected,
      this.text});

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.shouldUnSelect) {
          if (!widget.isSelected) {
            widget.isSelected = !widget.isSelected;
            widget.onSelected(widget.isSelected);
          }
        } else {
          widget.isSelected = !widget.isSelected;
          widget.onSelected(widget.isSelected);
        }
      },
      child: Container(
        width: widget.width,
        alignment: Alignment.center,
        padding:
            const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            gradient: widget.isSelected
                ? LinearGradient(
                    stops: const [0.2, 0.6],
                    colors: [
                      FixedColors.orange,
                      FixedColors.green
                      // Colors.orange,
                      // Color(0xFF90c03e),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  )
                : null,
            border: Border.all(color: Colors.grey),
            color: !widget.isSelected ? const Color(0xfff6f6f6) : null,
            borderRadius: BorderRadius.circular(25.0)),
        child: Text(
          widget.text ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
      // )
    );
  }
}
