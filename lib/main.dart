import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Field With country code"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'BD',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),

              const SizedBox(height: 10,),

              //csc picker country, states, and cities
              CSCPicker(
                onCountryChanged: (country) {
                  setState(() {
                    countryValue = country;
                  });
                },
                onStateChanged:(state) {
                  setState(() {
                    stateValue = state.toString();
                  });
                },
                onCityChanged:(city) {
                  setState(() {
                    cityValue = city.toString();
                  });
                },
              ),

              TextButton(
                  onPressed: () {
                    setState(() {
                      address = "$countryValue,$stateValue, $cityValue";
                    });
                  },
                  child: const Text("Print Data")),
              Text(address),



            ],
          ),
        ),
      ),
    );
  }
}
