import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  late StreamSubscription<List<ConnectivityResult>> subscription;
  final Connectivity connectivity;
  bool isFirstTime = true;

  InternetBloc(this.connectivity)
      : super(const InternetState(
          status: FormzSubmissionStatus.initial,
        )) {
    subscription = connectivity.onConnectivityChanged.listen((event) {
      if (!isFirstTime) {
        if (event.contains(ConnectivityResult.wifi) ||
            event.contains(ConnectivityResult.mobile) ||
            event.contains(ConnectivityResult.ethernet) ||
            event.contains(ConnectivityResult.vpn)) {
          add(ConnectionChanged(isConnected: true));
        } else {
          add(ConnectionChanged(isConnected: false));
        }
      } else {
        isFirstTime = false;
      }
    });
    on<ConnectionChanged>((event, emit) {
      emit(state.copyWith(isConnected: event.isConnected));
    });
    on<CheckConnectionEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.ethernet) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        if (event.onSuccess != null) {
          event.onSuccess!();
        }
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
        add(ConnectionChanged(isConnected: false));
        if (event.onSuccess != null) {
          event.onError!();
        }
      }
    });
  }

  @override
  Future<void> close() async {
    await subscription.cancel();
    return super.close();
  }
}
