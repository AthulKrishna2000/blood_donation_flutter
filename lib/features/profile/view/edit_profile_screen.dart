import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_bloc.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_event.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_state.dart';
import 'package:blood_donation_app/features/profile/widgets/container_widget.dart';
import 'package:blood_donation_app/features/profile/widgets/dropdown.dart';
import 'package:blood_donation_app/features/profile/widgets/profile_photo_widget.dart';
import 'package:blood_donation_app/features/profile/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  final List<String> bloodGroups = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];

  // Track previous state to avoid showing snackbars repeatedly
  bool _previousSuccess = false;
  String? _previousErrorMessage;

  @override
  void initState() {
    super.initState();

    // Add listeners to clear errors when user starts typing
    phoneController.addListener(() {
      if (context.read<ProfileBloc>().state.errorMessage != null) {
        context.read<ProfileBloc>().add(ClearErrorEvent());
      }
    });

    locationController.addListener(() {
      if (context.read<ProfileBloc>().state.errorMessage != null) {
        context.read<ProfileBloc>().add(ClearErrorEvent());
      }
    });

    // Listen to bloc state changes to show success and error messages
    context.read<ProfileBloc>().stream.listen((state) {
      // Only show success snackbar on transition from false to true
      if (state.isSuccess && !_previousSuccess && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile saved successfully!')),
        );
        // Clear success state after showing
        context.read<ProfileBloc>().add(ClearErrorEvent());
      }

      // Only show error snackbar when error message appears (not on every state change)
      if (state.errorMessage != null &&
          state.errorMessage != _previousErrorMessage &&
          mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        // Clear error after showing it
        context.read<ProfileBloc>().add(ClearErrorEvent());
      }

      // Update tracking variables
      _previousSuccess = state.isSuccess;
      _previousErrorMessage = state.errorMessage;
    });
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
          final bloc = context.read<ProfileBloc>();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.containerBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              // color: AppColors.primary.withOpacity(0.1),
                            ),

                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            child: Text(
                              "Account Settings",
                              style: TextStyle(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold,
                                color: AppColors.textDark.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Edit Your",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: AppColors.textDark,
                            ),
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ProfilePhotoWidget(),
                  SizedBox(height: 20),
                  ContainerWidget(
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          " FULL NAME",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textLight,
                          ),
                        ),
                        SizedBox(height: 4),
                        ProfileTextField(
                          controller: phoneController,
                          keyboardType: TextInputType.text,
                          hint: "Full Name",
                        ),

                        const SizedBox(height: 10),
                        Text(
                          " PHONE NUMBER",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textLight,
                          ),
                        ),
                        SizedBox(height: 4),
                        ProfileTextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          hint: "Phone Number",
                        ),
                        const SizedBox(height: 10),
                        Text(
                          " LOCATION",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textLight,
                          ),
                        ),
                        SizedBox(height: 4),
                        ProfileTextField(
                          controller: locationController,
                          keyboardType: TextInputType.text,
                          hint: "Location",
                        ),
                        const SizedBox(height: 10),

                        Text(
                          " BLOOD GROUP",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textLight,
                          ),
                        ),
                        SizedBox(height: 4),
                        CustomDropdown(
                          selectedValue: state.bloodGroup,
                          hint: "Select Blood Group",
                          items: bloodGroups,
                          onChanged: (value) {
                            bloc.add(BloodGroupChanged(value!));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete, color: Colors.grey, size: 16),
                      Text(
                        "Deactivate Account",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  /// Save Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : () {
                                if (state.bloodGroup == null ||
                                    state.bloodGroup!.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please select a blood group',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                if (phoneController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please enter a phone number',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                bloc.add(
                                  SaveProfileEvent(
                                    bloodGroup: state.bloodGroup!,
                                    phone: phoneController.text,
                                    location: locationController.text,
                                    isDonor: true,
                                  ),
                                );
                              },
                        child: state.isLoading
                            ? const CircularProgressIndicator()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.save,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4),
                                  const Text(
                                    "Save Profile",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
