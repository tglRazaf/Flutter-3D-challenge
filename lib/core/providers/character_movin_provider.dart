import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class CharacterMovinProvider extends ChangeNotifier {
  final controller = O3DController();

  late AnimationController animationController;
  late AnimationController orbitAnimationController;
  late Animation<double> _animation;
  late Animation<double> _orbitAnimation;

  void init(TickerProvider vsync) {
    initCameraTargetAnimation(vsync);
    initCameraOrbitAnimation(vsync);
  }

  void initCameraTargetAnimation(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: vsync,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: .5,
    ).animate(animationController);

    listenCameraTargetAnimation();
  }

  void listenCameraTargetAnimation() {
    animationController.addListener(() {
      controller.cameraTarget(_animation.value, 0.9, -0.25);
    });
  }

  void initCameraOrbitAnimation(TickerProvider vsync) {
    orbitAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    );

    _orbitAnimation = Tween<double>(
      begin: 0.0,
      end: 50,
    ).animate(orbitAnimationController);
    listenCameraOrbitAnimation();
  }

  void listenCameraOrbitAnimation() {
    orbitAnimationController.addListener(() {
      controller.cameraOrbit(-_orbitAnimation.value, 75, 105);
    });
  }

  void reverseAnimation() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (animationController.status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  void reverseOrbitAnimation() {
    if (orbitAnimationController.status == AnimationStatus.completed) {
      orbitAnimationController.reverse();
    } else if (orbitAnimationController.status == AnimationStatus.dismissed) {
      orbitAnimationController.forward();
    }
  }
}
