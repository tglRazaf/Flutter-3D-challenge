import 'package:flutter/material.dart';
import 'package:flutter_three_challenge/core/constants.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'widget/character_movin.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Stack(
        children: [
          const CharacterMovin(),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'JOURNAL',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const Text(
                  '13',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  'July 2023',
                  style: TextStyle(
                    color: textColor.withOpacity(.8),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(16),
              width: MediaQuery.sizeOf(context).width-32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 252, 252, 252)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.all(8).copyWith(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/location.png'),
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('10:42'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Morning walk',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: textColor),
                      ),
                      Text('2Km in 30mins')
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
