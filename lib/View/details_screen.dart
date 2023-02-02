import 'package:covitracer/View/world_stats.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String countryName;
  final String countryImage;
  final int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered, test;
  const DetailsScreen({
    super.key,
    required this.countryName,
    required this.countryImage,
    required this.todayRecovered,
    required this.critical,
    required this.active,
    required this.test,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      ReusableRow(title: 'Total', value: widget.totalCases.toString()),
                      ReusableRow(title: 'Recovered', value: widget.totalRecovered.toString()),
                      ReusableRow(title: 'Deaths', value: widget.totalDeaths.toString()),
                      ReusableRow(title: 'Active', value: widget.active.toString()),
                      ReusableRow(title: 'Critical', value: widget.critical.toString()),
                      ReusableRow(title: 'Today Recovered', value: widget.todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.countryImage),
                radius: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
