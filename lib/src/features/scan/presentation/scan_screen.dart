import 'package:camulator/src/features/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen>
    with WidgetsBindingObserver {
  ScanController get controller => ref.read(scanControllerProvider.notifier);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      controller.handleLifecycleCamera(state);

  @override
  void initState() {
    //TODO: still technical debt, to set initial left and top offset
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 200)).then(
        (value) => controller.setLeftAndTop(context),
      );
      controller.setLeftAndTop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(scanControllerProvider);
    final calculationState = ref.watch(calculationControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                if (!state.isCameraPermissionGranted) {
                  return PermissionSection(controller: controller);
                }
                if (!state.isCameraInitialized) return Container();

                return const CameraSection();
              },
            ),
            if (calculationState.result != null)
              const Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: ResultWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
