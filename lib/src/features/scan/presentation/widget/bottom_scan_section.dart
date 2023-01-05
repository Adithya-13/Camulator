
import 'package:camulator/gen/assets.gen.dart';
import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomScanSection extends ConsumerWidget {
  const BottomScanSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(scanControllerProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Assets.svgs.settingIcon.svg(
          width: SizeApp.w36,
          fit: BoxFit.fitWidth,
        ),
        InkWell(
          onTap: () async {
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            scaffoldMessenger.clearSnackBars();
            final text = await controller.onTextRecognition();
            scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text(
                  text ?? '',
                ),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorApp.darkGreen,
                ),
                height: SizeApp.h72,
                width: SizeApp.h72,
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorApp.primary,
                ),
                height: SizeApp.h56,
                width: SizeApp.h56,
              ),
            ],
          ),
        ),
        Assets.svgs.galleryIcon.svg(
          width: SizeApp.w36,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
