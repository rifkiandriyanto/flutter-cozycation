import 'package:flutter/material.dart';
import 'package:cozycation/helpers/theme.dart';
import 'package:cozycation/models/city_model.dart';

class CityCardWidget extends StatelessWidget {
  final CityModel city;
  const CityCardWidget(this.city, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 120,
              height: 150,
              color: lightGrey,
              child: Column(
                children: [
                  Image.asset(
                    '${city.image}',
                    width: 120,
                    height: 102,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    '${city.name}',
                    style: medium.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            city.isPopular == true
                ? Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: purple,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Icon(
                      Icons.star,
                      size: 22,
                      color: orange,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
