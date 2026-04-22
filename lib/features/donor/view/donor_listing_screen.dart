import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/donor/bloc/donor_bloc.dart';
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
          BlocBuilder<DonorBloc, DonorState>(
            builder: (context, state) {
              if (state.donorState == DonorStateVal.loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state.donorState == DonorStateVal.error) {
                return Center(child: Text(state.errorMessage ?? "Error"));
              } else if (state.donors.isEmpty) {
                return Center(child: Text("No donors found"));
              }
              return Expanded(
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
              );
            },
          ),
        ],
      ),
    );
  }
}
