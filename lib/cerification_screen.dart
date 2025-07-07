import 'package:flutter/material.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  final _formKey = GlobalKey<FormState>();

  
  final certNameController = TextEditingController();
  final orgController = TextEditingController();
  final dateController = TextEditingController();
  final urlController = TextEditingController();

  
  String? hasCertification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1FF),
      appBar: AppBar(
        title: const Text(
          "Certifications",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2A1467),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png"),
                ),
                const SizedBox(height: 30),

                const Text(
                  "Do you have any certifications?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "yes",
                      groupValue: hasCertification,
                      onChanged: (value) {
                        setState(() {
                          hasCertification = value;
                        });
                      },
                    ),
                    const Text("Yes"),
                    Radio<String>(
                      value: "no",
                      groupValue: hasCertification,
                      onChanged: (value) {
                        setState(() {
                          hasCertification = value;
                        });
                      },
                    ),
                    const Text("No"),
                  ],
                ),
                const SizedBox(height: 20),

                if (hasCertification == "yes") ...[
                  _buildInputField(
                      "Certification Name", certNameController, Icons.card_membership),
                  const SizedBox(height: 16),
                  _buildInputField("Issuing Organization", orgController, Icons.business),
                  const SizedBox(height: 16),
                  _buildInputField("Date", dateController, Icons.calendar_today),
                  const SizedBox(height: 16),
                  _buildInputField("Certificate URL", urlController, Icons.link),
                  const SizedBox(height: 30),
                ],

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (hasCertification == "yes" &&
                          _formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Certification Saved")),
                        );
                      } else if (hasCertification == "no") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("No Certifications")),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, IconData icon) {
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
          if (hasCertification == "yes" && (value == null || value.isEmpty)) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
