import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnitrics_thesis/getStarted/disclaimer.dart';
import 'package:omnitrics_thesis/getStarted/get_started.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainGetStarted extends StatelessWidget {
  MainGetStarted({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            // PageView takes up the available space.
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  Disclaimer(),
                  GetStarted(),
                ],
              ),
            ),
            // Dot Indicator with responsive padding
            Padding(
              padding: EdgeInsets.all(23.w),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.deepPurple,
                  dotHeight: 20.h,
                  dotWidth: 20.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
