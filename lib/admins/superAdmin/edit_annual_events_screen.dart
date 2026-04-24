import 'package:flutter/material.dart';
import 'package:mct_prayer_book/providers/subSuperAdminProvider/edit_annual_event_provider.dart';
import 'package:provider/provider.dart';

import '../../wigets/Elevated_button_widget.dart';
import '../../wigets/appBar_widget.dart';
import '../../wigets/input_field_widget.dart';

class EditAnnualEventsScreen extends StatefulWidget {
  final Map<String, dynamic> event;

  const EditAnnualEventsScreen({super.key, required this.event});

  @override
  State<EditAnnualEventsScreen> createState() => _EditAnnualEventsScreenState();
}

class _EditAnnualEventsScreenState extends State<EditAnnualEventsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<EditAnnualEventProvider>(
        context,
        listen: false,
      ).initData(widget.event);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditAnnualEventProvider>(context);

    return Scaffold(
      appBar: AppbarWidget(title: "Edit Event"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: provider.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputFieldWidget(
                    controller: provider.eventController,
                    labelText: "Event Name",
                    hintText: "Enter Event Name",
                    validator: (value) =>
                        value == null || value.isEmpty ? "Required" : null,
                  ),

                  const SizedBox(height: 12),

                  InputFieldWidget(
                    controller: provider.placeController,
                    hintText: "Which place will this event take?",
                    labelText: "Enter place name",
                    validator: (value) =>
                        value == null || value.isEmpty ? "Required" : null,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.dateController,
                          readOnly: true,
                          hintText: "Event date",
                          labelText: "Select date",
                          onTap: () => provider.pickDate(context),
                          validator: (value) => value == null || value.isEmpty
                              ? "Required"
                              : null,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InputFieldWidget(
                          controller: provider.timeController,
                          readOnly: true,
                          hintText: "Event timing",
                          labelText: "Select time",
                          onTap: () => provider.pickTime(context),
                          validator: (value) => value == null || value.isEmpty
                              ? "Required"
                              : null,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: provider.loading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButtonWidget(
                            text: "Update Event",
                            onTap: () async {
                              final msg = await provider.updateEvent();

                              if (msg != null) {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text(msg)));

                                if (msg.contains("success")) {
                                  Navigator.pop(context);
                                  Future.microtask(() {
                                    Provider.of<EditAnnualEventProvider>(
                                      context,
                                      listen: false,
                                    ).initData(widget.event);
                                  });
                                }
                              }
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
