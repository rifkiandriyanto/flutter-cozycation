import 'package:flutter/material.dart';
import 'package:cozycation/helpers/theme.dart';
import 'package:cozycation/models/guide_model.dart';

class GuideWidget extends StatelessWidget {
  final GuideModel tips;
  const GuideWidget({Key? key, required this.tips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            '${tips.image}',
            width: 80,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${tips.title}',
                style: medium.copyWith(
                  fontSize: 18,
                ),
              ),
              Text(
                'Updated ${tips.time}',
                style: light.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Color(0xffC9C9C9),
          ),
        ],
      ),
    );
  }
}
