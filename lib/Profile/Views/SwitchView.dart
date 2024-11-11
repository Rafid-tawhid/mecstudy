import 'package:flutter/material.dart';
import '../../Utilities/Constant.dart';

class SwitchWithLabel extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final double height;
  final double width;

  const SwitchWithLabel(
      {super.key,
      required this.label,
      this.value = false,
      this.onChanged,
      required this.height,
      required this.width});

  @override
  _SwitchWithLabelState createState() => _SwitchWithLabelState();
}

class _SwitchWithLabelState extends State<SwitchWithLabel> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Responsive.width(widget.width, context),
        height: Responsive.height(widget.height, context),
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              // Shadow color
              spreadRadius: 2,
              // Spread radius
              blurRadius: 4,
              // Blur radius
              offset: Offset(0, 1), // Offset in the y direction
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.label,
                style:  TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 14),
                    color: Colors.black,
                    // color: Color(0xFF151C18),
                    // fo
                )),
            Switch(
              value: _value,
              activeColor: Color(0xFFFB7803),
              onChanged: (bool newValue) {
                setState(() {
                  _value = newValue;
                });
                widget.onChanged?.call(newValue);
              },
            ),
          ],
        ));
  }
}
