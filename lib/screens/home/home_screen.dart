import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:past_list/config/colors.dart';
import 'package:past_list/screens/home/widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // firstly, we need to create a backround
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/logo168.png', scale: 30),
                    const SizedBox(width: 8.0),
                    Text(
                      'Pass List',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/notif.svg'),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                child: Text(
                  'Inicio',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Container(
                        height: 56.0,
                        width: 56.0,
                        margin: EdgeInsets.only(
                          left: 30.0,
                          right: index == 4 ? 30.0 : 0.0,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0, color: k2AccentStroke),
                          image: const DecorationImage(
                            image:
                                AssetImage('assets/images/Andrey.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 32.0,
                    ),
                    padding: const EdgeInsets.all(14.0),
                    height: size.height * 0.40,
                    width: size.width,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/cbtis_image_${index + 1}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/Andrey.jpeg'),
                                  maxRadius: 16.0,
                                ),
                                const SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Andrey Muñoz',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: kWhite),
                                    ),
                                    Text(
                                      'Hace 2 horas',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              color: const Color(0xFFD8D8D8)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert, color: kWhite),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildPostStat(
                              context: context,
                              iconPath: 'assets/icons/favorite_border.svg',
                              value: '303',
                            ),
                            _buildPostStat(
                              context: context,
                              iconPath: 'assets/icons/favorite_border.svg',
                              value: '172',
                            ),
                            _buildPostStat(
                              context: context,
                              iconPath: 'assets/icons/favorite_border.svg',
                              value: '591',
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildPostStat({
    required BuildContext context,
    required String iconPath,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5).withOpacity(0.40),
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            color: kWhite,
          ),
          const SizedBox(width: 8.0),
          Text(
            value,
            style:
                Theme.of(context).textTheme.labelSmall!.copyWith(color: kWhite),
          ),
        ],
      ),
    );
  }
}
