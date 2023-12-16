import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/data/common_repository.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';
import 'package:meetzy/src/features/common/domain/my_events.dart';
import 'package:meetzy/src/services/local/hive_service.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';

import 'package:meetzy/src/services/remote/result.dart';

class CommonService {
  final CommonRepository _commonRepository;
  final HiveService _hiveService;

  CommonService(this._commonRepository, this._hiveService);

  Future<Result<List<EventResponse>>> fetchAllEvents() async {
    final resultEvents = await _commonRepository.fetchEvents();
    return resultEvents;
  }

  // Future<Result<MyEvents>> getMyEvents() async {
  //   String? token = _hiveService.getToken();

  //   if (token == null) {
  //     return Result.failure(
  //       const NetworkExceptions.notFound('Token is null'),
  //       StackTrace.current,
  //     );
  //   }

  //   final result = await _commonRepository.fetchMyEvents(token);
  //   // return CommonMapper.mapToMyEvents(result);
  // }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);
  final hiveService = ref.read(hiveServiceProvider);

  return CommonService(commonRepository, hiveService);
});
