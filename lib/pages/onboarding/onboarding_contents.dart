import 'package:joyn/components/app_asset.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Learn, Trade, Succeed",
    image: AppAsset.onboardingImageOne,
    desc: "Your one-stop destination for stock market\n education and trading insights is...\nJust a tap away",
  ),
  OnboardingContents(
    title: "Welcome To World Of\n“Stock Market Trading”",
    image: AppAsset.onboardingImageTwo,
    desc:
        "From beginners to experts,\n we've got something for every investor",
  ),
];