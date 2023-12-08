import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class CharacterMovin extends StatefulWidget {
  const CharacterMovin({super.key});

  @override
  State<CharacterMovin> createState() => _CharacterMovinState();
}

class _CharacterMovinState extends State<CharacterMovin>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> rotationValueNotifier =
      ValueNotifier<double>(0.0);
  O3DController? controller;

  late AnimationController _animationController;
  late Animation<double> _animation;

  double camera = 0.5;

  @override
  void initState() {
    super.initState();

    controller = O3DController();

    // Create an animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    // Create a Tween for the animation
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    // Start the animation
    listenAnimation();
  }

  void listenAnimation() {
    _animationController.addListener(() {
      controller!.cameraTarget(_animation.value, 1.15, 0);
    });
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
              return O3D(
                controller: controller,
                autoPlay: true,
                autoRotate: false,
                cameraControls: false,
                src:
                    'assets/three_object/elinalise_dragonroad_musyoku_tensei.glb',
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
