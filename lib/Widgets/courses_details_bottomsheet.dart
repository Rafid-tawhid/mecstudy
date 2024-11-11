import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:mecstudygroup/Widgets/see_more_text.dart';
import 'package:mecstudygroup/Widgets/tabbed_buttons.dart';

import '../Model/course_model.dart';
import 'drop_down.dart';


class CoursesScreenBottomSheet extends StatelessWidget {

  final CourseModel singleCourse;


  const CoursesScreenBottomSheet(this.singleCourse, {super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95), // Semi-transparent white
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/Logo.png',height: 60,width: 60,),
                  SizedBox(height: 8,),
                  Text('${singleCourse.coursetitle}',style: customText(20, Colors.black, FontWeight.bold),textAlign: TextAlign.center,),
                  SizedBox(height: 12,),
                  Text(singleCourse.universityname??'',style: customText(20, Colors.black54, FontWeight.w500,),),
                  SizedBox(height: 20,),
                  ExpandableText(text: '${singleCourse.coursetitle}${singleCourse.coursetitle}${singleCourse.coursetitle}${singleCourse.coursetitle}',),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                    ),
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>ListTile(
                        leading: Icon(Icons.money_sharp,color: Colors.orange,),
                        title: Text('GBP 26,000 Per year',style: customText(16, Colors.black, FontWeight.w600),),
                        subtitle: Text('International student tutions fee',style: customText(15, Colors.black, FontWeight.w400),),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Icon(Icons.telegram),
                      SizedBox(width: 8,),
                      Text('Edvoy Express',style: customText(20, Colors.black, FontWeight.w600,),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 12),
                      child: Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '''),
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    child: SelectableButtonList(),
                  ),
                  SizedBox(height: 24,),
                  Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 8,),
                      Text('Upcoming intakes ',style: customText(20, Colors.black, FontWeight.w600,),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                          child: Text('Sept 2025'),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                          child: Text('Sept 2026'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24,),
                  Row(
                    children: [
                      Icon(Icons.library_books),
                      SizedBox(width: 8,),
                      Text('Mode of Study ',style: customText(20, Colors.black, FontWeight.w600,),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                          child: Text('Full Time'),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 24,),
                  Row(
                    children: [
                      Icon(Icons.book_sharp),
                      SizedBox(width: 8,),
                      Text('Modules ',style: customText(20, Colors.black, FontWeight.w600,),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomDropdown(),
                  SizedBox(height: 100,)
                ],
              ),
            ),
        );
      },
    );
  }
}
