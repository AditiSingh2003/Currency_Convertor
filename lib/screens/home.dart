import 'package:currency_convertor/functions/fetchrates.dart';
import 'package:currency_convertor/models/ratesmodel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<RatesModel> result;
  // late Future<Map> allcurrency;
  final formkey =GlobalKey<FormState>();

  @override

  void initState() {
    super.initState();
    result = fetchrates();
  }

  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text("Currency Convertor"),
        centerTitle: true,
      ),
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.only(top: 65, left: 15, right: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/demo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(key: formkey,
            child: FutureBuilder<RatesModel>(
              future: result,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  // Perform null check on snapshot.data
                  final rates = snapshot.data!.rates;
                  return Center(
                    child: Text(rates.toString()),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                return Container(); // Return an appropriate fallback widget if necessary
              },
            ),
          ),
        ),
      ),
    );
  }
}
