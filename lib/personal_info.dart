import 'package:flutter/material.dart';
import 'package:portfolio/social_info.dart';


class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final professionalNameController = TextEditingController();
  final aboutController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF4FF),
      appBar: AppBar(
        title: const Text(
          "Personal Info",
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
                    label: "Full Name",
                    icon: Icons.person,
                    controller: fullNameController,
                    validatorMsg: "Enter your full name",
                  ),
                  const SizedBox(height: 20),

                  _buildInputField(
                    label: "Professional Name",
                    icon: Icons.badge,
                    controller: professionalNameController,
                    validatorMsg: "Enter your professional title",
                  ),
                  const SizedBox(height: 20),

                  _buildInputField(
                    label: "About You",
                    icon: Icons.info,
                    controller: aboutController,
                    validatorMsg: "Tell us something about you",
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),

                  _buildInputField(
                    label: "Email",
                    icon: Icons.email,
                    controller: emailController,
                    validatorMsg: "Enter a valid email",
                  ),
                  const SizedBox(height: 20),

                  _buildInputField(
                    label: "Phone Number",
                    icon: Icons.phone,
                    controller: phoneController,
                    validatorMsg: "Enter your phone number",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),

                  _buildInputField(
                    label: "Location",
                    icon: Icons.location_on,
                    controller: locationController,
                    validatorMsg: "Enter your location",
                  ),
                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
  if (_formKey.currentState!.validate()) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SocialMediaScreen(),
      ),
    );
  }
},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 42, 20, 103),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 30),
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
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? validatorMsg : null,
      ),
    );
  }
}
