import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:past_list/config/colors.dart';
import 'package:past_list/qr_scanner.dart';
import 'package:past_list/screens/home/home_screen.dart';
import 'package:past_list/screens/message/message_screen.dart';
import 'package:past_list/screens/profile/profile_screen.dart';
import 'package:past_list/screens/widgets/custom_button.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  final _pages = [
    const HomeScreen(),
    const MessageScreen(),
    const Text('Fav List'),
    const ProfileScreen(),
    const QRScanner(),

  ];

  void _changePageTo(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      floatingActionButton: _selectedIndex == 1
          ? null
          : CustomButton(
              child: const Icon(Icons.qr_code, color: Colors.white),
              onTap: () => _changePageTo(4),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _selectedIndex == 1
          ? null
          : Container(
              height: 80.0,
              width: double.infinity,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 19.0),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    offset: const Offset(0, 4),
                    color: kBlack.withOpacity(0.15),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => _changePageTo(0),
                    child: SvgPicture.asset(
                      'assets/icons/home.svg',
                      color: _selectedIndex == 0 ? kSelectedTabColor : null,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _changePageTo(1),
                    child: SvgPicture.asset(
                      'assets/icons/message.svg',
                      color: _selectedIndex == 1 ? kSelectedTabColor : null,
                    ),
                  ),
                  const SizedBox(),
                  GestureDetector(
                    onTap: () => _changePageTo(2),
                    // child: SvgPicture.asset(
                    //   'assets/icons/favorite_border.svg',
                    //   color: _selectedIndex == 2 ? kSelectedTabColor : null,
                    // ),
                    child: Icon(
                      Icons.bookmark_border_outlined,
                      color: _selectedIndex == 2 ? kSelectedTabColor : null,
                    )
                  ),
                  GestureDetector(
                    onTap: () => _changePageTo(3),
                    child: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      color: _selectedIndex == 3 ? kSelectedTabColor : null,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
