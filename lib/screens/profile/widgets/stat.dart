import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:past_list/config/colors.dart';

class Stat extends StatelessWidget {
  const Stat({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: kCaption),
        ),
        Text(
          NumberFormat.decimalPattern().format(value),
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
