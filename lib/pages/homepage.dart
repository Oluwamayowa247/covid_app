import 'dart:convert';
import 'package:covid_app/pages/country.dart';
import 'package:covid_app/panels/infopanel.dart';
import 'package:covid_app/panels/mostaffectedpanel.dart';
import 'package:covid_app/panels/worldwidepanel.dart';
import 'package:covid_app/utils/datasource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // To get the world Data
  Map worldData = <String, int>{};

//asynchronous call to make to the api to get data for world data
  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/all'));

    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

// To get the affected Country Data

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
    fetchWorldWideData();
    fetchcountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'COVID-19 TRACKER',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              height: 100,
              color: Colors.pink.shade50,
              child: Text(
                '  ' + DataSource.quote,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "WORLDWIDE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "Countries",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : WorldwidePanel(
                    worldData: worldData,
                  ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Most Affected Countries",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
           const  SizedBox(
                    height: 5,
                  ),
            countryData.isEmpty
                ?  Container()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),
                 const SizedBox(
                    height: 5,
                  ),
                  const InfoPanel(),
                 const SizedBox(
                   height: 20,
                 ),
                const Center(child:  Text('WE ARE IN THIS TOGETHER 💪 ... ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                const SizedBox(
                   height: 20,
                 ),
                 
          ],
        ),
      ),
    );
  }
}
