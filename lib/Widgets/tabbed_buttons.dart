import 'package:flutter/material.dart';

class SelectableButtonList extends StatefulWidget {
  const SelectableButtonList({super.key});

  @override
  _SelectableButtonListState createState() => _SelectableButtonListState();
}

class _SelectableButtonListState extends State<SelectableButtonList> {
  int _selectedIndex = 0;

  final List<String> buttonLabels = ["About", "Scholarships", "Requirements"];
  final List<String> bottomTexts = [
    "",
    "",
    ""
  ];

  @override
  Widget build(BuildContext context) {
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
                        ? Colors.grey
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
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        // SizedBox(height: 20),
        // Text(
        //   bottomTexts[_selectedIndex],
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }
}
