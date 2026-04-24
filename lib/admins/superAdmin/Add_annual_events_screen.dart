import 'package:flutter/material.dart';
import 'package:mct_prayer_book/providers/subSuperAdminProvider/add_annual_event_provider.dart';
import 'package:mct_prayer_book/wigets/Elevated_button_widget.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/input_field_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/superAdminProviders/get_annual_events_provider.dart';

class AddAnnualEventsScreen extends StatefulWidget {
  const AddAnnualEventsScreen({super.key});

  @override
  State<AddAnnualEventsScreen> createState() => _AddAnnualEventsScreenState();
}

class _AddAnnualEventsScreenState extends State<AddAnnualEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "All Events"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<AddAnnualEventProvider>(
            builder: (context, provider, child) {
              return Form(
                key: provider.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Event Name
                      InputFieldWidget(
                        controller: provider.eventController,
                        labelText: "Event Name",
                        hintText: "Enter Event Name",
                        validator: (value) =>
                            value == null || value.isEmpty ? "Required" : null,
                      ),

                      const SizedBox(height: 12),

                      /// Place
                      InputFieldWidget(
                        controller: provider.placeController,
                        hintText: "Which place will this event take?",
                        labelText: "Enter place name",
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            value == null || value.isEmpty ? "Required" : null,
                      ),

                      const SizedBox(height: 12),

                      /// Date & Time Row
                      Row(
                        children: [
                          Expanded(
                            child: InputFieldWidget(
                              controller: provider.dateController,
                              readOnly: true,
                              hintText: "Event date",
                              labelText: "Select date",
                              onTap: () => provider.pickDate(context),
                              keyboardType: TextInputType.none,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? "Required"
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: InputFieldWidget(
                              controller: provider.timeController,
                              hintText: "Event timing",
                              labelText: "Select time",
                              keyboardType: TextInputType.none,
                              readOnly: true,
                              onTap: () => provider.pickTime(context),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? "Required"
                                  : null,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      /// Button with Loading
                      SizedBox(
                        width: double.infinity,
                        child: provider.loading
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButtonWidget(
                                onTap: () async {
                                  if (provider.formKey.currentState!
                                      .validate()) {
                                    final message = await provider.addEvent();
                                    Future.microtask(
                                      () =>
                                          Provider.of<GetAnnualEventsProvider>(
                                            context,
                                            listen: false,
                                          ).fetchAllEvents(),
                                    );
                                    if (!mounted) return;

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          message ?? "Something went wrong",
                                        ),
                                      ),
                                    );
                                  }
                                },
                                text: "Add Event",
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
