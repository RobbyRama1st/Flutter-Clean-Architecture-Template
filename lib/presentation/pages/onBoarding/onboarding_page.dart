import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_achitecture/data/models/onboarding_item.dart';
import 'package:flutter_clean_achitecture/presentation/blocs/onBoarding-bloc/onboarding_bloc.dart';
import 'package:logger/logger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Create list of OnboardingItem for 3 pages
List<OnBoardingItem> onboardingItems = [
  OnBoardingItem(
    title: "Welcome to MyApp",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    image: "assets/images/img_onboarding_1.png",
  ),
  OnBoardingItem(
    title: "Get Started",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    image: "assets/images/img_onboarding_2.png",
  ),
  OnBoardingItem(
    title: "Explore Features",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    image: "assets/images/img_onboarding_3.png",
  ),
];

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var logger = Logger();
  final _onBoardingBloc = OnBoardingBloc(onboardingItems: onboardingItems);
  final _controller = PageController();
  // int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _onBoardingBloc;
      },
      child: BlocListener<OnBoardingBloc, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingPageChangedState) {
            logger.d("onBOardingPageChange");
          }

          if (state is OnBoardingCompletedState) {
            logger.d("onBoardingComplete");
          }
        },
        child: Scaffold(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      child: PageView(
                        controller: _controller,
                        onPageChanged: (int page) {
                          _onBoardingBloc.add(NextButtonPressed());
                        },
                        children: onboardingItems.map((item) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                item.image!,
                                height: 300.0,
                                width: 300.0,
                              ),
                              SizedBox(height: 30.0),
                              Text(
                                item.title!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                child: Text(
                                  item.description!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    // This for dot indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          controller: _controller, // PageController
                          count: onboardingItems.length,

                          effect: JumpingDotEffect(
                              dotWidth: 12.0,
                              dotHeight: 12.0,
                              verticalOffset: 12,
                              dotColor: Color(0xFF7B51D3),
                              activeDotColor:
                                  Colors.white), // your preferred effect
                          onDotClicked: (index) {},
                        ),
                      ],
                    ),
                    // This for bottom button action
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _controller.nextPage(
                                      duration: Duration(microseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
