import 'package:flutter/material.dart';

class SelectableButtonList extends StatefulWidget {
  final List<String>? buttonLabels;

  const SelectableButtonList({Key? key, this.buttonLabels}) : super(key: key);

  @override
  _SelectableButtonListState createState() => _SelectableButtonListState();
}

class _SelectableButtonListState extends State<SelectableButtonList> {
  int _selectedIndex = 0;

  // Default labels if none are provided
  final List<String> defaultButtonLabels = ["About", "Scholarships", "Requirements"];

  @override
  Widget build(BuildContext context) {
    // Use provided labels or fallback to default
    final buttonLabels = widget.buttonLabels ?? defaultButtonLabels;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(buttonLabels.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == index
                        ? Colors.white
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Text(
                    buttonLabels[index],
                    style: TextStyle(
                      color: _selectedIndex == index
                          ? Colors.black
                          : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

