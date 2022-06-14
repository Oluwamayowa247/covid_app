import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  const MostAffectedPanel({Key? key, required this.countryData})
      : super(key: key);
  final List countryData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: EdgeInsets.zero,
    
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Image.network(
                    countryData[index]['countryInfo']['flag'],
                    height: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                countryData[index]['country'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Text('Deaths : ' + countryData[index]['deaths'].toString(),
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ],
        );
      },
      itemCount: 5,
    );
  }
}
