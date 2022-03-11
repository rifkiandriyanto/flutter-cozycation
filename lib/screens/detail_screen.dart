import 'package:flutter/material.dart';
import 'package:cozycation/helpers/theme.dart';
import 'package:cozycation/models/space_model.dart';
import 'package:cozycation/helpers/is_numeric.dart';
import 'package:cozycation/screens/error_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cozycation/widgets/rating_widget.dart';
import 'package:cozycation/widgets/favorite_widget.dart';

class DetailScreen extends StatelessWidget {
  final SpaceModel space;

  const DetailScreen(this.space, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Would you like to contact the owner of the apartment?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                  isNumeric(space.phone)
                      ? launch('tel:${space.phone}')
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ErrorScreen(),
                          ),
                        );
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          showConfirmation();
        },
        child: Container(
          width: MediaQuery.of(context).size.width - (2 * 24),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17), color: purple),
          child: Center(
            child: Text(
              'Book Now',
              style: medium.copyWith(
                fontSize: 18,
                color: white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              '${space.image}',
              width: MediaQuery.of(context).size.width,
              height: 350,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      color: white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${space.name}',
                                    style: medium.copyWith(
                                      fontSize: 22,
                                      color: black,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: '\$${space.price}',
                                      style: medium.copyWith(
                                          fontSize: 16, color: purple),
                                      children: [
                                        TextSpan(
                                          text: ' / month',
                                          style: light.copyWith(
                                            fontSize: 16,
                                            color: grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              RatingWidget(rate: space.rate as int),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Main Facilities',
                            style: reguler.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/icons/kitchen.png',
                                    width: 32,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: space.numberOfKitchens.toString(),
                                      style: medium.copyWith(
                                        fontSize: 14,
                                        color: purple,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' kitchens',
                                          style: light.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/icons/bedroom.png',
                                    width: 32,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: space.numberOfBedrooms.toString(),
                                      style: medium.copyWith(
                                        fontSize: 14,
                                        color: purple,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' bedrooms',
                                          style: light.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/icons/cupboard.png',
                                    width: 32,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: space.numberOfCupboards.toString(),
                                      style: medium.copyWith(
                                        fontSize: 14,
                                        color: purple,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' big cupboards',
                                          style: light.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Photos',
                            style: reguler.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 88,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: space.photos!.map((e) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 18),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      e,
                                      width: 110,
                                      height: 88,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Location',
                            style: reguler.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${space.address}',
                                    style: reguler.copyWith(
                                      fontSize: 14,
                                      color: darkGrey,
                                    ),
                                  ),
                                  Text(
                                    '${space.city}',
                                    style: reguler.copyWith(
                                      fontSize: 14,
                                      color: darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  launch('${space.mapUrl}');
                                },
                                child: CircleAvatar(
                                  backgroundColor: lightGrey,
                                  child: Icon(
                                    Icons.location_on,
                                    color: darkGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50.0 + 40.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: white,
                      child: Icon(
                        Icons.chevron_left,
                        color: purple,
                        size: 20,
                      ),
                    ),
                  ),
                  const FavoriteWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
