part of 'donor_bloc.dart';

enum DonorStateVal { initial, loading, success, error }

extension DonorStateValX on DonorStateVal {
  bool get isInitial => this == DonorStateVal.initial;
  bool get isLoading => this == DonorStateVal.loading;
  bool get isSuccess => this == DonorStateVal.success;
  bool get isError => this == DonorStateVal.error;
}

class DonorState {
  final List<UserModel> donors;
  final DonorStateVal donorState;
  final String? errorMessage;

  DonorState({
   this.donors = const [],
    this.donorState = DonorStateVal.initial,
    this.errorMessage,
  });

  DonorState copyWith({
    List<UserModel>? donors,
    DonorStateVal? donorState,
    String? errorMessage,
  }) {
    return DonorState(
      donors: donors ?? this.donors,
      donorState: donorState ?? this.donorState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  List<Object?> get props => [donors, donorState, errorMessage];
}
