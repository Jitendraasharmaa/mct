import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/Elevated_button_widget.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/input_field_widget.dart';
import 'package:provider/provider.dart';

import '../models/events_model.dart';
import '../providers/superAdminProviders/edit_event_provider.dart';

class EditEventScreen extends StatefulWidget {
  final EventModel event;

  const EditEventScreen({super.key, required this.event});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<EditEventProvider>(context, listen: false);

    provider.setInitialData(
      id: widget.event.id,
      eventName: widget.event.eventName,
      templeName: widget.event.templeName,
      time: widget.event.time,
      day: widget.event.day,
      month: widget.event.month,
    );
  }

  // 📅 Pick Date
  Future<void> pickDate(BuildContext context) async {
    final provider = Provider.of<EditEventProvider>(context, listen: false);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: provider.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      provider.setDate(picked);
    }
  }

  // ⏰ Pick Time
  Future<void> pickTime(BuildContext context) async {
    final provider = Provider.of<EditEventProvider>(context, listen: false);

    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      provider.setTime(picked, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditEventProvider>(context);

    return Scaffold(
      appBar: AppbarWidget(title: "Edit Event"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: provider.formKey,
            child: Column(
              children: [
                // Event Name
                InputFieldWidget(
                  controller: provider.eventNameController,
                  labelText: "Event Name",
                  hintText: "Enter Event Name",
                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                ),

                // Place
                InputFieldWidget(
                  controller: provider.placeController,
                  hintText: "Which place will this event take?",
                  labelText: "Enter place name",
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                ),

                // Date + Time
                Row(
                  children: [
                    Expanded(
                      child: InputFieldWidget(
                        controller: provider.dateController,
                        readOnly: true,
                        hintText: "Event date",
                        labelText: "Select date",
                        onTap: () => pickDate(context),
                        keyboardType: TextInputType.none,
                        validator: (value) =>
                            value == null || value.isEmpty ? "Required" : null,
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
                        onTap: () => pickTime(context),
                        validator: (value) =>
                            value == null || value.isEmpty ? "Required" : null,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔥 Update Button
                Consumer<EditEventProvider>(
                  builder: (context, provider, child) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButtonWidget(
                        text: provider.isLoading
                            ? "Updating..."
                            : "Update Event",
                        onTap: () async {
                          await provider.updateEvent();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Event Updated Successfully"),
                            ),
                          );

                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
