import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api_integration/controller/global_controller.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  void initState() {
    Provider.of<GlobalController>(context, listen: false).getGlobal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GlobalController>().getGlobal();
        },
      ),
      body: Column(
        children: [
          Consumer<GlobalController>(builder: (context, providerobje, child) {
            return Center(
              child: Column(
                children: [
                  Text(providerobje.obj?.chartName ?? "character name"),
                  Text(providerobje.obj?.bpi.toString() ?? "bpi"),
                  Text(providerobje.obj?.disclaimer ?? "disclaimer"),
                  Text(providerobje.obj?.time.toString() ?? "time"),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
