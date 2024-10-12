// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// //
// // import '../Utilities/Colors.dart';
// // import '../Utilities/Constant.dart';
// // //
// // // void main() {
// // //   runApp(MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: ChatScreen(),
// // //     );
// // //   }
// // // }
// //
// // class ChatScreen extends StatefulWidget {
// //   @override
// //   _ChatScreenState createState() => _ChatScreenState();
// // }
// //
// // class _ChatScreenState extends State<ChatScreen> {
// //   final TextEditingController _controller = TextEditingController();
// //   final List<ChatMessage> _messages = <ChatMessage>[];
// //
// //   void _handleSubmitted(String text) {
// //     _controller.clear();
// //
// //     // Add user message to the chat
// //     ChatMessage message = ChatMessage(
// //       text: text,
// //       isUser: true,
// //     );
// //     setState(() {
// //       _messages.insert(0, message);
// //     });
// //
// //     // Simulate a bot response (you would replace this with actual bot logic)
// //     _handleBotResponse(text);
// //   }
// //
// //   void _handleBotResponse(String userMessage) {
// //     // Simulate a bot response (replace with your bot logic)
// //     // For simplicity, just echoing the user's message
// //     String botResponse = 'Bot: $userMessage';
// //
// //     // Add bot response to the chat
// //     ChatMessage message = ChatMessage(
// //       text: botResponse,
// //       isUser: false,
// //     );
// //     setState(() {
// //       _messages.insert(0, message);
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(140.0),
// //         child: AppBar(
// //           leading: SizedBox(width: 0,),
// //
// //           elevation: 0.0,
// //           backgroundColor: Colors.transparent,
// //           //t
// //           flexibleSpace: Container(
// //               height: Responsive.height(25, context),
// //               width: Responsive.width(100, context),
// //               decoration: BoxDecoration(
// //                 // color: Colors.green,
// //
// //                 image: DecorationImage(
// //                   image: AssetImage('images/UniversityDetailTopBG.png'),
// //                   fit: BoxFit.fill,
// //                 ),
// //               ),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   SizedBox(height: 8),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       // SizedBox(
// //                       //   width: 20,
// //                       // ),
// //                       // InkWell(
// //                       //   child: Image.asset(
// //                       //     'images/backArrow.png',
// //                       //     fit: BoxFit.fill,
// //                       //     width: 8,
// //                       //     height: 16,
// //                       //   ),
// //                       //   onTap: () {
// //                       //     Navigator.pop(context);
// //                       //   },
// //                       // ),
// //                       Spacer(),
// //                       Image.asset(
// //                         'images/ChatScreenLogo.png',
// //                         width: 51,
// //                         height: 51,
// //                       ),
// //                       Spacer(),
// //                       // SizedBox(
// //                       //   width: 28,
// //                       // ),
// //                     ],
// //                   ),
// //                   // SizedBox(height: 10),
// //                   Text("MECSTUDYGROUP Bot",
// //                       style: GoogleFonts.roboto(
// //                           textStyle: TextStyle(
// //                             fontWeight: FontWeight.w700,
// //                             fontSize: AdaptiveTextSize()
// //                                 .getadaptiveTextSize(context, 18),
// //                             color: AppColors.white,
// //                             // fontFamily: 'SORA-BOLD'
// //                           ))),
// //                   SizedBox(height: 8),
// //                 ],
// //               )),
// //         ),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           // Container(
// //           //     height: Responsive.height(20, context),
// //           //     width: Responsive.width(100, context),
// //           //     decoration: BoxDecoration(
// //           //       // color: Colors.green,
// //           //
// //           //       // image: DecorationImage(
// //           //       //   image: AssetImage('images/UniversityDetailTopBG.png'),
// //           //       //   fit: BoxFit.fill,
// //           //       // ),
// //           //     ),
// //           //     child: Column(
// //           //       mainAxisAlignment: MainAxisAlignment.center,
// //           //       crossAxisAlignment: CrossAxisAlignment.center,
// //           //       children: [
// //           //      //   SizedBox(height: 8),
// //           //         Row(
// //           //           mainAxisAlignment: MainAxisAlignment.center,
// //           //           crossAxisAlignment: CrossAxisAlignment.center,
// //           //           children: [
// //           //             // SizedBox(
// //           //             //   width: 20,
// //           //             // ),
// //           //             // InkWell(
// //           //             //   child: Image.asset(
// //           //             //     'images/backArrow.png',
// //           //             //     fit: BoxFit.fill,
// //           //             //     width: 8,
// //           //             //     height: 16,
// //           //             //   ),
// //           //             //   onTap: () {
// //           //             //     Navigator.pop(context);
// //           //             //   },
// //           //             // ),
// //           //             Spacer(),
// //           //             Image.asset(
// //           //               'images/ChatScreenLogo.png',
// //           //               width: 51,
// //           //               height: 51,
// //           //             ),
// //           //             Spacer(),
// //           //             // SizedBox(
// //           //             //   width: 28,
// //           //             // ),
// //           //           ],
// //           //         ),
// //           //        // SizedBox(height: 10),
// //           //         Text("MECSTUDYGROUP Bot",
// //           //             style: GoogleFonts.roboto(
// //           //                 textStyle: TextStyle(
// //           //                   fontWeight: FontWeight.w700,
// //           //                   fontSize: AdaptiveTextSize()
// //           //                       .getadaptiveTextSize(context, 18),
// //           //                   color: AppColors.white,
// //           //                   // fontFamily: 'SORA-BOLD'
// //           //                 ))),
// //           //         SizedBox(height: 10),
// //           //         Text("United Kingdom",
// //           //             style: GoogleFonts.roboto(
// //           //                 textStyle: TextStyle(
// //           //                   fontWeight: FontWeight.w500,
// //           //                   fontSize: AdaptiveTextSize()
// //           //                       .getadaptiveTextSize(context, 15),
// //           //                   color: AppColors.white,
// //           //                   // fontFamily: 'SORA-BOLD'
// //           //                 ))),
// //           //       ],
// //           //     )),
// //           Flexible(
// //             child: ListView.builder(
// //               reverse: true,
// //               padding: EdgeInsets.all(8.0),
// //               itemCount: _messages.length,
// //               itemBuilder: (_, int index) => _messages[index],
// //             ),
// //           ),
// //           Divider(height: 1.0),
// //           Container(
// //             decoration: BoxDecoration(color: Theme.of(context).cardColor),
// //             child: _buildTextComposer(),
// //           ),
// //           SizedBox(height: 60,),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTextComposer() {
// //     return IconTheme(
// //       data: IconThemeData(color: Theme.of(context).accentColor),
// //       child: Container(
// //         margin: EdgeInsets.symmetric(horizontal: 8.0),
// //         child: Row(
// //           children: <Widget>[
// //             Flexible(
// //               child: TextField(
// //                 controller: _controller,
// //                 onSubmitted: _handleSubmitted,
// //                 decoration: InputDecoration.collapsed(
// //                   hintText: 'Send a message',
// //                 ),
// //               ),
// //             ),
// //             IconButton(
// //               icon: Icon(Icons.send),
// //               onPressed: () => _handleSubmitted(_controller.text),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class ChatMessage extends StatelessWidget {
// //   final String text;
// //   final bool isUser;
// //
// //   ChatMessage({required this.text, required this.isUser});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 10.0),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: <Widget>[
// //           isUser
// //               ? Container(
// //             margin: const EdgeInsets.only(right: 16.0),
// //             child: CircleAvatar(
// //               child: Text('User'),
// //             ),
// //           )
// //               : Container(),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 isUser
// //                     ? Text('You:')
// //                     : Text('Bot:', style: TextStyle(fontWeight: FontWeight.bold)),
// //                 Container(
// //                   margin: const EdgeInsets.only(top: 5.0),
// //                   child: Text(text),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../Utilities/Colors.dart';
// import '../Utilities/Constant.dart';
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//    TextEditingController _controller = TextEditingController();
//    List<ChatMessage> _messages = <ChatMessage>[];
//    List<String> options = ['Option A', 'Option B', 'Option C'];
//
//   @override
//   void initState() {
//     super.initState();
//     _handleBotResponse('Choose an option:',);
//   }
//
//   void _handleSubmitted(String text) {
//     _controller.clear();
//
//     // Add user message to the chat
//     ChatMessage message = ChatMessage(
//       text: text,
//       isUser: true,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//
//     // Simulate a bot response (you would replace this with actual bot logic)
//     _handleBotResponse(text);
//   }
//
//   void _handleBotResponse(String userMessage) {
//     // Simulate a bot response with options
//     String botResponse = 'Bot: $userMessage\n\nOptions:';
//     for (String option in options) {
//       botResponse += '\n- $option';
//     }
//
//     // Add bot response to the chat
//     ChatMessage message = ChatMessage(
//       text: botResponse,
//       isUser: false,
//       isBotResponse: true,
//       options: options,
//       onOptionSelected: _handleOptionSelected,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }
//
//   void _handleOptionSelected(String option) {
//     _handleSubmitted(option);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//         preferredSize: Size.fromHeight(140.0),
//         child: AppBar(
//           leading: SizedBox(width: 0,),
//
//           elevation: 0.0,
//           backgroundColor: Colors.transparent,
//           //t
//           flexibleSpace: Container(
//               height: Responsive.height(25, context),
//               width: Responsive.width(100, context),
//               decoration: BoxDecoration(
//                 // color: Colors.green,
//
//                 image: DecorationImage(
//                   image: AssetImage('images/UniversityDetailTopBG.png'),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // SizedBox(
//                       //   width: 20,
//                       // ),
//                       // InkWell(
//                       //   child: Image.asset(
//                       //     'images/backArrow.png',
//                       //     fit: BoxFit.fill,
//                       //     width: 8,
//                       //     height: 16,
//                       //   ),
//                       //   onTap: () {
//                       //     Navigator.pop(context);
//                       //   },
//                       // ),
//                       Spacer(),
//                       Image.asset(
//                         'images/ChatScreenLogo.png',
//                         width: 51,
//                         height: 51,
//                       ),
//                       Spacer(),
//                       // SizedBox(
//                       //   width: 28,
//                       // ),
//                     ],
//                   ),
//                   // SizedBox(height: 10),
//                   Text("MECSTUDYGROUP Bot",
//                       style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: AdaptiveTextSize()
//                                 .getadaptiveTextSize(context, 18),
//                             color: AppColors.white,
//                             // fontFamily: 'SORA-BOLD'
//                           ))),
//                   SizedBox(height: 8),
//                 ],
//               )),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             child: ListView.builder(
//               reverse: true,
//               padding: EdgeInsets.all(8.0),
//               itemCount: _messages.length,
//               itemBuilder: (_, int index) => _messages[index],
//             ),
//           ),
//           Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//             child: _buildOptions(),
//           ),
//           SizedBox(height: 40,),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOptions() {
//     return Row(
//       children: <Widget>[
//         Flexible(
//           child: TextField(
//             controller: _controller,
//             onSubmitted: _handleSubmitted,
//             decoration: InputDecoration.collapsed(
//               hintText: 'Type your option',
//             ),
//           ),
//         ),
//         IconButton(
//           icon: Icon(Icons.send),
//           onPressed: () => _handleSubmitted(_controller.text),
//         ),
//       ],
//     );
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   final String text;
//   final bool isUser;
//   final bool isBotResponse;
//   final List<String> options;
//   final Function(String) onOptionSelected;
//
//   ChatMessage({
//     required this.text,
//     required this.isUser,
//     this.isBotResponse = false,
//     this.options = const [],
//     this.onOptionSelected = _defaultOnOptionSelected,
//   });
//
//   static void _defaultOnOptionSelected(String option) {
//     print('Option selected: $option');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Column(
//         crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: <Widget>[
//           if (isUser)
//             Text('You:')
//           else if (isBotResponse)
//             Text('Bot:', style: TextStyle(fontWeight: FontWeight.bold)),
//           if (isBotResponse)
//             Wrap(
//               spacing: 8.0,
//               children: options.map((option) {
//                 return ChoiceChip(
//                   label: Text(option),
//                   onSelected: (selected) {
//                     if (selected) {
//                       onOptionSelected(option);
//                     }
//                   }, selected: true,
//                 );
//               }).toList(),
//             ),
//           Container(
//             margin: const EdgeInsets.only(top: 5.0),
//             child: Text(text),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChatScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utilities/Colors.dart';
import '../Utilities/Constant.dart';



class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> selectedOptions = [];
  List<String> botResponses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          leading: SizedBox(width: 0,),

          elevation: 0.0,
          backgroundColor: Colors.transparent,
          //t
          flexibleSpace: Container(
              height: Responsive.height(25, context),
              width: Responsive.width(100, context),
              decoration: BoxDecoration(
                // color: Colors.green,

                image: DecorationImage(
                  image: AssetImage('images/UniversityDetailTopBG.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // InkWell(
                      //   child: Image.asset(
                      //     'images/backArrow.png',
                      //     fit: BoxFit.fill,
                      //     width: 8,
                      //     height: 16,
                      //   ),
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      Spacer(),
                      Image.asset(
                        'images/ChatScreenLogo.png',
                        width: 51,
                        height: 51,
                      ),
                      Spacer(),
                      // SizedBox(
                      //   width: 28,
                      // ),
                    ],
                  ),
                  // SizedBox(height: 10),
                  Text("MECSTUDYGROUP Bot",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 18),
                            color: AppColors.white,
                            // fontFamily: 'SORA-BOLD'
                          ))),
                  SizedBox(height: 8),
                ],
              )),
        ),
      ),
      body: Column(
        children: [
         // Spacer(),

             Container(
               padding: EdgeInsets.all(8.0),
              // width: Responsive.width(80, context),
               color: Colors.transparent,
               child: Wrap(
                 spacing: 8.0,
                 children: _buildOptionChips(),
               ),
             ),
          Flexible(
            child: ListView.builder(
              itemCount: botResponses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(botResponses[index],style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                        color: Colors.black,
                        // color: Color(0xFF151C18),
                        // fontFamily: 'SORA-BOLD'
                      )),),
                );
              },
            ),
          ),
          //Divider(height: 1.0),

          SizedBox(height: 60,)
        ],
      ),
    );
  }

  List<Widget> _buildOptionChips() {
    List<String> options = ['Undergraduate', 'Postgraduate', 'Doctorate',];
    return options.map((option) {
      return ChoiceChip(
        elevation: 0,
        label: Text(option,style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize:
              AdaptiveTextSize().getadaptiveTextSize(context, 14),
              color: Colors.black,
              // color: Color(0xFF151C18),
              // fontFamily: 'SORA-BOLD'
            )),),
        selected: selectedOptions.contains(option),
        onSelected: (selected) {
          _handleOptionSelected(option, selected);
        },
      );
    }).toList();
  }

  void _handleOptionSelected(String option, bool selected) {
    setState(() {
      if (selected) {
        selectedOptions.add(option);
        _generateBotResponse(option);
      } else {
        selectedOptions.remove(option);
      }
    });
  }

  void _generateBotResponse(String selectedOption) {
    // Simulate a bot response based on the selected option
    String botResponse = 'User: $selectedOption';
    setState(() {
      botResponses.add(botResponse);
    });
  }
}

