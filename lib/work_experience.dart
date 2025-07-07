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
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final yearsOfExperienceController = TextEditingController();
  final responsibilitiesController = TextEditingController();

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
                  _buildInputField(
                    label: "Start Date",
                    controller: startDateController,
                    icon: Icons.calendar_today,
                    validatorMsg: "Enter start date",
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "End Date",
                    controller: endDateController,
                    icon: Icons.calendar_today,
                    validatorMsg: "Enter end date",
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
          builder: (context) => const ProjectPortfolioScreen(),
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
}
