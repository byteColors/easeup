import 'package:easeup/core/navigation/routes_name.dart';
import 'package:easeup/modules/authentication/viewmodels/authentication_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Password'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'easeup',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            const Text(
              'RESET PASSWORD',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(18),
              color: Colors.teal.shade200,
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailTextController,
                        decoration: const InputDecoration(
                          hintText: 'Enter email of your account',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email of your account.';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final email = emailTextController.text;

                              final viewmodel =
                                  Provider.of<AuthenticationViewModel>(
                                context,
                                listen: false,
                              );

                              final success =
                                  await viewmodel.resetPassword(email);

                              if (success) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      'We\'ve sent an email to $email. Click the link in the email to reset your password.'),
                                ));
                                Navigator.pop(context);
                              } else {
                                if (!context.mounted) return;
                                _showErrorDialog(
                                  context,
                                  viewmodel.errorMessage,
                                );
                              }
                            }
                          },
                          child: const Text('Send Reset Email'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.login,
                              );
                            },
                            child: const Text(
                              'Existing User? Please Login',
                              style: TextStyle(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.register,
                              );
                            },
                            child: const Text(
                              'New here? Please Register',
                              style: TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
