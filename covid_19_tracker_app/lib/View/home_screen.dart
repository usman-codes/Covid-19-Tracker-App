import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final colorList = <Color>[
    const Color(0xFF4285F4),
    const Color(0xFF1aa260),
    const Color(0xFFde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PieChart(
                dataMap: const {
                  "Total": 20,
                  "Recovered": 15,
                  "Deaths": 5,
                },
                chartRadius: MediaQuery.of(context).size.width / 2.3,
                legendOptions:
                    const LegendOptions(legendPosition: LegendPosition.left),
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.disc,
                colorList: colorList,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .05),
                  child: Column(
                    children: [
                      reuserow(title: "Total", value: "20"),
                      reuserow(title: "Recovered", value: "15"),
                      reuserow(title: "Death", value: "5")
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF1aa260),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text("Track Countires")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class reuserow extends StatelessWidget {
  String title, value;
  reuserow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider()
        ],
      ),
    );
  }
}
