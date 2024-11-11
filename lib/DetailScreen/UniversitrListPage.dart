
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Model/university_model.dart';
import '../../Utilities/Constant.dart';


class UniversityListPage extends StatefulWidget {
  List<UniversityModel> universities;
  UniversityListPage({super.key, required this.universities});
  @override
  State<UniversityListPage> createState() => _UniversityListPageState();
}

class _UniversityListPageState extends State<UniversityListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
        elevation: 0.0,

        flexibleSpace: Container(
          height: Responsive.height(24, context),
          width: Responsive.width(100, context),
          decoration: BoxDecoration(
            // color: Colors.green,
              image: DecorationImage(
                image: AssetImage('images/DashboardTopBarBG.png'),
                fit: BoxFit.fill,
              ),)),

        title: Text("Universities",
            style:  TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
                  color: Colors.white,
                  // fontFamily: 'SORA-BOLD'
                )),
        centerTitle: false,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          SizedBox(),
        ],
        backgroundColor: Colors.transparent,
      ),),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 14, right: 12),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: Responsive.height(90, context),
                width: Responsive.width(100, context),
                //margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  // height: Responsive.height(100, context),
                  // width: Responsive.width(100, context),
                  color:Colors.transparent,
                  //  margin: EdgeInsets.only(left: 0, right: 0),
                  /// padding: EdgeInsets.all(4),
                  // transform: Matrix4.translationValues(0.0, -0, 0.0),
                  child: ListView.builder(
                      itemCount: widget.universities.length,
                      //physics: NeverScrollableScrollPhysics(),
                      // itemCount: trendingSubjects.length,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            height: Responsive.height(12, context),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: InkWell(
                              child:Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 12,),
                                      Image.asset(
                                        'images/DetailPageLogo.png',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(width: 12,),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: Responsive.width(70, context),
                                            child: Text("${widget.universities[index].universityname}",
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize:
                                                      AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                                      color: Color(0xff38332F),
                                                    )),
                                          ),
                                          SizedBox(height: 8,),
                                          SizedBox(
                                              width: Responsive.width(70, context),
                                              child:
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(widget.universities[index].country??'',
                                                      textAlign: TextAlign.left,
                                                      style:  TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize:
                                                            AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                            color: Color(0xff484D54),
                                                          )),
                                                  Spacer(),

                                                ],
                                              )),
                                        ],
                                      ),
                                      SizedBox(width: 12,),
                                    ],
                                  ),
                                  Spacer(),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ],
                              ),
                              // Center(
                              //   child:
                              // ),
                              onTap: () {
                                // print("filter list click");
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => UniversityDetailScreen(
                                //       universityDetialModel: widget.universities[index],
                                //       rankings:  AppConstant.listedRanking[index],
                                //       facilties: AppConstant.listedFacilities[index],
                                //       alumus: AppConstant.listedAlumnus[index],
                                //       faqs: AppConstant.listedFaq[index],
                                //     ),
                                //   ),
                                // );
                              },

                              //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
                            ),
                          );
                        //);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
