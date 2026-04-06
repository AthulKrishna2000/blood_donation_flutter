import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_bloc.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_event.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_state.dart';
import 'package:blood_donation_app/features/profile/view/edit_profile_screen.dart';
import 'package:blood_donation_app/features/profile/widgets/blood_type_widget.dart';
import 'package:blood_donation_app/features/profile/widgets/person_details_widget.dart';
import 'package:blood_donation_app/features/profile/widgets/profile_name_widget.dart';
import 'package:blood_donation_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileBloc>().add(LoadProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        centerTitle: true,
        title: const Text(
          "Vital Pulse",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.profileState.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.profileErrorMessage != null) {
            return Center(child: Text(state.profileErrorMessage!));
          } else {
            // Display profile details
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Text("Profile details go here"),
                      // Text(state.user.email), // Example of showing user email
                      // Text(state.user.bloodGroup), // Example of showing blood group
                      // Text(state.user.phone),
                      ProfileNameWidget(
                        firstName: state.user.firstName,
                        lastName: state.user.lastName,
                        status: 'ELITE DONOR',
                        description:
                            "Member since 2023 | 5 donations | Last donated: 2 months ago",
                      ),
                      BloodTypeWidget(
                        bloodType: state.user.bloodGroup,
                      ), // Example of showing blood type
                      // Text(state.user.phone), // Example of showing phone number
                      Text(
                        "Person details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PersonDetailsWidget(
                        email: state.user.email,
                        phone: state.user.phone,
                        city: state.user.location,
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.appBarBackground,
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to edit profile screen
                          Navigator.pushNamed(
                            context,
                            editprofileScreen,
                            arguments: {
                              'initialBloodGroup': state.user.bloodGroup,
                              'initialPhone': state.user.phone,
                              'initialLocation': state.user.location,
                              'initialFirstName': state.user.firstName,
                              'initialLastName': state.user.lastName,
                            },
                          );
                        },
                        label: Text("edit details "),
                        icon: Icon(Icons.edit),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
