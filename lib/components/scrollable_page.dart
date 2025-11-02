//this page is just about creating a scrollable page with appbar
import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/app_bar.dart';

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        opacity: _isAtTop ? 1.0 : 0.0,
        currentRoute: widget.currentRoute,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: widget.child,
      ),
    );
  }
}
