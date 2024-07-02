import 'package:flutter/material.dart';
import 'package:past_list/config/colors.dart';

// This widget will be used in message detail, thats why i moved it to widgets folder.
class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.radius,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.0, color: kBlack),
      ),
      child: CircleAvatar(
        backgroundImage: const AssetImage('assets/images/Andrey.jpeg'),
        radius: radius,
      ),
    );
  }
}
