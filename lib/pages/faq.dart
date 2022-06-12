import 'package:covid_app/utils/datasource.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return ExpansionTile(
            title: Text(DataSource.questionAnswers[index]['question'], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold), ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(DataSource.questionAnswers[index]['answer'], style: TextStyle(fontSize: 18),),
              )
            ],
          );
        }),
        itemCount: 11,
      ),
    );
  }
}
