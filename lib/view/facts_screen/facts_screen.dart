import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api_integration/controller/facts_screen_controller.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({super.key});

  @override
  State<FactsScreen> createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<FactsScreenController>().getFacts();
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FactsScreenController>().getFacts();
        },
      ),
      body: Consumer<FactsScreenController>(
        builder: (context, factsprovider, child) => ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(factsprovider.dataList![index].fact.toString()),
              );
            },
            itemCount: factsprovider.dataList?.length),
      ),
    );
  }
}
