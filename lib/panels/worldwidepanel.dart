import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  const WorldwidePanel({Key? key, required this.worldData}) : super(key: key);
  final Map worldData;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2,
          ),
          children: [
            StatusPanel(
              title: 'TODAY CASES',
              panelColor: Colors.grey.shade300,
              count: worldData['todayCases'].toString(),
            ),
            StatusPanel(
              title: 'CRITICAL CASES',
              panelColor: Colors.blue.shade200,
              count: worldData['critical'].toString(),
            ),
            StatusPanel(
                title: 'RECOVERED',
                panelColor: Colors.green.shade200,
                count: worldData['recovered'].toString()),
            StatusPanel(
                title: 'DEATHS',
                panelColor: Colors.red.shade300,
                count: worldData['deaths'].toString()),
          ],
        ));
  }
}

class StatusPanel extends StatelessWidget {
  const StatusPanel(
      {Key? key,
      required this.panelColor,
      required this.title,
      required this.count})
      : super(key: key);
  final Color panelColor;

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: panelColor,
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
