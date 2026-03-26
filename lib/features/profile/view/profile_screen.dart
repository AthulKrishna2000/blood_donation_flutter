import 'package:blood_donation_app/features/profile/bloc/profile_bloc.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_event.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_state.dart';
import 'package:blood_donation_app/features/profile/widgets/dropdown.dart';
import 'package:blood_donation_app/features/profile/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final bloc = context.read<ProfileBloc>();
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomDropdown(
                  selectedValue: state.bloodGroup,
                  hint: "Select Blood Group",
                  items: bloodGroups,
                  onChanged: (value) {
                    bloc.add(BloodGroupChanged(value!));
                  },
                ),
                const SizedBox(height: 20),
                ProfileTextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hint: "Phone Number",
                ),
                const SizedBox(height: 20),
                ProfileTextField(
                  controller: locationController,
                  keyboardType: TextInputType.text,
                  hint: "Location",
                ),
                const SizedBox(height: 20),

                /// Save Button
                ElevatedButton(
                  onPressed: state.isLoading
                      ? null
                      : () {
                          if (state.bloodGroup == null ||
                              state.bloodGroup!.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a blood group'),
                              ),
                            );
                            return;
                          }
                          if (phoneController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter a phone number'),
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
                      : const Text("Save Profile"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
