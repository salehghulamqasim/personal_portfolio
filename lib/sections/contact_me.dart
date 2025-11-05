// - Max width 600px for inputs (full width until that cap)
// - Consistent borders/colors on all fields
// - Message stays 6 lines tall (size unchanged)
// - Tap email to open default mail app

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  // CONTROLLERS
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  // SEND VIA FORMSPREE (when you press the yellow button)
  Future<void> sendEmail() async {
    final response = await http.post(
      Uri.parse('https://formspree.io/f/manlvavv'),
      body: {
        'name': nameController.text,
        'email': emailController.text,
        'message': messageController.text,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sent successfully!')));
      nameController.clear();
      emailController.clear();
      messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Error sending email. Please try again or try senidng me email manually ;)',
          ),
        ),
      );
    }
  }

  // OPEN DEFAULT MAIL APP (when clicking the email text at the bottom)
  Future<void> launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'Salehthecoder@gmail.com',
      queryParameters: {
        'subject': 'Contact from Portfolio',
        'body':
            'Name: ${nameController.text}\nEmail: ${emailController.text}\n\n${messageController.text}',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Could not open email app, its better if you just copy the email by hand :)',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // LAYOUT: small screens = tighter padding
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Center(
      child: Container(
        // Outer cap for the whole section
        constraints: BoxConstraints(maxWidth: 700.w),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20.w : 40.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FORM: centered, inputs capped at 600px (full width until the cap)
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FIELD: Name
                    Text(
                      'Name',
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF25282B),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Your name',
                          hintStyle: TextStyle(
                            color: const Color(0xFF828282).withOpacity(0.7),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 16.h,
                          ),
                          // ~48px min height for single-line inputs
                          constraints: BoxConstraints(minHeight: 48.h),

                          // Normal (not focused)
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 2,
                            ),
                          ),
                          // Fallback base
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 2,
                            ),
                          ),
                          // Focused (yellow)
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFFDC435),
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Color(0xFF25282B),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // FIELD: Email
                    Text(
                      'Email',
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF25282B),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xFFFDC435),
                        decoration: InputDecoration(
                          hintText: 'your.email@example.com',
                          hintStyle: TextStyle(
                            color: const Color(0xFF828282).withOpacity(0.7),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 16.h,
                          ),
                          // ~48px min height for single-line inputs
                          constraints: BoxConstraints(minHeight: 48.h),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFFDC435),
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFF44336),
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFF44336),
                              width: 2,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Color(0xFF25282B),
                        ),
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // FIELD: Message (kept size: 6 lines)
                    Text(
                      'Message',
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF25282B),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Full width (same cap as others), borders now match Name/Email
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: messageController,
                        maxLines: 6, // keep as-is
                        cursorColor: const Color(0xFFFDC435),
                        decoration: InputDecoration(
                          hintText: 'Tell me about your project...',
                          hintStyle: TextStyle(
                            color: const Color(0xFF828282).withOpacity(0.7),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 16.h,
                          ),
                          // MATCH OTHERS: add enabledBorder; keep same border/focusedBorder
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFFDC435),
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Color(0xFF25282B),
                        ),
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // BUTTON: Send
                    Center(
                      child: ElevatedButton(
                        onPressed: sendEmail,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFDC435),
                          padding: EdgeInsets.symmetric(
                            horizontal: 38.w,
                            vertical: 32.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          shadowColor: const Color(0xFFFDC435).withOpacity(0.3),
                          elevation: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Send Message',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFF25282B),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            const Icon(
                              Icons.send,
                              size: 20,
                              color: Color(0xFF25282B),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 60.h),

                    // ALT EMAIL: tap to open mail app
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 8.w),
                        Flexible(
                          child: Wrap(
                            children: [
                              const Text(
                                'Or email me directly at: ',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  color: Color(0xFF828282),
                                ),
                              ),
                              GestureDetector(
                                onTap: launchEmail,
                                child: const Text(
                                  'SalehTheCoder@gmail.com',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    color: Color(0xFF25282B),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
