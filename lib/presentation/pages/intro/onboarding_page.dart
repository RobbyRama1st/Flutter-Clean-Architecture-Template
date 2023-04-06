import 'package:flutter/material.dart';
import 'package:flutter_clean_achitecture/data/models/onboarding_item.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // Create list of OnboardingItem for 3 pages
  List<OnBoardingItem> onboardingItems = [
    OnBoardingItem(
      title: "Welcome to MyApp",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "assets/images/onboarding1.png",
    ),
    OnBoardingItem(
      title: "Get Started",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "assets/images/onboarding2.png",
    ),
    OnBoardingItem(
      title: "Explore Features",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "assets/images/onboarding3.png",
    ),
  ];

  // final _introBloc = IntroBloc(onboardingItems: onboardingItems);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to OnBoarding Page",
        ),
      ),
    );
  }
}
