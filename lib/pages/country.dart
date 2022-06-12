import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData = [];
//asynchronous call to make to the api to get data for country data
  fetchcountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries'));

    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  // Make a call to the Api for world and country data
  @override
  void initState() {
    fetchcountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Country Stats',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: countryData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: countryData.length,
              itemBuilder: ((context, index) {
                return Container(
                  height: 130,
                  margin: const EdgeInsets.all(10),
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 202, 198, 198),
                        blurRadius: 10,
                        offset: Offset(0, 15)),
                  ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              countryData[index]['country'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              countryData[index]['countryInfo']['flag'],
                              height: 50,
                              width: 80,
                            )
                          ],
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'CONFIRMED : ' +
                                  countryData[index]['cases'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                                'RECOVERED : ' +
                                    countryData[index]['recovered'].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                            Text(
                                'ACTIVE : ' +
                                    countryData[index]['active'].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            Text(
                                'DEATHS : ' +
                                    countryData[index]['deaths'].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              }),
            ),
    );
  }
}
