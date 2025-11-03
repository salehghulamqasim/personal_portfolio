//this has contact me form

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:personal_portfolio/themes/text_styles.dart'; //for http requests

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  Future<void> sendEmail() async {
    final response = await http.post(
      Uri.parse('https://formspree.io/f/manlvavv'), //formspree endpoint
      body: {
        'name': nameController.text,
        'email': emailController.text,
        'message': messageController.text,
      },
    );
    //if response is success or error
    if (response.statusCode == 200) {
      // Email sent successfully
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sent successfully!')));
    } else {
      // Error sending email
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error sending email.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: SizedBox(
        width: 400,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //center align
          children: [
            // Name
            Text(
              "Name",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: Fonts.nunito.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              style: TextStyle(fontFamily: Fonts.nunito.fontFamily),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                filled: true,
                fillColor: Colors.white,
                hoverColor: const Color.fromARGB(255, 250, 250, 250),
              ),
            ),
            const SizedBox(height: 16),
            // Email
            Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: Fonts.nunito.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              style: TextStyle(fontFamily: Fonts.nunito.fontFamily),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.8),
                ),
                filled: true,
                fillColor: Colors.white,
                hoverColor: const Color.fromARGB(255, 250, 250, 250),
              ),
            ),
            const SizedBox(height: 16),
            // Message
            Text(
              "Message",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: Fonts.nunito.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: messageController,
              maxLines: 5, //multi line for message
              style: TextStyle(fontFamily: Fonts.nunito.fontFamily),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.8),
                ),
                filled: true, // fill color inside the box
                fillColor: Colors.white,
                hoverColor: const Color.fromARGB(255, 250, 250, 250),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  sendEmail();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFCC346), // yellow
                  foregroundColor: Colors.black, // text color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  "Send",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: Fonts.nunito.fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
