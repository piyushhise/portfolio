import 'package:flutter/material.dart';
import 'work_experience.dart';

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  final _formKey = GlobalKey<FormState>();

  final degreeController = TextEditingController();
  final institutionController = TextEditingController();
  final experienceController = TextEditingController();

  String? startYear;
  String? endYear;

  final List<String> years =
      List.generate(30, (index) => (2000 + index).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF4FF),
      appBar: AppBar(
        title: const Text(
          "Education!",
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
                    label: "Degree",
                    icon: Icons.school,
                    controller: degreeController,
                    validatorMsg: "Enter your qualification",
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "Institution",
                    icon: Icons.account_balance,
                    controller: institutionController,
                    validatorMsg: "Enter your institution name",
                  ),
                  const SizedBox(height: 20),
                  CustomDropDown(
                    labelText: "Start Year",
                    hintText: "Select Your Start Year",
                    items: years,
                    value: startYear,
                    onChanged: (value) {
                      setState(() {
                        startYear = value;
                      });
                    },
                    icon: Icons.calendar_month_outlined,
                  ),
                  const SizedBox(height: 20),
                  CustomDropDown(
                    labelText: "End Year",
                    hintText: "Select Your End Year",
                    items: years,
                    value: endYear,
                    onChanged: (value) {
                      setState(() {
                        endYear = value;
                      });
                    },
                    icon: Icons.calendar_month_outlined,
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "Experience",
                    icon: Icons.work,
                    controller: experienceController,
                    validatorMsg: "Enter years of experience",
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkExperience(),
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
    required IconData icon,
    required TextEditingController controller,
    required String validatorMsg,
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

class CustomDropDown extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<String> items;
  final String? value;
  final void Function(String?) onChanged;
  final IconData icon;

  const CustomDropDown({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.icon,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
        ),
        hint: Text(hintText),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select $labelText";
          }
          return null;
        },
      ),
    );
  }
}
