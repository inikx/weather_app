import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectCityPage extends StatefulWidget {
  const SelectCityPage({super.key});

  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Text("Select city", style: Theme.of(context).textTheme.headline1));
  }
}
