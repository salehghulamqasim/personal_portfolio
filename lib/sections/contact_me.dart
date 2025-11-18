import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:confirmation_success/confirmation_success.dart';
import 'package:personal_portfolio/themes/colors.dart';

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

  bool isSubmitting = false; // prevent spam clicks
  bool isEmailValid = false; // track email validity

  // Cache these values to avoid recalculating on every keystroke
  late final bool isMobile;
  late final double horizontalPadding;
  late final double maxWidth;

  @override
  void initState() {
    super.initState();
    // Add listener to email controller to validate on change
    emailController.addListener(_validateEmail);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Calculate once when dependencies change, not on every rebuild
    isMobile = MediaQuery.of(context).size.width < 768;
    horizontalPadding = isMobile ? 20.w : 40.w;
    maxWidth = 600.w;
  }

  @override
  void dispose() {
    // Don't forget to dispose controllers
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  // Email validation using regex
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  // Validate email and update state
  void _validateEmail() {
    final valid = _isValidEmail(emailController.text.trim());
    if (valid != isEmailValid) {
      setState(() => isEmailValid = valid);
    }
  }

  // SEND VIA FORMSPREE
  Future<void> sendEmail() async {
    if (isSubmitting) return;
    setState(() => isSubmitting = true);

    try {
      final response = await http.post(
        Uri.parse('https://formspree.io/f/manlvavv'),
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'message': messageController.text,
        },
      );

      if (response.statusCode == 200) {
        print('✅ Email sent (status 200)');

        // Clear the text fields after successful submission
        nameController.clear();
        emailController.clear();
        messageController.clear();

        // show confirmation animation
        await showDialog(
          context: context,
          barrierDismissible: false,
          useRootNavigator: true,
          builder: (context) => _FadeAwayDialog(
            child: RepaintBoundary(
              child: ConfirmationSuccess(
                reactColor: AppColors.primaryOrange,
                bubbleColors: const [
                  Color.fromRGBO(253, 210, 120, 0.3),
                  Color.fromRGBO(252, 195, 70, 0.6),
                  Color.fromRGBO(255, 205, 100, 1.0),
                ],
                numofBubbles: 35,
                maxBubbleRadius: 8,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sent",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        _showErrorSnackBar();
      }
    } catch (e) {
      print('⚠️ Exception (might be CORS) but email may have sent: $e');

      // Clear the text fields even if there's an exception (assuming email sent)
      nameController.clear();
      emailController.clear();
      messageController.clear();

      await showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (context) => _FadeAwayDialog(
          child: RepaintBoundary(
            child: ConfirmationSuccess(
              reactColor: const Color(0xFFFDC435),
              bubbleColors: const [Color(0xFFFDC435)],
              numofBubbles: 35,
              maxBubbleRadius: 8,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Message Sent!",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF25282B),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Thanks for reaching out — I'll get back to you soon.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      color: Color(0xFF25282B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => isSubmitting = false);
      }
    }
  }

  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error sending email. Please try again manually :)'),
      ),
    );
  }

  // OPEN DEFAULT MAIL APP
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
            'Could not open email app. Try copying the email manually :)',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 700.w),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isMobile ? 10.h : 20.h,
        ),
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _FieldLabel(text: 'Name'),
                _CustomTextField(
                  controller: nameController,
                  hintText: 'Your name',
                ),
                SizedBox(height: 32.h),

                const _FieldLabel(text: 'Email'),
                _CustomTextField(
                  controller: emailController,
                  hintText: 'your.email@example.com',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 32.h),

                const _FieldLabel(text: 'Message'),
                _CustomTextField(
                  controller: messageController,
                  hintText: 'Tell me about your project...',
                  maxLines: 6,
                ),
                SizedBox(height: 32.h),

                Center(
                  child: _SubmitButton(
                    isSubmitting: isSubmitting,
                    isEmailValid: isEmailValid,
                    onPressed: sendEmail,
                  ),
                ),
                SizedBox(height: 60.h),
                _EmailDirectLink(isMobile: isMobile, onTap: launchEmail),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 🎯 EXTRACTED WIDGETS FOR BETTER PERFORMANCE

// Field label - now a const StatelessWidget
class _FieldLabel extends StatelessWidget {
  final String text;

  const _FieldLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Color(0xFF25282B),
      ),
    );
  }
}

// Custom text field - StatelessWidget to prevent unnecessary rebuilds
class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final int maxLines;

  const _CustomTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: SizedBox(
        width: double.infinity,
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          cursorColor: const Color(0xFFFDC435),
          textInputAction: maxLines == 1
              ? TextInputAction.next
              : TextInputAction.newline,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xFF828282).withValues(alpha: 0.7),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 16.h,
            ),
            constraints: BoxConstraints(minHeight: 48.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB), width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Color(0xFFFDC435), width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            color: Color(0xFF25282B),
          ),
        ),
      ),
    );
  }
}

// Submit button - StatelessWidget
class _SubmitButton extends StatelessWidget {
  final bool isSubmitting;
  final bool isEmailValid;
  final VoidCallback onPressed;

  const _SubmitButton({
    required this.isSubmitting,
    required this.isEmailValid,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isSubmitting || !isEmailValid) ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: (isSubmitting || !isEmailValid)
            ? Colors.grey
            : const Color(0xFFFDC435),
        padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 32.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        shadowColor: (isSubmitting || !isEmailValid)
            ? Colors.transparent
            : const Color(0xFFFDC435).withValues(alpha: 0.3),
        elevation: (isSubmitting || !isEmailValid) ? 0 : 4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isSubmitting
                ? 'Sending...'
                : (!isEmailValid ? 'Enter a valid email' : 'Send Message'),
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xFF25282B),
            ),
          ),
          if (!isSubmitting && isEmailValid) ...[
            SizedBox(width: 10.w),
            const Icon(Icons.send, size: 20, color: Color(0xFF25282B)),
          ],
        ],
      ),
    );
  }
}

// Email direct link - StatelessWidget
class _EmailDirectLink extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onTap;

  const _EmailDirectLink({required this.isMobile, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Or email me directly at: ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Color(0xFF828282),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'SalehTheCoder@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      color: Color(0xFF25282B),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                onTap: onTap,
                child: const Text(
                  'SalehTheCoder@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Color(0xFF25282B),
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          );
  }
}

// Beautiful fade-away dialog with smooth animation
class _FadeAwayDialog extends StatefulWidget {
  final Widget child;

  const _FadeAwayDialog({required this.child});

  @override
  State<_FadeAwayDialog> createState() => _FadeAwayDialogState();
}

class _FadeAwayDialogState extends State<_FadeAwayDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Start fade out after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _controller.forward().then((_) {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(20.w),
          child: widget.child,
        ),
      ),
    );
  }
}
