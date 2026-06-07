import 'package:flutter/material.dart';
import 'package:omda_fit/features/auth/presentation/widget/fields_login.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isFormFilled = false;

  late AnimationController logoController;
  late AnimationController formController;
  late Animation<double> logoAnimation;
  late Animation<Offset> formAnimation;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkFormFilled);
    _passwordController.addListener(_checkFormFilled);

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    formController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    logoAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.elasticOut),
    );

    formAnimation = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
      CurvedAnimation(parent: formController, curve: Curves.easeOutExpo),
    );

    logoController.forward();
    Future.delayed(const Duration(milliseconds: 400), () => formController.forward());
  }

  void _checkFormFilled() {
    setState(() {
      _isFormFilled = _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    logoController.dispose();
    formController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تسجيل البيانات بنجاح', textAlign: TextAlign.right)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 450,
                  child: Image.asset('assets/images/IMG8.JPG', fit: BoxFit.cover),
                ),
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.2),
                        Colors.black,
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: ScaleTransition(
                        scale: logoAnimation,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset("assets/images/logo.png", width: 200),
                            ),

                            const Text(
                              "مرحبًا بعودتك",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "سجل دخولك وابدأ رحلتك الرياضية الآن",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: SlideTransition(
                position: formAnimation,
                child: Container(
                  height: 430,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "تسجيل الدخول",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        LoginTextField(
                          controller: _emailController,
                          label: 'البريد الإلكتروني',
                          hintText: 'أدخل بريدك الإلكتروني',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),
                        LoginTextField(
                          controller: _passwordController,
                          label: 'كلمة المرور',
                          hintText: 'أدخل كلمة المرور',
                          icon: Icons.lock_outline,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) return 'كلمة المرور مطلوبة';
                            if (value.trim().length < 6) return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('نسيت كلمة المرور؟', style: TextStyle(color: Colors.red)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            onPressed: _isFormFilled ? _submit : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              disabledBackgroundColor: Colors.grey.shade300,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              elevation: 0,
                            ),
                            child: Text(
                              'دخول',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _isFormFilled ? Colors.white : Colors.black26,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}