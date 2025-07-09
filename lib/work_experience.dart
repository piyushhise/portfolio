import 'package:flutter/material.dart';
import 'package:portfolio/project_screen.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  final _formKey = GlobalKey<FormState>();

  final jobTitleController = TextEditingController();
  final companyNameController = TextEditingController();
  final yearsOfExperienceController = TextEditingController();
  final responsibilitiesController = TextEditingController();

  String? startDate;
  String? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF4FF),
      appBar: AppBar(
        title: const Text(
          "Work Experience",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 42, 20, 103),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildInputField(
                    label: "Job Title",
                    controller: jobTitleController,
                    icon: Icons.work,
                    validatorMsg: "Enter job title",
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "Company Name",
                    controller: companyNameController,
                    icon: Icons.business,
                    validatorMsg: "Enter company name",
                  ),
                  const SizedBox(height: 20),
                  _buildDatePickerField(
                    label: "Start Date",
                    value: startDate,
                    icon: Icons.calendar_today,
                    onTap: () => _pickDate(
                      context: context,
                      label: "Start Date",
                      onSelectedDate: (date) {
                        setState(() {
                          startDate = date;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDatePickerField(
                    label: "End Date",
                    value: endDate,
                    icon: Icons.calendar_today,
                    onTap: () => _pickDate(
                      context: context,
                      label: "End Date",
                      onSelectedDate: (date) {
                        setState(() {
                          endDate = date;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "Years of Experience",
                    controller: yearsOfExperienceController,
                    icon: Icons.access_time,
                    validatorMsg: "Enter years of experience",
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "Responsibilities",
                    controller: responsibilitiesController,
                    icon: Icons.description,
                    validatorMsg: "Enter responsibilities",
                    maxLines: 5,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProjectPortfolioScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 8,
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String validatorMsg,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMsg;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDatePickerField({
    required String label,
    required String? value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
        readOnly: true,
        onTap: onTap,
        controller: TextEditingController(text: value ?? ''),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }

  Future<void> _pickDate({
    required BuildContext context,
    required String label,
    required void Function(String) onSelectedDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );

    if (picked != null) {
      final formattedDate = "${picked.day}/${picked.month}/${picked.year}";
      onSelectedDate(formattedDate);
    }
  }
}
