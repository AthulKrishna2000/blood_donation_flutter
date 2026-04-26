import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/donor/bloc/donor_bloc.dart';
import 'package:blood_donation_app/features/donor/widgets/blood_group_filter_widget.dart';
import 'package:blood_donation_app/features/donor/widgets/doner_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonorListingScreen extends StatefulWidget {
  const DonorListingScreen({super.key});

  @override
  State<DonorListingScreen> createState() => _DonorListingScreenState();
}

class _DonorListingScreenState extends State<DonorListingScreen> {
  @override
  void initState() {
    super.initState();
    // Load donors when the screen is initialized
    context.read<DonorBloc>().add(LoadDonorsEvent());
  }

  List<String> bloodGroups = [
    "All",
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
  ];
  String selectedBloodGroup = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Donor Listing",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<DonorBloc, DonorState>(
              builder: (context, state) {
                if (state.donorState == DonorStateVal.loading) {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(
                        height: 56,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bloodGroups.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: BloodGroupFilterWidget(
                                color:
                                    state.selectedBloodGroup ==
                                            bloodGroups[index] &&
                                        state.donors.isNotEmpty
                                    ? AppColors.primary
                                    : Colors.white,
                                bloodGroup: bloodGroups[index],
                                onSelected: () {
                                  if (bloodGroups[index] == "All") {
                                    context.read<DonorBloc>().add(
                                      LoadDonorsEvent(),
                                    );
                                  } else {
                                    context.read<DonorBloc>().add(
                                      FilterDonorsEvent(
                                        bloodGroup: bloodGroups[index],
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  );
                } else if (state.donorState == DonorStateVal.error) {
                  return Column(
                    children: [
                      Center(child: Text(state.errorMessage ?? "Error")),
                    ],
                  );
                } else if (state.donors.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(
                        height: 56,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bloodGroups.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: BloodGroupFilterWidget(
                                color:
                                    state.selectedBloodGroup ==
                                        bloodGroups[index]
                                    ? AppColors.primary
                                    : Colors.white,
                                bloodGroup: bloodGroups[index],
                                onSelected: () {
                                  if (bloodGroups[index] == "All") {
                                    context.read<DonorBloc>().add(
                                      LoadDonorsEvent(),
                                    );
                                  } else {
                                    context.read<DonorBloc>().add(
                                      FilterDonorsEvent(
                                        bloodGroup: bloodGroups[index],
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(child: Center(child: Text("No donors found"))),
                    ],
                  );
                }
                return Column(
                  children: [
                    SizedBox(height: 10),
                    SizedBox(
                      height: 56,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bloodGroups.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: BloodGroupFilterWidget(
                              bloodGroup: bloodGroups[index],
                              color:
                                  state.selectedBloodGroup == bloodGroups[index]
                                  ? AppColors.primary
                                  : Colors.white,
                              onSelected: () {
                                if (bloodGroups[index] == "All") {
                                  context.read<DonorBloc>().add(
                                    LoadDonorsEvent(),
                                  );
                                } else {
                                  context.read<DonorBloc>().add(
                                    FilterDonorsEvent(
                                      bloodGroup: bloodGroups[index],
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 10),

                    Expanded(
                      child: ListView.builder(
                        itemCount: state.donors.length,
                        itemBuilder: (context, index) {
                          final donor = state.donors[index];
                          return DonerListWidget(
                            firstName: donor.firstName,
                            lastName: donor.lastName,
                            bloodGroup: donor.bloodGroup,
                            location: donor.location,
                            phone: donor.phone,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
