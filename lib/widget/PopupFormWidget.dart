import 'package:flutter/material.dart';
import 'package:dhiravrana/constants.dart'; // Import your constants file

class PopupFormWidget extends StatefulWidget {
  final Function(String recipient, String subject, String body)
      onSubmit; // Define onSubmit callback

  const PopupFormWidget({Key? key, required this.onSubmit}) : super(key: key);
  @override
  _PopupFormWidgetState createState() => _PopupFormWidgetState();
}

class _PopupFormWidgetState extends State<PopupFormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact Form'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(labelText: 'Message'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the popup
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Form is valid, process the data
              String name = _nameController.text;
              String email = _emailController.text;
              String message = _messageController.text;

              // Implement email sending logic here
              // Example: sendEmail(name, email, message);

              Navigator.of(context).pop(); // Close the popup
            }
          },
          child: Text('Send'),
        ),
      ],
    );
  }
}
