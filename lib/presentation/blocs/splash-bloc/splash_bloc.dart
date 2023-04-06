import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safe_device/safe_device.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is SplashScreenStarted) {
        emit(SplashLoading());

        bool isRealDevice = await SafeDevice.isRealDevice;
        bool isJailBroken = await SafeDevice.isJailBroken;

        await Future.delayed(Duration(seconds: 3));

        if (!isRealDevice) {
          emit(SplashFailed(message: 'Emulator has been detetected'));
        } else if (isJailBroken) {
          emit(SplashFailed(
              message:
                  'Root has detected, this device cannot be access this app'));
        } else {
          emit(SplashSuccess());
        }
      }
    });
  }
}
