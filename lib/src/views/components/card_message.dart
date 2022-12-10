import 'package:flutter/material.dart';
import 'package:saferoom/src/constans.dart';

class CardMessage extends StatelessWidget {
  final ImageProvider image;
  final String message;
  final Function()? onPositive;
  final Function()? onNegative;
  final String positveLabel;
  final String negativeLabel;
  const CardMessage(
      {super.key,
      required this.image,
      required this.message,
      this.onPositive,
      this.onNegative,
      this.positveLabel = 'Next',
      this.negativeLabel = 'back'});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    bool isPortrait = orientation == Orientation.portrait;

    return Flex(
      direction: isPortrait ? Axis.vertical : Axis.horizontal,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.contain)),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      message,
                      style: SRTextStyle.sample,
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    onNegative != null
                        ? TextButton.icon(
                            style: TextButton.styleFrom(),
                            onPressed: onNegative,
                            icon: const Icon(Icons.arrow_back_sharp),
                            label: Text(negativeLabel))
                        : const SizedBox(),
                    onPositive != null
                        ? TextButton.icon(
                            onPressed: onPositive,
                            icon: const Icon(Icons.arrow_forward_sharp),
                            label: Text(positveLabel))
                        : const SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
