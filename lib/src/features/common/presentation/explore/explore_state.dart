import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/domain/event.dart';

class ExploreState {
  final AsyncValue<List<Event>?> eventValue;
  final List<Event>? event;
  final String query;
  final String? categoryFilter;
  final String? startDateFilter;
  final String? endDateFilter;
  final String? locationFilter;
  final String? cityFilter;

  const ExploreState({
    this.eventValue = const AsyncLoading(),
    this.event,
    this.query = '',
    this.categoryFilter,
    this.startDateFilter,
    this.endDateFilter,
    this.locationFilter,
    this.cityFilter,
  });

  ExploreState copyWith({
    AsyncValue<List<Event>?>? eventValue,
    List<Event>? event,
    String? query,
    String? categoryFilter,
    String? startDateFilter,
    String? endDateFilter,
    String? locationFilter,
    String? cityFilter,
  }) {
    return ExploreState(
      eventValue: eventValue ?? this.eventValue,
      event: event ?? this.event,
      query: query ?? this.query,
      categoryFilter: categoryFilter ?? this.categoryFilter,
      startDateFilter: startDateFilter ?? this.startDateFilter,
      endDateFilter: endDateFilter ?? this.endDateFilter,
      locationFilter: locationFilter ?? this.locationFilter,
      cityFilter: cityFilter ?? this.cityFilter,
    );
  }
}
