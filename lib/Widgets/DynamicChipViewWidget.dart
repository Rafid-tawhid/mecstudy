import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';


class ChipViewData{

  late String title;
 // late Icon icon;
  ChipViewData({required this.title,});
  List<ChipViewData> sampleData(){
    return [ChipViewData(title: "abc"),ChipViewData(title: "xyd",),];
  }
}

///class ChipViewWidget extends StatelessWidget {

class ChipViewWidget extends StatefulWidget {
  late List<String> items;
  final void Function(String) onClick;
  ChipViewWidget({super.key, required this.items,required this.onClick});

  @override
  _ChipViewWidgetState createState() => _ChipViewWidgetState(items: items, onClick:onClick,);
}

class _ChipViewWidgetState extends State<ChipViewWidget> {
  late List<bool> isSelected;

  late List<String> items;
  final void Function(String) onClick;

  _ChipViewWidgetState({required this.items,required this.onClick});


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = List<bool>.filled(items.length, false);

   }
  @override
  Widget build(BuildContext context) {
    //items = [ChipViewData(title: "abc", icon: Icon(Icons.seven_k)),ChipViewData(title: "xyd", icon: Icon(Icons.seven_k)),];
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          color: Colors.transparent,
        ),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 12.0, // spacing between chips
          runSpacing: 0.0,
          // spacing between rows of chips
          children: List.generate(
              items.length,
                  (index) =>Ink(

                decoration: BoxDecoration(
                 // color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child:ChoiceChip(
                    padding: EdgeInsets.all(8),
                    label: Text(items[index]),
                    selectedColor: AppColors.themeMaincolor.withOpacity(0.6),
                    backgroundColor:Colors.grey.withOpacity(0.1),
                    shadowColor: Colors.black,
                    elevation: 0,
                    labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 12),
                          color: Colors.black,
                        ),
                  onSelected: (bool selected) {
                    setState(() {
                      // Update isSelected list when a chip is selected
                      onClick(items[index]);

                      //print(items[index]);
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  selected: isSelected[index],

                  //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
                ),)
          ),
        ));
    //);
  }



}