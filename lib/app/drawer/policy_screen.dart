import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: h * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _buildBackgroundCircles(w, h),
          SingleChildScrollView(
            padding: EdgeInsets.all(w * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFadeInUpSectionTitle("Introduction", h),
                _buildFadeInUpSectionContent(
                    "Welcome to our chat application. Your privacy is important to us, and we are committed to protecting it. This policy explains how we collect, use, and disclose information about you.",
                    h),
                SizedBox(height: h * 0.03),
                _buildFadeInUpSectionTitle("Data Collection", h),
                _buildFadeInUpSectionContent(
                    "We collect information to provide better services to our users. The types of information we collect include personal information, usage data, and communication content.",
                    h),
                SizedBox(height: h * 0.03),
                _buildFadeInUpSectionTitle("Data Usage", h),
                _buildFadeInUpSectionContent(
                    "The data we collect is used to improve our services, personalize your experience, and communicate with you. We do not share your personal information with third parties without your consent, except as required by law.",
                    h),
                SizedBox(height: h * 0.03),
                _buildFadeInUpSectionTitle("Security", h),
                _buildFadeInUpSectionContent(
                    "We implement a variety of security measures to maintain the safety of your personal information. However, no method of transmission over the Internet, or method of electronic storage, is 100% secure.",
                    h),
                SizedBox(height: h * 0.03),
                _buildFadeInUpSectionTitle("Changes to This Policy", h),
                _buildFadeInUpSectionContent(
                    "We may update our privacy policy from time to time. We will notify you of any changes by posting the new policy on this page.",
                    h),
                SizedBox(height: h * 0.05),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.3,
                        vertical: h * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "Back to Home",
                      style: TextStyle(fontSize: h * 0.02, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFadeInUpSectionTitle(String title, double h) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      tween: Tween<Offset>(begin: Offset(0, 0.5), end: Offset(0, 0)),
      curve: Curves.easeOut,
      builder: (context, Offset offset, child) {
        return Transform.translate(
          offset: offset,
          child: Opacity(
            opacity: 1 - offset.dy,
            child: child,
          ),
        );
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: h * 0.025,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildFadeInUpSectionContent(String content, double h) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      tween: Tween<Offset>(begin: Offset(0, 0.5), end: Offset(0, 0)),
      curve: Curves.easeOut,
      builder: (context, Offset offset, child) {
        return Transform.translate(
          offset: offset,
          child: Opacity(
            opacity: 1 - offset.dy,
            child: child,
          ),
        );
      },
      child: Text(
        content,
        style: TextStyle(
          fontSize: h * 0.02,
          color: Colors.black87,
          height: 1.6,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildBackgroundCircles(double w, double h) {
    return Stack(
      children: [
        Positioned(
          top: -h * 0.15,
          left: -w * 0.3,
          child: CircleAvatar(
            radius: w * 0.4,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
          ),
        ),
        Positioned(
          bottom: -h * 0.2,
          right: -w * 0.25,
          child: CircleAvatar(
            radius: w * 0.35,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
