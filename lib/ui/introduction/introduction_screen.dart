import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthub/constants/colors.dart';
import 'package:studenthub/constants/key_translator.dart';
import 'package:studenthub/ui/home/widgets/my_elavated_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child: Text(
              'StudentHub',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: primaryColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            )),
            Container(
              margin: const EdgeInsets.only(top: 36),
              child: Transform.scale(
                scale: 1.4,
                child: Image.asset(
                  'lib/assets/images/landing.png',
                ),
              ),
            ),
            const Spacer(flex: 1),
            SizedBox(
              width: 375,
              child: Text(
                'Build your product with high-skilled student',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF848484),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 375,
              child: Text(
                'Find and onboard top-tier students for your projects, enabling them to gain real-world experience and skills',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 13,
                      color: const Color(0xFF848484),
                      fontWeight: FontWeight.w400,
                      height: 1.3, // Adjust the line height here
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 1),
            Center(
              child: MyElevatedButton(
                height: 45,
                width: 350,
                gradient: const LinearGradient(
                  colors: [Color(0xFFACC0FF), Color(0xFF6188FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                onPressed: () {
                  context.push('/login');
                },
                borderRadius: BorderRadius.circular(20),
                child: Text(
                  'company'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: MyElevatedButton(
                height: 45,
                width: 350,
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                buttonBorder: Border.all(
                  color: const Color(0xFF6188FF),
                  width: 2,
                ),
                onPressed: () {
                  context.push('/login');
                },
                child: Text(
                  'student'.toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFF6188FF),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),
            Container(
              margin: const EdgeInsets.all(32),
              child: SizedBox(
                width: 350,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          // text:
                          //     'When proceeding to the next step, I agreed to the ',
                          text: proceedNextKey.tr(),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF848484),
                                  )),
                      TextSpan(
                          // text: 'Terms of Service and Usage Policy.',
                          text: termsOfServiceAndPolicyKey.tr(),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF848484),
                                    fontWeight: FontWeight.bold,
                                  )),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
