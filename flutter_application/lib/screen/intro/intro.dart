import 'package:flutter/material.dart';
import 'package:flutter_application/model/intromodel.dart';
import 'package:flutter_application/screen/authentication/login_screen.dart';

class Introduction extends StatefulWidget {
  
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  /// List of data for each onboarding page, including images and text.
  final List<OnboardingPageData> pageDataList = [
    OnboardingPageData(
      image : "assets/images/pic1.png",
      title: "Welcome to MyGluCare",
      subTitle: "MyGluCare puts personalized, proactive healthcare right at your fingertips.",
      width: 20,
      height: 800, // Adjust the height for the first page.
    ),
    OnboardingPageData(
      image: "assets/images/pic2.png",
      title: "Quick Emergency Access",
      subTitle: "Get instant alerts and insulin guidance in critical moments—powered by your real-time glucose, heart rate, and activity data.",
      width: 20,
      height: 800, // Adjust the height for the second page.
    ),
    OnboardingPageData(
      image: "assets/images/pic3.png",
      title: "Stay Informed",
      subTitle: "Get real-time updates on your health trends, insulin recommendations, and alerts—powered by your latest glucose and activity data.",
      width: 20,
      height: 800, // Adjust the height for the third page.
    ),
    
    OnboardingPageData(
      image: "assets/images/pic4.png",
      title: "Personalised Care and Support",
      subTitle: "Receive tailored insulin guidance, health insights, and support—based on your unique glucose patterns, lifestyle, and daily activity.",
      width: 20,
      height: 800, // Adjust the height for the fourth page.
    ),
  ];

  /// Current page index for tracking the displayed page.
  int _currentPage = 0;

  /// Controller for managing the PageView.
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    // Add a listener to the PageController to track page changes
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: SafeArea(
            child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () async {
                    // context.read<OnboardingBloc>().add(CompleteOnboarding());
                    
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xff0F172A)),
                  )),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pageDataList.length,
                itemBuilder: (context, index) {
                  final pageData = pageDataList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image(
                              image: AssetImage(pageData.image),
                              width: size.width * pageData.width,
                              height: pageData.height,
                            ),
                            // child: SvgPicture.asset(
                            //   pageData.image,
                            //   // width: size.width * pageData.width,
                            //   // height: pageData.height,
                            // ),
                          ),
                          const SizedBox(height: 14),
                          Column(
                            children: [
                              Text(
                                pageData.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 25),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                pageData.subTitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 58),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            // Dot indicator
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pageDataList.length,
                  (index) => Container(
                    height: 6,
                    width: 22,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _currentPage == index ? Colors.black87 : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              height: 55,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 100, left: 25, right: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                onPressed: () async {
                  if (_currentPage < pageDataList.length - 1) {
                    _pageController.nextPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.linear);
                  } else {
                    ///context.read<OnboardingBloc>().add(CompleteOnboarding());
                    
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
