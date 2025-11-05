//this page is just about creating a scrollable page with appbar
import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/app_bar.dart';
import 'package:personal_portfolio/components/mobilebar.dart';

class ScrollablePage extends StatefulWidget {
  final Widget child;
  final String? currentRoute;

  const ScrollablePage({super.key, required this.child, this.currentRoute});

  @override
  State<ScrollablePage> createState() => _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage> {
  final ScrollController _scrollController = ScrollController();

  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      bool atTop = _scrollController.offset <= 0;
      if (atTop != _isAtTop) {
        setState(() => _isAtTop = atTop);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (isMobile) {
      // Mobile: Use built-in endDrawer for right-side drawer
      return Scaffold(
        extendBodyBehindAppBar: true,
        endDrawer: MobileDrawerContent(currentRoute: widget.currentRoute),
        appBar: MobileAppBar(
          opacity: _isAtTop ? 1.0 : 0.0,
          currentRoute: widget.currentRoute,
        ),
        body: SafeArea(
          top: false, // Important: This was missing!
          child: SingleChildScrollView(
            controller: _scrollController,
            child: widget.child,
          ),
        ),
        resizeToAvoidBottomInset: false, // Important: This was missing!
      );
    } else {
      // Desktop: Use regular AppBar
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          opacity: _isAtTop ? 1.0 : 0.0,
          currentRoute: widget.currentRoute,
        ),
        body: SafeArea(
          top: false, // Important: This was missing!
          child: SingleChildScrollView(
            controller: _scrollController,
            child: widget.child,
          ),
        ),
        resizeToAvoidBottomInset: false, // Important: This was missing!
      );
    }
  }
}
