import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../../../routes/app_pages.dart';
import '../../../widgets/custom_card/custom_card.dart';
import '../../../widgets/custom_ink_well/c_inkwell.dart';
import 'call_solver_statistics_screen_controller.dart';

class CallSolverStatisticsScreen
    extends GetView<CallSolverStatisticsScreenController> {
  const CallSolverStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísticas dos chamados'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              addVerticalSpace(15),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: controller.isDateFieldVisible.value,
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: cInkWell(
                              40,
                              45,
                              Icons.edit_calendar_outlined,
                              Icons.edit_calendar_rounded,
                              Get.theme.colorScheme.primary,
                              null,
                              'Selecionar Data',
                              () => controller.setDate())),
                    ),
                    addHorizontalSpace(10),
                    SegmentedButton(
                      segments: controller.dateSegments,
                      selected: {controller.selectedDate.value},
                      onSelectionChanged: (value) {
                        controller.selectedDate.value = value.first;
                        controller.isDateFieldVisible.value =
                            controller.selectedDate.value.contains('diario');
                        switch (controller.selectedDate.value) {
                          case 'diario':
                            controller.dataMapGeral.value = controller.dataMap;
                            break;
                          case 'mensal':
                            controller.dataMapGeral.value =
                                controller.dataMapMensal;
                            break;
                          default:
                            controller.dataMapGeral.value =
                                controller.dataMapAnual;
                        }
                      },
                    ),
                    addHorizontalSpace(10),
                    SegmentedButton(
                      segments: controller.groupSegments,
                      selected: {controller.selectedGroup.value},
                      onSelectionChanged: (value) {
                        controller.selectedGroup.value = value.first;
                      },
                    ),
                  ],
                ),
              ),
              addVerticalSpace(10),
              Obx(
                () => Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: 121,
                    child: Expanded(
                      child: CarouselSlider(
                        items: controller.imgList,
                        carouselController: controller.carouselC,
                        options: CarouselOptions(
                            height: 120,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.1,
                            viewportFraction: 0.3,
                            onPageChanged: (index, reason) {
                              controller.setCarousel(index);
                            }),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            controller.carouselC.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Get.theme.primaryColorLight
                                      : Get.theme.primaryColor)
                                  .withOpacity(
                                      controller.current.value == entry.key
                                          ? 0.9
                                          : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ]),
              ),
              Wrap(
                children: [
                  Column(
                    children: [
                      CustomCard.customClickableCard(
                        content: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Chamados Abertos',
                                  style: Get.textTheme.bodyMedium,
                                )),
                            Text(
                              '8',
                              style: Get.textTheme.displayLarge,
                            ),
                          ],
                        ),
                        function: () => Get.toNamed(AppRoutes.callStatus),
                      ),
                      CustomCard.customClickableCard(
                        content: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Chamados em Emergencia ',
                                  style: Get.textTheme.bodyMedium,
                                )),
                            Text(
                              '3',
                              style: Get.textTheme.displayLarge,
                            ),
                          ],
                        ),
                        function: () => Get.toNamed(AppRoutes.callStatus),
                      ),
                      CustomCard.customClickableCard(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Chamados Finalizados Hoje',
                                  style: Get.textTheme.bodyMedium,
                                )),
                            Text(
                              '1',
                              style: Get.textTheme.displayLarge,
                            ),
                          ],
                        ),
                        function: () => Get.toNamed(AppRoutes.callStatus),
                      ),
                      CustomCard.customClickableCard(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Movimentações realizadas',
                                  style: Get.textTheme.bodyMedium,
                                )),
                            Text(
                              '12',
                              style: Get.textTheme.displayLarge,
                            ),
                          ],
                        ),
                        function: () => Get.toNamed(AppRoutes.callStatus),
                      ),
                    ],
                  ),
                  CustomCard.customClickableCard(
                    height: 500,
                    width: 400,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Quantidade de chamados por Status',
                              style: Get.textTheme.bodyMedium,
                            )),
                        Obx(
                          () => PieChart(
                            dataMap: controller.dataMapGeral.value,
                            animationDuration: Duration(milliseconds: 300),
                            chartLegendSpacing: 32,
                            chartRadius: 300,
                            colorList: controller.colorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 32,
                            legendOptions: const LegendOptions(
                              showLegendsInRow: true,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    function: () => Get.toNamed(AppRoutes.callStatus),
                  ),
                  Column(
                    children: [
                      CustomCard.customClickableCard(
                        height: 200,
                        width: 350,
                        content: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Tempo Médio de Conclusão',
                                  style: Get.textTheme.bodyMedium,
                                )),
                            CircularPercentIndicator(
                              radius: 80.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.4,
                              center: const Text(
                                "10 hours",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Get.theme.primaryColorLight,
                              progressColor: Get.theme.primaryColor,
                            ),
                          ],
                        ),
                        function: () => Get.toNamed(AppRoutes.callStatus),
                      ),
                      CustomCard.customClickableCard(
                        height: 280,
                        width: 350,
                        content: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Quantidade de chamados abertos por hora',
                                  style: Get.textTheme.bodyMedium,
                                )),
                            SfSparkLineChart(
                              trackball: const SparkChartTrackball(
                                  activationMode: SparkChartActivationMode.tap),
                              marker: const SparkChartMarker(
                                  displayMode: SparkChartMarkerDisplayMode.all),
                              labelDisplayMode: SparkChartLabelDisplayMode.all,
                              data: const <double>[
                                1,
                                2,
                                0,
                                0,
                                1,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1,
                                1,
                                1,
                                0,
                                0,
                                1
                              ],
                            ),
                          ],
                        ),
                        function: () => Get.toNamed(AppRoutes.callStatus),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
