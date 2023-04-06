import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_achitecture/data/models/onboarding_item.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _controller = PageController();
  int _currentIndex = 0;

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
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.4, 0.7, 0.9],
              colors: const [
                Color(0xFF3594DD),
                Color(0xFF4569DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0)
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(),
          ),
        ),
      ),
    );
  }
}
