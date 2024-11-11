
import 'package:flutter/material.dart';
import '../../Utilities/Constant.dart';

import '../Filter/FilterListPage.dart';

class ShortList extends StatefulWidget {
  const ShortList({super.key});

  @override
  State<ShortList> createState() => _ShortListState();
}

class _ShortListState extends State<ShortList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Shortlist",
            style:TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
                  color: Colors.black,
                  // fontFamily: 'SORA-BOLD'
                )),
        centerTitle: false,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          SizedBox(),
        ],
        backgroundColor: Colors.white,
      ),
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
              SizedBox(height: Responsive.height(36, context),),
              Text("You haven't shortlisted any courses for now",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 22),
                        color: Color(0xFF484D54),

                        // fontFamily: 'SORA-BOLD'
                      )),
              Container(
                height: Responsive.height(25, context),
                width: Responsive.width(100, context),
                padding: EdgeInsets.only(left: 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/BookSessionImage.png',),
                    fit: BoxFit.contain,
                  ),
                ),
                child: SizedBox(),
              ),
              InkWell(
                child: Container(
                  height: 65, // Set your desired height
                  width: Responsive.width(80, context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/BookSessionButtonBG.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text('Explore',
                        style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                              AdaptiveTextSize().getadaptiveTextSize(context, 19),
                              color: Colors.white,
                              // color: Color(0xFF151C18),
                              // fontFamily: 'SORA-BOLD'
                            )),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FilterListPage(universities: [],),
                    ),
                  );
                },
              ),

              SizedBox(height: Responsive.height(15, context),),
              SizedBox(
                height: Responsive.height(10, context),
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
