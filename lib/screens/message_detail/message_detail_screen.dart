import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:past_list/config/colors.dart';
import 'package:past_list/screens/message_detail/widgets/message_detail_background.dart';
import 'package:past_list/screens/widgets/custom_button.dart';
import 'package:past_list/screens/widgets/profile_image.dart';

class MessageDetailScreen extends StatelessWidget {
  MessageDetailScreen({super.key});

  final messages = [
    'Amigo, pasa la tarea',
    'nO!',
    'ok...',
    'Hola\fmuy buenas',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MessageDetailBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset('assets/icons/button_back.svg'),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // the widget we created earlier:
                  const ProfileImage(radius: 35.0),
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Andrey Muñoz',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        'En linea',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // messages:
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  final message = messages[index];
                  return Row(
                    // according to index, put message to left or right:
                    mainAxisAlignment: index.isEven
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Container(
                        constraints:
                            BoxConstraints(maxWidth: size.width * 0.80),
                        margin: const EdgeInsets.symmetric(
                          horizontal:18.0,
                          vertical: 6.0,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0),
                            topLeft: index.isEven
                                ? Radius.zero
                                : const Radius.circular(20.0),
                            topRight: index.isOdd
                                ? Radius.zero
                                : const Radius.circular(20.0),
                          ),
                        ),
                        child: Text(message),
                      ),
                    ],
                  );
                },
              ),
            ),
            // send message text field:
            Container(
              height: 86,
              width: size.width,
              margin: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 8.0,
                bottom: 50.0,
              ),
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 16.0,
              ),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 25.0,
                    color: kBlack.withOpacity(0.10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Escribe un mensaje...',
                        hintStyle: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),
                  CustomButton(
                      child: SvgPicture.asset('assets/icons/send.svg'),
                      onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
