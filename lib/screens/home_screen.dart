import 'package:cozycation/helpers/theme.dart';
import 'package:cozycation/models/city_model.dart';
import 'package:cozycation/models/guide_model.dart';
import 'package:cozycation/models/space_model.dart';
import 'package:cozycation/widgets/button_nav_widget.dart';
import 'package:cozycation/widgets/city_card_widget.dart';
import 'package:cozycation/widgets/guide_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cozycation/services/space_service.dart';
import 'package:cozycation/widgets/space_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceservice = Provider.of<SpaceService>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  'Explore Now',
                  style: medium.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                'Mencari kosan yang cozy',
                style: light.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE: POPULAR CITIES
              Text(
                'Popular Cities',
                style: reguler.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 30,
                ),
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCardWidget(
                      CityModel(
                        id: 1,
                        name: 'Jakarta',
                        image: 'assets/images/city1.png',
                        isPopular: false,
                      ),
                    ),
                    CityCardWidget(
                      CityModel(
                        id: 2,
                        name: 'Bandung',
                        image: 'assets/images/city2.png',
                        isPopular: true,
                      ),
                    ),
                    CityCardWidget(
                      CityModel(
                        id: 3,
                        name: 'Surabaya',
                        image: 'assets/images/city3.png',
                        isPopular: false,
                      ),
                    ),
                    CityCardWidget(
                      CityModel(
                        id: 4,
                        name: 'Palembang',
                        image: 'assets/images/city4.png',
                        isPopular: false,
                      ),
                    ),
                    CityCardWidget(
                      CityModel(
                        id: 5,
                        name: 'Aceh',
                        image: 'assets/images/city5.png',
                        isPopular: true,
                      ),
                    ),
                    CityCardWidget(
                      CityModel(
                        id: 0,
                        name: 'Bogor',
                        image: 'assets/images/city6.png',
                        isPopular: false,
                      ),
                    ),
                  ],
                ),
              ),
              // NOTE: RECOMENDDED SPACE
              Text(
                'Recommended Space',
                style: reguler.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),

              //  List<SpaceModel>? data =
              // snapshot.data as List<SpaceModel>?;

              // children: data!.map((item) {

              FutureBuilder(
                future: spaceservice.getSpaceService(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<SpaceModel>? data = snapshot.data as List<SpaceModel>?;

                    return Column(
                      children:
                          data!.map((value) => SpaceCardWidget(value)).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),

              // NOTE: TIPS AND GUIDANCE
              Text(
                'Tips & Guidance',
                style: reguler.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  GuideWidget(
                    tips: GuideModel(
                      id: 1,
                      title: 'City Guidelines',
                      image: 'assets/icons/city-guidelines.png',
                      time: '20 Apr',
                    ),
                  ),
                  GuideWidget(
                    tips: GuideModel(
                      id: 2,
                      title: 'Jakarta Fairship',
                      image: 'assets/icons/jkt-fair.png',
                      time: '11 Dec',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0 + 24.0,
              ),
            ],
          ),
        ),
      ),
      // NOTE: FLOATING BUTTON
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * 24),
        height: 65,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ButtonNavWidget(
              name: 'home',
              isActive: true,
            ),
            ButtonNavWidget(
              name: 'mail',
              isActive: false,
            ),
            ButtonNavWidget(
              name: 'card',
              isActive: false,
            ),
            ButtonNavWidget(
              name: 'fav',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}
