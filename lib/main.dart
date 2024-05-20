import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pageview_and_image_paddnig_align/res/app_color.dart';
import 'package:pageview_and_image_paddnig_align/res/app_string.dart';
import 'package:pageview_and_image_paddnig_align/res/app_style.dart';
import 'package:pageview_and_image_paddnig_align/widget/buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageWithUX(),
    );
  }
}

PageController controller = PageController();

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      controller: controller,
      children: const [
        HomePage(
          index: 1,
          title: 'Write Lists',
          image: 'image/first.png',
          subtitle:
              'Aliquip amet in nisi laborum ullamco laboris quis tempor sit cupidatat consequat.',
        ),
        HomePage(
          index: 2,
          title: 'Hello World',
          image: 'image/second.png',
          subtitle:
              "Lorem excepteur officia exercitation ex tempor anim qui et irure dolor occaecat labore officia ipsum.",
        ),
        HomePage(
            index: 3,
            title: 'AyA Kalaam',
            image: 'image/third.png',
            subtitle:
                'Sint reprehenderit cupidatat irure et duis officia enim cupidatat fugiat quis nisi.'),
        Scaffold(
          backgroundColor: Colors.green,
        )
      ],
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key,
      required this.title,
      required this.image,
      required this.subtitle,
      required this.index});

  final String title;
  final String image;
  final String subtitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  controller.animateToPage(3,
                      duration: Duration(seconds: 3),
                      curve: Curves.easeOutQuint);
                },
                child: Text(SKIP, style: skipTextStyle),
              ),
            ),
          ),
          Image.asset(image),
          Text(title, style: primaryTextStyle),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(subtitle, style: secondaryTextStyle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: (index == 1) ? secondaryColor : backSecColor,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: (index == 2) ? secondaryColor : backSecColor,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: (index == 3) ? secondaryColor : backSecColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              controller.nextPage(
                  duration: Duration(seconds: 1), curve: Curves.bounceInOut);
            },
            child: ButtonWithCustomTitle(
              title: NEXT,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageWithUX extends StatelessWidget {
  const HomePageWithUX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                NewHomePage(
                  index: 1,
                  title: 'Write Lists',
                  image: 'image/first.png',
                  subtitle:
                      'Aliquip amet in nisi laborum ullamco laboris quis tempor sit cupidatat consequat.',
                ),
                NewHomePage(
                  index: 2,
                  title: 'Hello World',
                  image: 'image/second.png',
                  subtitle:
                      "Lorem excepteur officia exercitation ex tempor anim qui et irure dolor occaecat labore officia ipsum.",
                ),
                NewHomePage(
                    index: 3,
                    title: 'AyA Kalaam',
                    image: 'image/third.png',
                    subtitle:
                        'Sint reprehenderit cupidatat irure et duis officia enim cupidatat fugiat quis nisi.'),
                Scaffold(
                  backgroundColor: Colors.green,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: controller, // PageController
              count: 4,
              effect: WormEffect(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  controller.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.bounceInOut);
                },
                child: ButtonWithCustomTitle(title: NEXT)),
          )
        ],
      ),
    );
  }
}

class NewHomePage extends StatelessWidget {
  const NewHomePage(
      {super.key,
      required this.title,
      required this.image,
      required this.subtitle,
      required this.index});

  final String title;
  final String image;
  final String subtitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  controller.animateToPage(3,
                      duration: Duration(seconds: 3),
                      curve: Curves.easeOutQuint);
                },
                child: Text(SKIP, style: skipTextStyle),
              ),
            ),
          ),
          Image.asset(image),
          Text(title, style: primaryTextStyle),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(subtitle, style: secondaryTextStyle),
          ),
        ],
      ),
    );
  }
}
