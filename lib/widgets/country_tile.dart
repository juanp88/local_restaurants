import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final String name;
  final String capital;

  CountryTile({Key? key, required this.name, required this.capital})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 25, overflow: TextOverflow.visible),
                      ),
                    ),
                    Text(
                      capital,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
