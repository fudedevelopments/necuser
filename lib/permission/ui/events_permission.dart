import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:necuser/permission/ui/file_pick.dart'; 

class ElegantForm extends StatefulWidget {
  const ElegantForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ElegantFormState createState() => _ElegantFormState();
}

class _ElegantFormState extends State<ElegantForm>
    with SingleTickerProviderStateMixin {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _registerUrlController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void dispose() {
    _studentNameController.dispose();
    _emailController.dispose();
    _eventNameController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    _registerUrlController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    fetchCurrentUserAttributes();
  }

  Future<void> fetchCurrentUserAttributes() async {
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      result;
      for (final element in result) {
        if (element.userAttributeKey.toString() == "email") {
          setState(() {
            _emailController.text = element.value;
          });
        } else if (element.userAttributeKey.toString() == "sub") {
          setState(() {
            _studentNameController.text = element.value;
          });
        }
      }

      _animationController.forward();
    } on AuthException catch (e) {
      safePrint('Error fetching user attributes: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Registration'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.purple.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              // Apply animation
              FadeTransition(
                opacity: _animation,
                child: _buildTextField('Student Name', _studentNameController,
                    isReadOnly: true),
              ),
              const SizedBox(height: 16),
              FadeTransition(
                opacity: _animation,
                child: _buildTextField('Student Email', _emailController,
                    isReadOnly: true),
              ),
              const SizedBox(height: 16),
              _buildTextField('Event Name', _eventNameController),
              const SizedBox(height: 16),
              _buildTextField('Date', _dateController),
              const SizedBox(height: 16),
              _buildTextField('Location', _locationController),
              const SizedBox(height: 16),
              _buildTextField('Register URL', _registerUrlController),
              const SizedBox(height: 24),
              const FilePickerBoxUI(),
              const SizedBox(height: 24),
              _buildGradientButton('Submit'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isReadOnly = false}) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: isReadOnly
            ? Colors.grey.shade300.withOpacity(0.8)
            : Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _buildGradientButton(String text) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
