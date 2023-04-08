import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_achitecture/presentation/blocs/onBoarding-bloc/onboarding_bloc.dart';
import 'package:flutter_clean_achitecture/presentation/widgets/slider_onboarding.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var logger = Logger();
  final _onBoardingBloc = OnBoardingBloc();
  final _controller = PageController();

  List<SliderOnBoarding> pages = [
    SliderOnBoarding(
      title: "Welcome to MyApp",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "assets/images/img_onboarding_1.png",
    ),
    SliderOnBoarding(
      title: "Get Started",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "assets/images/img_onboarding_2.png",
    ),
    SliderOnBoarding(
      title: "Explore Features",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "assets/images/img_onboarding_3.png",
    ),
  ];

  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
      _onBoardingBloc.add(OnBoardingPageChanged());
    });
  }

  void _skipButtonPressed() {
    _onBoardingBloc.add(SkipButtonPressed());
  }

  void _nextButtonPressed() {
    _currentPage < pages.length - 1
        ? _controller.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.easeInQuint)
        : _onBoardingBloc.add(GetStartedButtonPressed());
  }

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
            logger.d("onBoardingPageChange");
          }

          if (state is OnBoardingCompletedState) {
            logger.d("onBoardingComplete");
            Modular.to.navigate('/welcome');
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    onPageChanged: _onPageChanged,
                    itemCount: pages.length,
                    itemBuilder: (context, int index) {
                      return pages[index];
                    },
                  ),
                  Positioned(
                    bottom: 170,
                    child: SmoothPageIndicator(
                      controller: _controller, // PageController
                      count: pages.length,
                      effect: JumpingDotEffect(
                          dotWidth: 12.0,
                          dotHeight: 12.0,
                          verticalOffset: 12,
                          dotColor: Color(0xFF7B51D3),
                          activeDotColor: Colors.white),
                      onDotClicked: (index) {},
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextButton(
                              onPressed: _skipButtonPressed,
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: _currentPage < pages.length - 1
                                    ? Size(100, 44)
                                    : Size(150, 44),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.white,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: _nextButtonPressed,
                              child: Text(
                                _currentPage < pages.length - 1
                                    ? 'Next'
                                    : 'Get Started',
                                style: TextStyle(
                                    color: Color(0xFF5B16D0), fontSize: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
