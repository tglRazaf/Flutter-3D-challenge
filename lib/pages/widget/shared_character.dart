import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:provider/provider.dart';

import '../../core/providers/character_movin_provider.dart';

class SharedCharacter extends StatefulWidget {
  const SharedCharacter({super.key});

  @override
  State<SharedCharacter> createState() => _SharedCharacterState();
}

class _SharedCharacterState extends State<SharedCharacter>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<CharacterMovinProvider>(context, listen: false).init(this);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Provider.of<CharacterMovinProvider>(context, listen: false)
          .orbitAnimationController,
      builder: (context, child) {
        return O3D(
          controller:
              Provider.of<CharacterMovinProvider>(context, listen: false)
                  .controller,
          autoPlay: true,
          autoRotate: false,
          cameraControls: false,
          cameraTarget: CameraTarget(0, 0.9, -0.25),
          src: 'assets/three_object/elinalise_dragonroad_musyoku_tensei.glb',
        );
      },
    );
  }

  @override
  void dispose() {
    Provider.of<CharacterMovinProvider>(context, listen: false)
        .animationController
        .dispose();
    super.dispose();
  }
}
