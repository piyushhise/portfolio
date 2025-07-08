import 'package:flutter/material.dart';
import 'package:portfolio/hobbies_screen.dart';

class AwardAndAchievementsScreen extends StatefulWidget {
  const AwardAndAchievementsScreen({super.key});

  @override
  State<AwardAndAchievementsScreen> createState() => _AwardAndAchievementsScreenState();
}

class _AwardAndAchievementsScreenState extends State<AwardAndAchievementsScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final issuingOrgController = TextEditingController();
  final yearController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1FF),
      appBar: AppBar(
        title: const Text(
          "Awards & Achievements",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2A1467),
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
                    radius: 70,
                    backgroundImage: NetworkImage(
                      "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildInputField(
                    label: "Award Title",
                    controller: titleController,
                    icon: Icons.emoji_events,
                    validatorMsg: "Please enter award title",
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "Issuing Organization",
                    controller: issuingOrgController,
                    icon: Icons.business,
                    validatorMsg: "Please enter issuing organization",
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "Year",
                    controller: yearController,
                    icon: Icons.calendar_today,
                    validatorMsg: "Please enter year",
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "Description",
                    controller: descriptionController,
                    icon: Icons.description,
                    validatorMsg: "Please enter description",
                    maxLines: 4,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HobbiesAndInterestsScreen(),
                        ),
                      );
                    }
                  },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      backgroundColor: Colors.deepPurple,
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
