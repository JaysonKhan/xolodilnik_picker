import 'package:flutter_bloc/flutter_bloc.dart' show EventTransformer;
import 'package:rxdart/rxdart.dart';

EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
    (events, mapper) => events.debounceTime(duration).flatMap(mapper);
