import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mecstudygroup/BookSession/widgets/buttons.dart';
import 'package:mecstudygroup/Chat/ChatScreen.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/university_details/expanded_text.dart';
import 'package:provider/provider.dart';

import '../../Model/destination_info_model.dart';
import '../../Model/top_countries_model.dart';
import '../../courses/see_all_course_screen.dart';
import '../../providers/home_provider.dart';
import 'gridview.dart';

class DestinationBottomSheet extends StatelessWidget {

  final DestinationInfoModel countriesModel;


  DestinationBottomSheet(this.countriesModel, {super.key});

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
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 4,
                alignment: Alignment.center,
                width: 28,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(countriesModel.name??'',style: customText(18, Colors.black, FontWeight.w700),),
              SizedBox(height: 30,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UniversityInformation(countriesModel),
                      TrendingSubjectSection(countriesModel),
                       BasicRequirementSection(countriesModel),
                      // CityStudySection(countriesModel),
                    ],
                  ),
                ),
              ),
              BottomButtonSection()
            ],
          ),
        );
      },
    );
  }
}

class BottomButtonSection extends StatelessWidget {
  const BottomButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey.shade200,
        ),
        Row(
          children: [
            SizedBox(width: 20,),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: GestureDetector(
            //     onTap: (){
            //       Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>ChatScreen()));
            //     },
            //     child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           shape: BoxShape.circle
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Icon(Icons.message,color: Colors.grey,),
            //         )),
            //   ),
            // ),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: GradientButton(text: 'View All Courses', onPressed: (){
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>SeeAllCourseScreen()));
              },verticalPadding: 10,),
            )),
            SizedBox(width: 20,)
          ],
        ),
      ],
    );
  }
}

class CityStudySection extends StatelessWidget {
  const CityStudySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_city,
                  size: 22,
                  color: Colors.black,
                ),
              ),
              Expanded(
                  child: Text(
                    'Cities to Study',
                    style: customText(16, Colors.black, FontWeight.w500),
                  )),

            ],
          ),
          SizedBox(
            height: 200,
            child: HorizontalListView(),
          )
        ],
      ),
    );
  }
}

class BasicRequirementSection extends StatelessWidget {
  final DestinationInfoModel destinationInfoModel;


  BasicRequirementSection(this.destinationInfoModel);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 12),child: Column(
      children: [
        Html(data: destinationInfoModel.basicRequirements),
        Html(data: destinationInfoModel.studentVisa),
      ],
    ),);
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Country Guide',
              style: customText(16, Colors.black, FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 8),
                  child: Row(
                    children: [
                      SizedBox(width: 12,),
                      Icon(Icons.star_border,color: Colors.red,),
                      SizedBox(width: 12,),
                      Expanded(child: Text('General Information')),
                      Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Colors.grey,),
                      SizedBox(width: 8,)
                    ],
                  ),
                ),
                Container(color: Colors.grey.shade100,height: 1,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 8),
                  child: Row(
                    children: [
                      SizedBox(width: 12,),
                      Icon(Icons.star_border,color: Colors.red,),
                      SizedBox(width: 12,),
                      Expanded(child: Text('General Information')),
                      Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Colors.grey,),
                      SizedBox(width: 8,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class TrendingSubjectSection extends StatelessWidget {
  final DestinationInfoModel destinationInfoModel;
  const TrendingSubjectSection(this.destinationInfoModel, {super.key});


  @override
  Widget build(BuildContext context) {
    List<String> itemList = destinationInfoModel.popularPrograms!
        .replaceAll('[', '') // Remove the opening bracket
        .replaceAll(']', '') // Remove the closing bracket
        .split(',') // Split by commas
        .map((item) => item.trim()) // Trim any extra whitespace
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.menu_book_sharp,
                  size: 22,
                  color: Colors.black,
                ),
              ),
              Expanded(
                  child: Text(
                    'Trending Subjects',
                    style: customText(16, Colors.black, FontWeight.w500),
                  )),

            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: itemList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      // BoxShadow(
                      //   color: Colors.grey.withOpacity(0.3),
                      //   spreadRadius: 1,
                      //   blurRadius: 4,
                      //   offset: Offset(0, 1), // Shadow position
                      // ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 16.0),
                  child: Text(itemList[index]??'',style: customText(14, Colors.black, FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Html(data: destinationInfoModel.bestUniversities),
        )
      ],
    );
  }
}

class UniversityInformation extends StatelessWidget {

  final DestinationInfoModel destinationInfoModel;
  UniversityInformation(this.destinationInfoModel);

  @override
  Widget build(BuildContext context) {
    List<String> itemList=[];
    if (destinationInfoModel.studyLevels!=null){
      itemList = destinationInfoModel.studyLevels!
          .replaceAll('[', '') // Remove the opening bracket
          .replaceAll(']', '') // Remove the closing bracket
          .split(',') // Split by commas
          .map((item) => item.trim()) // Trim any extra whitespace
          .toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              destinationInfoModel.bannerImage??'',
              width: double.infinity, // Set your width here
              height: 180, // Set your height here
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return Image.network(destinationInfoModel.bannerImage??''); // If the image is loaded, show it
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Image.network(
                  'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dW5pdmVyc2l0eXxlbnwwfHwwfHx8MA%3D%3D', // Placeholder image asset
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ExpendedText(
            bgColor: Colors.white.withOpacity(0.2),
            information: destinationInfoModel.description??''),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Text('Study Level',style: customText(16, Colors.black, FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items in a row
                crossAxisSpacing: 8, // Horizontal spacing between items
                mainAxisSpacing: 8, // Vertical spacing between items
                childAspectRatio: 2, // Width to height ratio of each grid item
              ),
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                return GridItem(
                  icon: items[index]['icon'],
                  title: item,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('Accept English Test',style: customText(18, Colors.black, FontWeight.bold),),
        ),
        SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: destinationInfoModel.acceptedEnglishTest!.replaceAll('[', ' ').replaceAll(']', '').split(',').map((test) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 4.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Icon(Icons.circle,size: 10,),
                   SizedBox(width: 8,),
                   Text(
                     test,
                     style: customText(16, Colors.black, FontWeight.w500),
                   ),
                 ],
               ),
             );
           }).toList(),
         ),
         // child: Text(destinationInfoModel.acceptedEnglishTest??'',style: customText(16, Colors.black, FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Html(data: destinationInfoModel.bestUniversities),
        ),
        SizedBox(height: 12,),
      ],
    );
  }
}


class HorizontalListView extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"image": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Westerkerk_Amsterdam.jpg/220px-Westerkerk_Amsterdam.jpg", "name": "John"},
    {"image": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Westerkerk_Amsterdam.jpg/220px-Westerkerk_Amsterdam.jpg", "name": "Emma"},
    {"image": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Westerkerk_Amsterdam.jpg/220px-Westerkerk_Amsterdam.jpg", "name": "Sophia"},
    {"image": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Westerkerk_Amsterdam.jpg/220px-Westerkerk_Amsterdam.jpg", "name": "Michael"},
    {"image": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Westerkerk_Amsterdam.jpg/220px-Westerkerk_Amsterdam.jpg", "name": "Olivia"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.network(
                    item['image']!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item['name']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}