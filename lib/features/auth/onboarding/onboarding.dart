import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<_OnBoardingModel> pages = [
    _OnBoardingModel(
      image: AppAssets.fourth,
      title: LangKeys.onboard1title,
      desc: LangKeys.onboard1desc,
    ),
    _OnBoardingModel(
      image: AppAssets.first,
      title: LangKeys.onboard2title,
      desc: LangKeys.onboard2desc,
    ),
    _OnBoardingModel(
      image: AppAssets.third,
      title: LangKeys.onboard3title,
      desc: LangKeys.onboard3desc,
    ),
  ];

  void goToMainScreen() {
    context.pushName(AppRoutes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) => setState(() => currentPage = index),
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(height: 50.h),
                    SvgPicture.asset(
                      fit: BoxFit.fill,
                      pages[index].image,
                      height: 300.h,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      context.translate(pages[index].title),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      context.translate(pages[index].desc),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: pages.length,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: context.color.greenLight!),
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: currentPage == pages.length - 1
                  ? goToMainScreen
                  : () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                currentPage == pages.length - 1
                    ? context.translate(LangKeys.startNow)
                    : context.translate(LangKeys.next),
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class _OnBoardingModel {
  final String image;
  final String title;
  final String desc;

  _OnBoardingModel({
    required this.image,
    required this.title,
    required this.desc,
  });
}
