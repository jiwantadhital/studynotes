// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OTPprocessEvent extends OtpEvent {
  String num;
  OTPprocessEvent({
    required this.num,
  });
  @override
  List<Object> get props => [num];
}
