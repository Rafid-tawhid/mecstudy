import 'package:flutter/material.dart';
// import 'package:googleapis/securitycenter/v1.dart' as cal;
import 'package:mecstudygroup/Profile/SettingScreen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DocumentsUpload.dart';
import 'GiveuoFeedback.dart';
import 'ShortList.dart';


class ListViewData{

  late String title;
  late Icon icon;
  void onTap;
  ListViewData({required this.title,required this.icon,this.onTap});
   List<ListViewData> sampleData(){
    return [ListViewData(title: "abc", icon: Icon(Icons.seven_k)),ListViewData(title: "xyd", icon: Icon(Icons.seven_k)),];
  }
}

class ListViewWidget extends StatelessWidget {
  List<ListViewData> items;
  //GestureTapCallback onClick;
  ListViewWidget({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    //items = [ListViewData(title: "abc", icon: Icon(Icons.seven_k)),ListViewData(title: "xyd", icon: Icon(Icons.seven_k)),];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: items.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
            //  height: Responsive.height(6, context),
              padding: EdgeInsets.only(top: 8,bottom: 0),


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                  children:[
                  //  Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 12,),
                        items[index].icon,
                        SizedBox(width: 16,),
                        Text(items[index].title),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.black.withOpacity(0.6),size: 16,),
                        SizedBox(width: 16,),

                      ],
                    ),
                    SizedBox(height: 4,),
                  index == items.length -1? SizedBox():  Divider(height: 1.0,color: Colors.black.withOpacity(0.6),),
                  //  Spacer(),
                  ]
              ),
            ),

            onTap: (){
              print(items[index].title);
              if(items[index].title == "Documents"){
                print("docuemnt");
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DocumentsUpload(),
                    ));
              }
              else if(items[index].title == "ShortList" ){

                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ShortList(),
                    ));
                print("Shortlist");
              } else if(items[index].title == "Give us feedback" ){

                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GiveusFeedback(),
                    ));
                print("Shortlist");
              }
              else if(items[index].title == "Setting" ){

                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SettingScreen(),
                    ));
                print("Shortlist");
              }
              else if(items[index].title == "Terms Of Service" ) {
                _launchURL();
              }
              else if(items[index].title == "Privacy Policy" ) {
                _launchURL();
              } else{
                print("not contain any title");
              }

            },
          );
        },
      ));
    //);
  }
  _launchURL() async {
    const url = 'https://mecstudygroup.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}