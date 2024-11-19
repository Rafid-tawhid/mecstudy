import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:mecstudygroup/university_details/expanded_text.dart';
import 'package:provider/provider.dart';

import '../../Model/top_countries_model.dart';
import '../../providers/home_provider.dart';
import 'gridview.dart';

class DestinationBottomSheet extends StatelessWidget {

  final TopCountriesModel countriesModel;


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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Westerkerk_Amsterdam.jpg/220px-Westerkerk_Amsterdam.jpg',
                            width: double.infinity, // Set your width here
                            height: 180, // Set your height here
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child; // If the image is loaded, show it
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
                          information: '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''),
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
                              childAspectRatio: 1.6, // Width to height ratio of each grid item
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return GridItem(
                                icon: item['icon'],
                                title: item['title'],
                                rate: item['rate'],
                              );
                            },
                          ),
                        ),
                      ),
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
                            itemCount: subjects.length,
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
                                child: Text(subjects[index]??'',style: customText(14, Colors.black, FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              height: 180,
                              child: HorizontalListView(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
      padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                    width: 70,
                    height: 70,
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