import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import '../core/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * .65,
                    width: MediaQuery.sizeOf(context).width,
                    color: const Color.fromARGB(255, 253, 234, 208),
                    child: Stack(
                      children: [
                        const O3D(
                          src:
                              'assets/three_object/elinalise_dragonroad_musyoku_tensei.glb',
                          autoRotate: false,
                          autoPlay: true,
                          cameraControls: false,
                        ),
                        ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            scaffoldBackgroundColor,
                            BlendMode.srcOut,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  backgroundBlendMode: BlendMode.dstOut,
                                ), // This one will handle background + difference out
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 0),
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PROFILE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor
                    ),
                  ),
                  const Text(
                    'Elina',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text('16 year old', style: TextStyle(color: textColor.withOpacity(.8)),)
                ],
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomAchievementListTile(
                  tileColor: ring1Color,
                  image: 'fire',
                  title: 'Calories',
                  value: '2,000',
                ),
                CustomAchievementListTile(
                  tileColor: ring2Color,
                  image: 'foot',
                  title: 'Steps',
                  value: '3,500',
                ),
                CustomAchievementListTile(
                  tileColor: ring3Color,
                  image: 'moon',
                  title: 'Sleep',
                  value: '8h',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomAchievementListTile extends StatelessWidget {
  const CustomAchievementListTile({
    super.key,
    required this.tileColor,
    required this.image,
    required this.title,
    required this.value,
  });

  final Color tileColor;
  final String image;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Color.fromARGB(255, 235, 233, 233)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/$image.png',
                  width: 24,
                ),                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                ),
              ],
            ),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
