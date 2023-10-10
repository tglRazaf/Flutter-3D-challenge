import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CharacterMovin extends StatefulWidget {
  const CharacterMovin({super.key});

  @override
  State<CharacterMovin> createState() => _CharacterMovinState();
}

class _CharacterMovinState extends State<CharacterMovin>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> rotationValueNotifier =
      ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    animateRotation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .62,
          width: MediaQuery.sizeOf(context).width * .65,
          child: AnimatedBuilder(
            animation: rotationValueNotifier,
            builder: (context, child) {
              return ModelViewer(
                src:
                    'assets/three_object/elinalise_dragonroad_musyoku_tensei.glb',
                autoRotate: false,
                autoPlay: true,
                cameraControls: false,
                orientation: "0deg 0deg ${rotationValueNotifier.value}deg",
              );
            },
          ),
        ),
      ),
    );
  }

  void animateRotation() {
    final AnimationController controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    final Animation<double> rotationAnimation = Tween<double>(
      begin: 0,
      end: 90,
    ).animate(controller);

    controller.forward();

    rotationAnimation.addListener(() {
      rotationValueNotifier.value = rotationAnimation.value;
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      }
    });
  }

  @override
  void dispose() {
    rotationValueNotifier.dispose();
    super.dispose();
  }
}
