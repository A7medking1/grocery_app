import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_button.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/resources/routes_manager.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';
import 'package:grocery_app/src/on_boarding/model/on_boarding_model.dart';
import 'package:grocery_app/src/on_boarding/presentation/widget/indicator_pageView.dart';
import 'package:grocery_app/test.dart';

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({
    super.key,
  });

  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  final pageController = PageController(initialPage: 0);

  int currentPage = 0;

  bool isLastPage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            onPageChanged: (int index) {
              if (index == items.length - 1) {
                isLastPage = true;
              } else {
                isLastPage = false;
              }
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return PageViewWidget(
                model: items[index],
              );
            },
          ),
        ),
        IndicatorPageView(currentIndex: currentPage),
        const SizedBox(
          height: 50,
        ),
        Column(
          children: [
            CustomButton(
              onTap: () {
                if (isLastPage) {
                  sl<AppPreferences>().setOnBoarding();
               //   Navigator.push(context, MaterialPageRoute(builder: (_)=> const Test()));
                  context.goNamed(Routes.login);
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                }
              },
              text: !isLastPage ? AppStrings.btnNext : AppStrings.btnGetStarted,
            ),
          ],
        ),
      ],
    );
  }
}

class PageViewWidget extends StatelessWidget {
  final OnBoardingModel model;

  const PageViewWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          model.image,
          height: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          model.title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.desc,
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ],
    );
  }
}
