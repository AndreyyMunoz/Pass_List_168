import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:past_list/config/colors.dart';
import 'package:past_list/screens/profile/widgets/profile_background.dart';
import 'package:past_list/screens/profile/widgets/stat.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedTab = 'photos';

  _changeTab(String tab) {
    setState(() => _selectedTab = tab);
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white70,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(height: 12,),
                  // Container(
                  //   width: 150.0,
                  //   height: 150.0,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(width: 1.0, color: kBlack),
                  //     borderRadius: BorderRadius.circular(35.0),
                  //   ),
                  // ),
                  ClipPath(
                    clipper: ProfileImageClipper(),
                    child: Image.asset(
                      'assets/images/Andrey.jpeg',
                      width: 180.0,
                      height: 182.0,
                      fit: BoxFit.scaleDown,
                      
                    ),
                  )
                ],
              ),
              Text(
                'Andrey Muñoz',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4.0),
              Text(
                '@lifefxcker',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 80.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stat(title: 'Posts', value: 3),
                    Stat(title: 'Followers', value: 11),
                    Stat(title: 'Follows', value: 120),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => _changeTab('photos'),
                    child: SvgPicture.asset(
                      'assets/icons/Button-photos.svg',
                      color: _selectedTab == 'photos' ? k2AccentStroke : null,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _changeTab('saved'),
                    child: SvgPicture.asset(
                      'assets/icons/Button-saved.svg',
                      color: _selectedTab == 'saved' ? k2AccentStroke : null,
                    ),
                  ),
                ],
              ),
              // we'll use flutter_staggered_grid_view package here:
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.0,
                  crossAxisSpacing: 14.0,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19.0),
                        child: Image.asset(
                          'assets/images/Andrey.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19.0),
                        child: Image.asset(
                          'assets/images/Andrey.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19.0),
                        child: Image.asset(
                          'assets/images/Andrey.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19.0),
                        child: Image.asset(
                          'assets/images/Andrey.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImageClipper extends CustomClipper<Path> {
  double radius = 35;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width / 2 - radius, radius)
      ..quadraticBezierTo(size.width / 2, 0, size.width / 2 + radius, radius)
      ..lineTo(size.width - radius, size.height / 2 - radius)
      ..quadraticBezierTo(size.width, size.height / 2, size.width - radius,
          size.height / 2 + radius)
      ..lineTo(size.width / 2 + radius, size.height - radius)
      ..quadraticBezierTo(size.width / 2, size.height, size.width / 2 - radius,
          size.height - radius)
      ..lineTo(radius, size.height / 2 + radius)
      ..quadraticBezierTo(0, size.height / 2, radius, size.height / 2 - radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
