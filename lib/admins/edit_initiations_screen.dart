import 'package:flutter/material.dart';
import 'package:mct_prayer_book/providers/subSuperAdminProvider/sub_super_admin_edit_initiations_provider.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/custom_dropdown_inputfield.dart';
import 'package:mct_prayer_book/wigets/input_field_widget.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';

class EditInitiationsScreen extends StatefulWidget {
  final Map<String, dynamic> initiationData;

  const EditInitiationsScreen({super.key, required this.initiationData});

  @override
  State<EditInitiationsScreen> createState() =>
      _SubSuperAdminEditInitiationsScreenState();
}

class _SubSuperAdminEditInitiationsScreenState
    extends State<EditInitiationsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<SubSuperAdminEditInitiationsProvider>();
      provider.loadInitiationData(widget.initiationData);
    });
  }

  Future<void> pickEnglishDate(
    BuildContext context,
    SubSuperAdminEditInitiationsProvider provider,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      provider.englishDateController.text =
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      provider.notifyListeners();
    }
  }

  Future<void> pickChineseDate(
    BuildContext context,
    SubSuperAdminEditInitiationsProvider provider,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      provider.chineseDateController.text =
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      provider.notifyListeners();
    }
  }

  Future<void> pickDmAttendedDate(
    BuildContext context,
    SubSuperAdminEditInitiationsProvider provider,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      provider.dmAttendedController.text =
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      provider.notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SubSuperAdminEditInitiationsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: const AppbarWidget(title: 'Edit Initiation'),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Form(
              key: provider.formKey,
              child: Column(
                children: [
                  InputFieldWidget(
                    controller: provider.bookSlNoController,
                    labelText: 'Book Sl.No',
                    hintText: 'Enter Book Sl.No',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter Book Sl.No';
                      }
                      return null;
                    },
                  ),

                  InputFieldWidget(
                    controller: provider.personNameController,
                    labelText: 'Name',
                    hintText: 'Enter full name',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.ageController,
                          labelText: 'Age',
                          hintText: 'Enter age',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter age';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomDropdownFormField(
                          label: 'Gender',
                          items: const ['Male', 'Female'],
                          value: provider.genderController.text.isEmpty
                              ? null
                              : provider.genderController.text,
                          onChanged: (value) {
                            provider.genderController.text = value ?? '';
                            provider.notifyListeners();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select gender';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  InputFieldWidget(
                    controller: provider.educationController,
                    labelText: 'Education',
                    hintText: 'Enter education',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter education';
                      }
                      return null;
                    },
                  ),

                  InputFieldWidget(
                    controller: provider.phoneController,
                    labelText: 'Phone',
                    hintText: 'Enter mobile number',
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                    validator: (value) {
                      final phone = value?.trim() ?? '';

                      if (phone.isEmpty) {
                        return 'Please enter mobile number';
                      }

                      final cleaned = phone.replaceAll(RegExp(r'[^\d+]'), '');

                      if ('+'.allMatches(cleaned).length > 1) {
                        return 'Invalid phone number';
                      }

                      if (cleaned.contains('+') && !cleaned.startsWith('+')) {
                        return 'Invalid phone number';
                      }

                      if (!RegExp(r'^\+?\d+$').hasMatch(cleaned)) {
                        return 'Phone number can contain only digits';
                      }

                      final digits = cleaned.replaceAll('+', '');

                      if (digits.length < 7 || digits.length > 15) {
                        return 'Phone number must be 7 to 15 digits';
                      }

                      if (digits.length == 10) {
                        if (!RegExp(r'^[6-9]\d{9}$').hasMatch(digits)) {
                          return 'Enter a valid 10-digit mobile number';
                        }
                      }

                      return null;
                    },
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.introducerController,
                          labelText: 'Introducer',
                          hintText: 'Enter introducer name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter introducer name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.guarantorController,
                          labelText: 'Guarantor',
                          hintText: 'Enter guarantor name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter guarantor name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdownFormField(
                          label: 'Master',
                          items: const [
                            'Lee TCS',
                            'Chen TCS',
                            'Thu TCS',
                            'CI TCS',
                            'Sun TCS',
                            'Chang TCS',
                          ],
                          value: provider.masterController.text.isEmpty
                              ? null
                              : provider.masterController.text,
                          onChanged: (value) {
                            provider.masterController.text = value ?? '';
                            provider.notifyListeners();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select master';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomDropdownFormField(
                          label: "Temple",
                          items: const [
                            'Hong Ci',
                            'Kong Ta',
                            'Kuang Wu',
                            'Yi En',
                            'Kong Rong',
                            'Kong Fong',
                          ],
                          value: provider.templeController.text.isEmpty
                              ? null
                              : provider.templeController.text,
                          onChanged: (value) {
                            provider.templeController.text = value ?? '';
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select temple';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.englishDateController,
                          labelText: 'English Date',
                          hintText: 'Select English Date',
                          readOnly: true,
                          onTap: () => pickEnglishDate(context, provider),
                          suffixIcon: const Icon(Icons.calendar_month_outlined),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.chineseDateController,
                          labelText: 'Chinese Date',
                          hintText: 'Select Chinese Date',
                          readOnly: true,
                          onTap: () => pickChineseDate(context, provider),
                          suffixIcon: const Icon(Icons.calendar_month_outlined),
                        ),
                      ),
                    ],
                  ),

                  InputFieldWidget(
                    controller: provider.remarksController,
                    labelText: 'Remarks',
                    hintText: 'Enter Remarks',
                  ),
                  InputFieldWidget(
                    controller: provider.dmAttendedController,
                    labelText: 'DM Attended Date',
                    hintText: 'Select DM Attended Date',
                    readOnly: true,
                    onTap: () => pickDmAttendedDate(context, provider),
                    suffixIcon: const Icon(Icons.calendar_month_outlined),
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: AppColors.whiteColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: provider.isLoading
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();

                              if (!provider.formKey.currentState!.validate()) {
                                return;
                              }

                              final message = await provider.updateInitiation();

                              if (!context.mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    message ?? 'Something went wrong',
                                  ),
                                  backgroundColor:
                                      message ==
                                          'Initiation updated successfully'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              );

                              if (message ==
                                  'Initiation updated successfully') {
                                Navigator.pop(context, true);
                              }
                            },
                      child: provider.isLoading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text('Update'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
