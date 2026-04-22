import 'package:flutter/material.dart';
import 'package:mct_prayer_book/providers/add_initiation_provider.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/custom_dropdown_inputfield.dart';
import 'package:mct_prayer_book/wigets/input_field_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';

class AddInitiationsScreen extends StatefulWidget {
  const AddInitiationsScreen({super.key});

  @override
  State<AddInitiationsScreen> createState() => _AddInitiationsScreenState();
}

class _AddInitiationsScreenState extends State<AddInitiationsScreen> {
  bool isChecked = false;

  Future<void> pickEnglishDate(
    BuildContext context,
    AddInitiationProvider provider,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      provider.englishDateController.text =
          "${picked.day.toString().padLeft(2, '0')}/"
          "${picked.month.toString().padLeft(2, '0')}/"
          "${picked.year}";
    }
  }

  Future<void> pickChineseDate(
    BuildContext context,
    AddInitiationProvider provider,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      provider.chineseDateController.text =
          "${picked.day.toString().padLeft(2, '0')}/"
          "${picked.month.toString().padLeft(2, '0')}/"
          "${picked.year}";
    }
  }

  Future<void> pickDmAttendedDate(
    BuildContext context,
    AddInitiationProvider provider,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      provider.dmAttendedController.text =
          "${picked.day.toString().padLeft(2, '0')}/"
          "${picked.month.toString().padLeft(2, '0')}/"
          "${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<AddInitiationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: const AppbarWidget(title: "Add Initiation"),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Form(
              key: provider.formKey,
              child: Column(
                children: [
                  InputFieldWidget(
                    controller: provider.bookSlNoController,
                    labelText: "Book Sl.No",
                    hintText: "Enter Book Sl.no",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter book Sl No';
                      }
                      return null;
                    },
                  ),

                  InputFieldWidget(
                    controller: provider.personNameController,
                    labelText: "Name",
                    hintText: "Enter full name",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                  ),

                  InputFieldWidget(
                    controller: provider.ageController,
                    labelText: "Age",
                    hintText: "Enter Age",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter age';
                      }
                      return null;
                    },
                  ),

                  CustomDropdownFormField(
                    label: "Gender",
                    items: const ['Male', 'Female'],
                    value: provider.genderController.text.isEmpty
                        ? null
                        : provider.genderController.text,
                    onChanged: (value) {
                      provider.genderController.text = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select gender';
                      }
                      return null;
                    },
                  ),

                  InputFieldWidget(
                    controller: provider.educationController,
                    labelText: "Education",
                    hintText: "Enter Education",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter education';
                      }
                      return null;
                    },
                  ),
                  InputFieldWidget(
                    labelText: "Phone",
                    hintText: "Enter Mobile Number",
                    keyboardType: TextInputType.phone,
                    controller: provider.phoneController,
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                    validator: (value) {
                      final phone = value?.trim() ?? '';

                      if (phone.isEmpty) {
                        return 'Please enter mobile number';
                      }

                      // Remove spaces, dashes, brackets etc.
                      final cleaned = phone.replaceAll(RegExp(r'[^\d+]'), '');

                      // Prevent multiple +
                      if ('+'.allMatches(cleaned).length > 1) {
                        return 'Invalid phone number';
                      }

                      // + must be only at beginning
                      if (cleaned.contains('+') && !cleaned.startsWith('+')) {
                        return 'Invalid phone number';
                      }

                      // Digits only after optional +
                      if (!RegExp(r'^\+?\d+$').hasMatch(cleaned)) {
                        return 'Phone number can contain only digits';
                      }
                      // Count only digits
                      final digits = cleaned.replaceAll('+', '');
                      // International phone number valid range
                      if (digits.length < 7 || digits.length > 15) {
                        return 'Phone number must be 7 to 15 digits';
                      }
                      // Indian mobile number specific validation
                      // Allows: 9876543210, +919876543210, 919876543210
                      if (digits.length == 10) {
                        if (!RegExp(r'^[6-9]\d{9}$').hasMatch(digits)) {
                          return 'Enter a valid 10-digit mobile number';
                        }
                      } else if (digits.length == 12 &&
                          digits.startsWith('91')) {
                        final indian = digits.substring(2);
                        if (!RegExp(r'^[6-9]\d{9}$').hasMatch(indian)) {
                          return 'Invalid Indian mobile number';
                        }
                      } else if (cleaned.startsWith('+91')) {
                        final indian = digits.substring(2);
                        if (!RegExp(r'^[6-9]\d{9}$').hasMatch(indian)) {
                          return 'Invalid Indian mobile number';
                        }
                      }

                      return null;
                    },
                  ),

                  InputFieldWidget(
                    controller: provider.introducerController,
                    labelText: "Introducer",
                    hintText: "Enter Introducer Full Name",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please Introducer Name';
                      }
                      return null;
                    },
                  ),

                  InputFieldWidget(
                    controller: provider.guarantorController,
                    labelText: "Guarantor",
                    hintText: "Enter Guarantor Full Name",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please Guarantor Name';
                      }
                      return null;
                    },
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdownFormField(
                          label: "Master",
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
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select master';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
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

                  Row(
                    children: [
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.englishDateController,
                          labelText: "English Date",
                          hintText: "Select initiation English date",
                          readOnly: true,
                          onTap: () => pickEnglishDate(context, provider),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select date';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.chineseDateController,
                          labelText: "Chinese Date",
                          hintText: "Select initiation Chinese date",
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select date';
                            }
                            return null;
                          },
                          onTap: () => pickChineseDate(context, provider),
                        ),
                      ),
                    ],
                  ),
                  InputFieldWidget(
                    controller: provider.meritsFeeController,
                    labelText: "Merits Fee",
                    hintText: "Enter merits fee",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please merits fee';
                      }
                      return null;
                    },
                  ),
                  InputFieldWidget(
                    controller: provider.addressController,
                    labelText: "Address",
                    hintText: "Enter address",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please DM attended';
                      }
                      return null;
                    },
                  ),
                  InputFieldWidget(
                    controller: provider.remarksController,
                    labelText: "Remarks",
                    hintText: "Enter remarks",
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please remarks';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      Text("Is DM Attended?"),
                    ],
                  ),

                  if (isChecked)
                    InputFieldWidget(
                      controller: provider.dmAttendedController,
                      labelText: "DMAttended Date",
                      hintText: "Select DM Attended Date",
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please DM attended';
                        }
                        return null;
                      },
                      onTap: () => pickDmAttendedDate(context, provider),
                    ),
                  const SizedBox(height: 20),
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
                              final message = await provider.createInitiation();

                              if (!mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message ?? 'Done'),
                                  backgroundColor:
                                      message ==
                                          'Initiation created successfully'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              );
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
                          : const Text('Submit'),
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
