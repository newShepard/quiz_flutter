import 'package:flutter/material.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/services/outlet_service.dart';

class OutletsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var outletService = sl<OutletService>();
    return FutureBuilder(
      future: outletService.getNearestOutlets(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int idx) {
              var outlet = snapshot.data[idx].outlet;
              return ListTile(
                isThreeLine: true,
                title: Text(outlet.code),
                subtitle: Text(outlet.address),
                trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                //trailing: ,
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
