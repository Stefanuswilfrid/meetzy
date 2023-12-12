import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/data/common_repository.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';

import 'package:meetzy/src/services/remote/result.dart';

class CommonService {
  final CommonRepository _commonRepository;

  CommonService(this._commonRepository);

  Future<Result<List<EventResponse>>> fetchAllEvents() async {
    final resultEvents = await _commonRepository.fetchEvents();
    return resultEvents;
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);

  return CommonService(commonRepository);
});
