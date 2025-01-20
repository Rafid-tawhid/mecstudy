import 'package:flutter/material.dart';

import '../Utilities/Constant.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and Conditions",),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms and Conditions",
              style: customText(24,Colors.orange,FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Welcome to MECstudygroup, your trusted educational consultancy for studying around the world. By engaging our services, you agree to the following terms and conditions. Please read them carefully as they outline your rights, obligations, and the terms under which we operate.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 24),
            _buildSectionTitle("1. Acceptance of Terms"),
            Text(
              "By accessing and using MECstudygroup’s services, you acknowledge that you have read, understood, and agree to be bound by these terms and conditions. If you do not agree, you must refrain from using our services.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("2. Services Provided"),
            Text(
              "MECstudygroup offers consultancy services to assist students with:\n"
                  "• University and program selection\n"
                  "• Application and admission guidance\n\n"
                  "We do not guarantee admission or visa approvals, as these are subject to the policies and decisions of respective universities and government authorities.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("3. Eligibility"),
            Text(
              "You must:\n"
                  "• Be at least 16 years old or have parental/guardian consent.\n"
                  "• Provide accurate and complete information during the consultancy process.\n\n"
                  "Failure to meet these requirements may result in the termination of our services.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("4. Client Responsibilities"),
            Text(
              "You are responsible for:\n"
                  "• Providing all necessary documents and information promptly.\n"
                  "• Ensuring the authenticity of the documents submitted.\n"
                  "• Adhering to application deadlines and fee payment schedules set by universities or visa authorities.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("5. Fees and Payment"),
            Text(
              "• Consultancy fees must be paid as per the agreed schedule.\n"
                  "• Additional costs, such as university application fees, test fees, and visa application fees, are to be borne by the client.\n"
                  "• Fees are non-refundable unless explicitly stated otherwise in the service agreement.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("6. Confidentiality and Data Protection"),
            Text(
              "MECstudygroup values your privacy. All personal information shared with us will be handled in accordance with applicable data protection laws. We will not disclose your information to third parties without your consent unless required by law.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("7. Limitation of Liability"),
            Text(
              "MECstudygroup is not liable for:\n"
                  "• Denial of admission by universities\n"
                  "• Visa rejections\n"
                  "• Delays caused by third parties or unforeseen circumstances\n\n"
                  "Our liability is limited to the extent of the consultancy fees paid to us.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("8. Cancellation and Termination"),
            Text(
              "• Either party may terminate the service agreement with written notice.\n"
                  "• Fees already paid are non-refundable unless otherwise agreed.\n"
                  "• MECstudygroup reserves the right to terminate services if terms are violated.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("9. Intellectual Property"),
            Text(
              "All content, materials, and information provided by MECstudygroup are our intellectual property. Unauthorized use, reproduction, or distribution is prohibited.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("10. Amendments to Terms"),
            Text(
              "MECstudygroup reserves the right to modify these terms and conditions at any time. Changes will be communicated through our official channels and will take effect upon posting.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("11. Governing Law"),
            Text(
              "These terms and conditions are governed by and construed in accordance with the laws of the jurisdiction where MECstudygroup operates.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("12. Contact Us"),
            Text(
              "If you have any questions or concerns regarding these terms, please contact us:\n\n"
                  "MECstudygroup Educational Consultant\n\n"
                  "Email: admissions@mecstudygroup.com",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: customText(20, Colors.orange, FontWeight.bold),
    );
  }
}

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: TermsAndConditionsScreen(),
));
