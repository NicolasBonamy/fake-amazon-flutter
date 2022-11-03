import 'package:flutter/material.dart';

const List<int> list = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class DropdownButtonCustom extends StatefulWidget {
  const DropdownButtonCustom({super.key});

  @override
  State<DropdownButtonCustom> createState() => _DropdownButtonCustomState();
}

class _DropdownButtonCustomState extends State<DropdownButtonCustom> {
  int dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 60,
      width: 110,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: InputDecorator(
        decoration: const InputDecoration(border: OutlineInputBorder()),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            isDense: true,
            isExpanded: true,
            value: dropdownValue,
            //icon: const Icon(Icons.arrow_downward),
            onChanged: (int? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('Qté: $value'),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
