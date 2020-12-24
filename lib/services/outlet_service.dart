import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';
import 'package:quiz_flutter/models/mdt_api/user_defined_functions/qst.udf_outlets_with_distance.dart';

class OutletService {
  MdtApiClient _mdtApiClient;

  OutletService() {
    _mdtApiClient = sl<MdtApiClient>();
  }

  Future<List<MdtApiOutletWithDistance>> getNearestOutlets() async {
    return _mdtApiClient
        .fetch(
          query: Query(
            select: [
              'Distance',
              'FlagQuestionnairesEmpty',
              'ID_Outlet/ID',
              'ID_Outlet/Code',
              'ID_Outlet/Name',
              'ID_Outlet/ID_OutletChain/NameShort',
              'ID_Outlet/ID_OutletChain/ID_Parent/NameShort',
              'ID_Outlet/ID_OutletFormat/Name',
              'ID_Outlet/Address',
              'ID_Outlet/Positions/ID_Employee/*',
              'ID_Outlet/Positions/PostLevel',
              'ID_Outlet/ID_OutletType/*',
              'ID_Outlet/Positions/ID_BindingFunction/*',
              'ID_VisitLast/DateBegin',
              'ID_VisitLast/DateEnd',
              'ID_VisitLast/DateSubmitLocal',
              'ID_VisitLast/ID_em_Employee/Name'
            ],
            params: '[54.7137581, 20.5271002, 1000]',
            sorting: [QuerySorting(path: 'Distance', asc: false)],
          ),
          table: 'qst.udf_OutletsWithDistance',
        )
        .then((fetchResult) => _prepareOutlet(fetchResult.records));
  }

  List<MdtApiOutletWithDistance> _prepareOutlet(List<dynamic> records) {
    return records.map(
      (record) {
        return MdtApiOutletWithDistance.fromJson(record);
      },
    ).toList();
  }
}
