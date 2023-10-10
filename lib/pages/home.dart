import 'package:flutter/material.dart';
import 'package:flutter_three_challenge/core/constants.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

import '../core/providers/character_movin_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .65,
                height: MediaQuery.sizeOf(context).height * .65,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      bottom: -40,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(45.0),
                        child: const SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                            strokeWidth: 20,
                            value: .85,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(45.0),
                        child: const SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator(
                            strokeWidth: 10,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * .62,
                        child: const ModelViewer(
                          src:
                              'assets/three_object/elinalise_dragonroad_musyoku_tensei.glb',
                          autoRotate: false,
                          autoPlay: true,
                          cameraControls: false,
                          touchAction: TouchAction.none,
                          orientation: "0deg 0deg 0deg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DAILY GOAL',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(color: textColor),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '78',
                          style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '%',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AchievementWidget(
                    image: 'fire',
                    value: '1,840',
                    title: 'calories',
                    imageWidth: 24,
                  ),
                  const AchievementWidget(
                    image: 'foot',
                    value: '3,248',
                    title: 'steps',
                    imageWidth: 24,
                  ),
                  const AchievementWidget(
                    image: 'moon',
                    value: '6,5',
                    title: 'hours',
                    imageWidth: 24,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class AchievementWidget extends StatelessWidget {
  const AchievementWidget(
      {super.key,
      required this.image,
      required this.value,
      required this.title,
      this.imageWidth});

  final String image;
  final String value;
  final String title;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              'assets/images/$image.png',
              width: imageWidth ?? 32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: textColor),
                ),
                Text(
                  title,
                  style: TextStyle(color: textColor.withOpacity(.7)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
