import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen> with TickerProviderStateMixin{


  late final AnimationController _controller =
  AnimationController(vsync: this, duration: const Duration(seconds: 3))
    ..repeat();

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color> [
    const Color(0xff3C6255),
    const Color(0xff61876E),
    const Color(0xffEAE7B1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              PieChart(
                  dataMap: {
                    'Total': 25000,
                    'Recovered': 5000,
                    'Deaths': 6900
                  },
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.left,
                  legendTextStyle: GoogleFonts.sourceSans3(textStyle: const TextStyle(color: Colors.black, fontSize: 15.5)),
                ),
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width/2.5,
                chartValuesOptions: ChartValuesOptions(
                  chartValueStyle: GoogleFonts.sourceSans3(textStyle: const TextStyle(color: Colors.black, fontSize: 15.5),),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              Card(
                child: Column(
                  children: [
                    ReusableRow(title: 'Total', value: '200'),
                    ReusableRow(title: 'Recovered', value: '200'),
                    ReusableRow(title: 'Total', value: '200'),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              SizedBox(
                height: 60,
                width: 250,
                child: FilledButton(
                    onPressed: (){}, child: const Text('Country Specific Stats', style: const TextStyle(fontSize: 16.5),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0, bottom: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 5.0,),
          // const Divider(color: Colors.grey, thickness: 0.2),
        ],
      ),
    );
  }
}
