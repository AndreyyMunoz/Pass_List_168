import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:past_list/config/colors.dart';
import 'package:past_list/screens/nav/nav.dart';
import 'package:past_list/screens/onboarding/widgets/background.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _pageIndex = 0;

  _onPageChanged(index) {
    setState(() => _pageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Background
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Constructor de página
            Expanded(
              flex: 2,
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenido',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Pass List',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 57),
                      Image.asset('assets/images/logo168.png', scale: 3),
                    ],
                  );
                },
                onPageChanged: _onPageChanged,
              ),
            ),
            // Indicador de página
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  height: 12.0,
                  width: 12.0,
                  margin: const EdgeInsets.symmetric(horizontal: 3.5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _pageIndex == index ? kBlue : null,
                      border: Border.all(width: 1.0, color: kBlack,
                    )
                  ),
                ),
              ),
            ),
            // Crear botón inferior a la derecha
            Expanded(
              child: GestureDetector(
                onTap: () => {
                  
                  
                  if (_pageIndex < 3) {
                    _pageIndex++
                  } else if (_pageIndex == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Nav(),
                      ),
                    ),
                  },
                  print(_pageIndex),
                  
                },
                
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -50,
                      right: -60,
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: Container(
                          height: size.width * 0.7,
                          width: size.width * 0.68,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: kBlue),
                            borderRadius: BorderRadius.circular(87.0),
                          ),
                          child: Container(
                            height: size.width * 0.65,
                            width: size.width * 0.62,
                            decoration: BoxDecoration(
                              color:
                                  _pageIndex.isEven ? kBlue : k2MainThemeColor,
                              borderRadius: BorderRadius.circular(79.0),
                            ),
                            child: Transform.rotate(
                              angle: -math.pi / 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Siguiente',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: _pageIndex.isEven ? kWhite : kBlack,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 11.0,
                                  ),
                                  // const Icon(
                                  //   Icons.arrow_forward,
                                  //   color: kWhite,
                                  //   size: 25.0,
                                  // ),
                                  SvgPicture.asset(
                                    'assets/icons/arrow_forward.svg',
                                    color: _pageIndex.isEven ? kWhite : kBlack,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
    );
  }
}
