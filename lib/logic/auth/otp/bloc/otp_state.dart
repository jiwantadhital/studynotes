// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();
  
  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}
class OtpLoading extends OtpState {}
class OtpDone extends OtpState {}
class OtpError extends OtpState {
  String message;
  OtpError({
    required this.message,
  });
}
