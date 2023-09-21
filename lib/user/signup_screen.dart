import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:sihpro/utils/global_methods.dart';
import 'package:sihpro/utils/clr.dart';
import 'package:sihpro/utils/layout.dart';
import 'package:sihpro/utils/txt.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  final TextEditingController _aadharController = TextEditingController();
  final FocusNode _aadharFocusNode = FocusNode();

  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _aadharController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _aadharFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.orange,
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 180),
            child: Text(
              "getJOBS",
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ),
        body: Stack(children: [
          _signUpBackground(),
          Container(
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(layout.padding * 1.5),
              child: ListView(children: [
                Form(
                  key: _signUpFormKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: layout.padding),
                      child: _nameFormField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: layout.padding),
                      child: _emailFormField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: layout.padding),
                      child: _passwordFormField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: layout.padding),
                      child: _phoneFormField(),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(bottom: layout.padding * 2),
                      child: _addressFormField(),
                    ),
                    _isLoading
                        ? _progressIndicator()
                        : Padding(
                      padding: const EdgeInsets.all(layout.padding),
                      child: _signUpButton(),
                    ),
                    _haveAccount(),
                  ]),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _signUpBackground() {
    return Container(
      color: Colors.white,
    );
  }

  Widget _nameFormField() {
    return TextFormField(
      enabled: true,
      focusNode: _nameFocusNode,
      autofocus: false,
      controller: _nameController,
      style: txt.fieldLight,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => _emailFocusNode.requestFocus(),
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: txt.labelLight,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: txt.labelLight,
        errorStyle: txt.error,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.error,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid name';
        } else {
          return null;
        }
      },
    );
  }

  Widget _emailFormField() {
    return TextFormField(
      enabled: true,
      focusNode: _emailFocusNode,
      autofocus: false,
      controller: _emailController,
      style: txt.fieldLight,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => _passwordFocusNode.requestFocus(),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: txt.labelLight,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: txt.labelLight,
        errorStyle: txt.error,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.error,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Please enter a valid email';
        } else {
          return null;
        }
      },
    );
  }

  Widget _passwordFormField() {
    return TextFormField(
      enabled: true,
      focusNode: _passwordFocusNode,
      autofocus: false,
      controller: _passwordController,
      style: txt.fieldLight,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => _phoneFocusNode.requestFocus(),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: txt.labelLight,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: txt.labelLight,
        errorStyle: txt.error,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.error,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty || value.length < 7) {
          return 'Please enter a valid password (min 7 characters)';
        } else {
          return null;
        }
      },
    );
  }

  Widget _phoneFormField() {
    return TextFormField(
      enabled: true,
      focusNode: _phoneFocusNode,
      autofocus: false,
      controller: _phoneController,
      style: txt.fieldLight,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => _aadharFocusNode.requestFocus(),
      decoration: InputDecoration(
        labelText: 'Phone number',
        labelStyle: txt.labelLight,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: txt.labelLight,
        errorStyle: txt.error,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.error,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid phone number';
        } else {
          return null;
        }
      },
    );
  }

  Widget _addressFormField() {
    return TextFormField(
      enabled: true,
      focusNode: _aadharFocusNode,
      autofocus: false,
      controller: _aadharController,
      style: txt.fieldLight,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onEditingComplete: () => _aadharFocusNode.unfocus(),
      decoration: InputDecoration(
        labelText: 'Aadhar Number',
        labelStyle: txt.labelLight,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: txt.labelLight,
        errorStyle: txt.error,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.light,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: clr.error,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid Aadhar number';
        } else {
          return null;
        }
      },
    );
  }

  Widget _progressIndicator() {
    return const Center(
      child: SizedBox(
        height: 70,
        width: 70,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _signUpButton() {
    return MaterialButton(
      onPressed: _submitSignUpForm,
      color: clr.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(layout.radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(layout.padding * 0.75),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Sign up   ',
                style: txt.button,
              ),
              Icon(
                Icons.person_add,
                color: Colors.white,
                size: layout.iconMedium,
              )
            ]),
      ),
    );
  }

  void _submitSignUpForm() async {
    final isValid = _signUpFormKey.currentState!.validate();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim().toLowerCase(),
          password: _passwordController.text.trim(),
        );
        final User? user = _auth.currentUser;
        final uID = user!.uid;

        FirebaseFirestore.instance.collection('users').doc(uID).set(
          {
            'id': uID,
            'name': _nameController.text,
            'email': _emailController.text,
            'phone_number': _phoneController.text,
            'aadhar': _aadharController.text,
            'created': Timestamp.now(),
          },
        );
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        GlobalMethod.showErrorDialog(
          context: context,
          icon: Icons.error,
          iconColor: clr.error,
          title: 'Error',
          body: error.toString(),
          buttonText: 'OK',
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  Widget _haveAccount() {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          const TextSpan(
            text: 'Already have an account?',
            style: txt.body2Light,
          ),
          const TextSpan(text: '     '),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
              Navigator.canPop(context) ? Navigator.pop(context) : null,
            text: 'Login',
            style: txt.mediumTextButton,
          ),
        ]),
      ),
    );
  }
}

























