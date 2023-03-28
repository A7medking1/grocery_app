import 'package:equatable/equatable.dart';
import 'package:grocery_app/src/core/resources/app_assets.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class OnBoardingModel extends Equatable {
  final String image;
  final String title;
  final String desc;

  const OnBoardingModel({
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  List<Object> get props => [image, title, desc];
}

List<OnBoardingModel> items = const [
  OnBoardingModel(
    image: AppAssets.onBoarding1,
    title: AppStrings.title1,
    desc: AppStrings.description1,
  ),
  OnBoardingModel(
    image: AppAssets.onBoarding2,
    title: AppStrings.title2,
    desc: AppStrings.description2,
  ),
  OnBoardingModel(
    image: AppAssets.onBoarding1,
    title: AppStrings.title3,
    desc: AppStrings.description3,
  ),
];
