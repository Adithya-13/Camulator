import 'package:auto_size_text/auto_size_text.dart';
import 'package:camulator/src/common_widgets/common_widgets.dart';
import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:camulator/src/utils/utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      renderPanelSheet: false,
      slideDirection: SlideDirection.DOWN,
      snapPoint: 0.99,
      isDraggable: true,
      backdropEnabled: true,
      minHeight: SizeApp.customHeight(context.screenHeightPercentage(0.16)),
      maxHeight: SizeApp.customHeight(context.screenHeightPercentage(0.76)),
      collapsed: const _ResultCollapsedSection(),
      panel: const _ResultPanelSection(),
    );
  }
}

class _ResultPanelSection extends ConsumerWidget {
  const _ResultPanelSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculationState = ref.watch(calculationControllerProvider);
    final calculationController =
        ref.read(calculationControllerProvider.notifier);
    return Container(
      decoration: BoxDecoration(
          color: ColorApp.black,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: ColorApp.white.withOpacity(0.2),
            ),
          ]),
      margin: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: calculationState.operations.length,
              padding: EdgeInsets.only(
                left: SizeApp.w20,
                right: SizeApp.w20,
                top: SizeApp.h20,
              ),
              itemBuilder: (context, operationIndex) {
                final operation = calculationState.operations[operationIndex];
                return Column(
                  children: [
                    ...operation.numbers.mapIndexed((index, number) {
                      return OperationListTileWidget(
                        operator: operation.operator,
                        number: number,
                        onDelete: () {
                          calculationController.deleteNumber(
                            operationIndex,
                            index,
                          );
                        },
                      );
                    }).toList(),
                    OperationListTileWidget(
                      operator: Operator.result,
                      number: operation.totalOperation,
                      onDelete: () {},
                    ),
                  ],
                );
              },
            ),
          ),
          Gap.h20,
          const SnapperWidget(),
          Gap.h20,
        ],
      ),
    );
  }
}

class _ResultCollapsedSection extends ConsumerWidget {
  const _ResultCollapsedSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculationState = ref.watch(calculationControllerProvider);
    final calculationController =
        ref.read(calculationControllerProvider.notifier);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeApp.h12,
        horizontal: SizeApp.h20,
      ),
      decoration: const BoxDecoration(
        color: ColorApp.black,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(SizeApp.h8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Operator.result.color,
                ),
                height: SizeApp.h32,
                width: SizeApp.h32,
                child: Operator.result.asset,
              ),
              Gap.w16,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AutoSizeText(
                      calculationState.result?.toThousandFormat ?? '',
                      style: TypographyTheme.title,
                      maxLines: 1,
                    ),
                    Gap.h4,
                    if (calculationState.addedNumber != null)
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(SizeApp.h4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: calculationState.prevOperator.color,
                            ),
                            height: SizeApp.h16,
                            width: SizeApp.h16,
                            child: calculationState.prevOperator.asset,
                          ),
                          Gap.w4,
                          Expanded(
                            child: Text(
                              calculationState.addedNumber?.toThousandFormat ??
                                  '',
                              style: TypographyTheme.caption,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Gap.w12,
              Align(
                alignment: Alignment.center,
                child: CloseButtonWidget(
                  onTap: calculationController.reset,
                ),
              ),
            ],
          ),
          Gap.h12,
          const SnapperWidget(),
        ],
      ),
    );
  }
}
