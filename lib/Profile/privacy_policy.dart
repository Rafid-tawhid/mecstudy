import 'package:flutter/material.dart';

import '../Utilities/Constant.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "We MECSTUDYGROUP value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and share information when you use our website and app, which is designed to provide admission information and consult students interested in studying abroad.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 24),
            _buildSectionTitle("Information Collection"),
            Text(
              "We collect the following types of information:\n"
                  "• Personal Information: Information you provide when creating an account or expressing interest, such as your name, email address, phone number, educational background, and preferred study destinations.\n"
                  "• Usage Data: Information about how you use the app, including features you use, pages visited, and the time spent on the app.\n"
                  "• Device Information: Information about the device you use to access our app, such as device type, operating system, and unique device identifiers.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Use of Information"),
            Text(
              "We use the collected information to:\n"
                  "• Provide and improve our services.\n"
                  "• Match you with suitable study programs and opportunities.\n"
                  "• Personalize user experience.\n"
                  "• Communicate with you, including sending updates, newsletters, and notifications.\n"
                  "• Respond to your inquiries and provide customer support.\n"
                  "• Conduct analytics to understand how our services are used and improve user experience.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Sharing of Information"),
            Text(
              "We do not share your personal information with third parties except:\n"
                  "• With your consent.\n"
                  "• For processing by third-party service providers who assist us in our operations (e.g., cloud storage providers, communication platforms).\n"
                  "• With educational institutions and partners to provide you with relevant information and opportunities.\n"
                  "• When required by law or to protect our legal rights.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Data Retention"),
            Text(
              "We retain your personal information only as long as necessary to fulfil the purposes for which it was collected or as required by law.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Security Measures"),
            Text(
              "We implement reasonable security measures to protect your information from unauthorized access, alteration, or disclosure. These measures include encryption, access controls, and regular security assessments.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("User Rights"),
            Text(
              "You have the right to:\n"
                  "• Access your personal information.\n"
                  "• Request corrections to your personal information.\n"
                  "• Request deletion of your personal information.\n"
                  "• Opt-out of receiving marketing communications.\n"
                  "• Withdraw consent at any time when we rely on your consent to process your personal information.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Third-Party Services"),
            Text(
              "Our app may contain links to third-party websites or services that are not owned or controlled by us. We are not responsible for the privacy practices of these third parties. We encourage you to review their privacy policies.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Changes to the Privacy Policy"),
            Text(
              "We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the 'Last Updated' date at the top.",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Contact Information"),
            Text(
              "If you have any questions or concerns about this Privacy Policy, please contact us at:\n\n"
                  "Email: admissions@mecstudygroup.com",
              style: customText(16, Colors.black, FontWeight.normal),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Compliance with Google Play Policies"),
            Text(
              "Our app complies with Google Play’s Developer Program Policies, including policies on data collection, use, and sharing. We adhere to best practices for user data protection and transparency.",
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
      style: customText(18, Colors.orange, FontWeight.bold),
    );
  }
}

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: PrivacyPolicyScreen(),
));
