import 'package:easeup/core/navigation/routes_name.dart';
import 'package:easeup/modules/authentication/viewmodels/authentication_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Registration Failed'),
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
              'REGISTER USER',
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
                          hintText: 'Enter your email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordTextController,
                        decoration: const InputDecoration(
                          hintText: 'password',
                        ),
                        obscureText: true,
                        obscuringCharacter: '*',
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.newPassword],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
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
                              final password = passwordTextController.text;

                              final viewmodel =
                                  Provider.of<AuthenticationViewModel>(
                                context,
                                listen: false,
                              );

                              try {
                                final success = await viewmodel.registerNewUser(
                                  email,
                                  password,
                                );
                                if (!context.mounted) return;
                                if (success) {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesName.login,
                                  );
                                } else {
                                  _showErrorDialog(
                                    context,
                                    viewmodel.errorMessage,
                                  );
                                }
                              } catch (e) {
                                // Handle exception (e.g., log it or show a dialog)
                                if (kDebugMode) {
                                  print('Error: $e');
                                }
                                if (!context.mounted) return;
                                _showErrorDialog(
                                  context,
                                  'An unexpected error occurred. Please try again.',
                                );
                              }
                            }
                          },
                          child: const Text('Register'),
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
                              'Already registered? Please Login',
                              style: TextStyle(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.forgotPassword,
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
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
