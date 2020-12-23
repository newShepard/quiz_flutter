import 'package:flutter/material.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/mdt_api/outlet.dart';
import 'package:quiz_flutter/services/outlet_service.dart';

class OutletsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var outletService = sl<OutletService>();
    return Center(
      child: FutureBuilder(
          future: outletService.getNearestOutlets(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.records?.length,
                  itemBuilder: (BuildContext context, int idx) {
                    var outlet = MdtApiOutlet.fromJson(
                        snapshot.data?.records[idx]['id_Outlet\$']);
                    return ListTile(
                      isThreeLine: true,
                      title: Text(outlet.code),
                      subtitle: Text(outlet.address),
                      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                      //trailing: ,
                    );
                  });
            }
          }),
    );
  }
}
