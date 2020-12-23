import 'package:flutter/material.dart';

class VisitedOutletsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(itemBuilder: (BuildContext context, int idx) {
        return Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('ListItem:'), Text('$idx')],
          ),
        );
      }),
    );
  }
}
