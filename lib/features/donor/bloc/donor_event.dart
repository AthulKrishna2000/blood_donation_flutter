part of 'donor_bloc.dart';

sealed class DonorEvent extends Equatable {
  const DonorEvent();

  @override
  List<Object> get props => [];
}

class LoadDonorsEvent extends DonorEvent {}

class FilterDonorsEvent extends DonorEvent {
  final String bloodGroup;

  const FilterDonorsEvent({required this.bloodGroup});

  @override
  List<Object> get props => [bloodGroup];
}
