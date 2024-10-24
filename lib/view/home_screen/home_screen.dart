import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api_integration/controller/fact_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Consumer<FactScreenController>(
                  builder: (context, providerobj, child) =>
                      providerobj.isLoading
                          ? CircularProgressIndicator()
                          : //Text(providerobj.catFact.toString()),
                          Column(
                              children: [
                                Text(providerobj.resobj?.fact ?? "no data"),
                                Text(providerobj.resobj?.length.toString() ??
                                    "no data")
                              ],
                            ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FactScreenController>().getFact();
        },
        backgroundColor: Colors.amber,
      ),
    );
  }
}
