import 'package:beamer/beamer.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/constants/common_size.dart';
import 'package:practice/states/user_provider.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  );

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _verifyNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  VerificationStatus _verificationStatus = VerificationStatus.none;

  double getVerificationHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      default:
        return 48;
    }
  }

  void attemptVerify() async {
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
    });
    context.read<UserProvider>().setUserAuth(true);
    // context.beamToNamed('/');
    // context.beamToReplacementNamed('/');
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
    ignoring: _verificationStatus == VerificationStatus.verifying,
      child: Form(
        key: _formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            Size size = MediaQuery.of(context).size;

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                elevation: AppBarTheme.of(context).elevation,
              ),
              body: Padding(
                padding: const EdgeInsets.all(common_bg_padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ExtendedImage.asset(
                          'assets/images/img.png',
                          width: size.width * 0.2,
                          height: size.height * 0.2,
                        ),
                        SizedBox(width: common_bg_padding),
                        Text(
                          'ニンジンマーケットは電話番号で\n'
                          '会員登録を行っております。\n'
                          '皆様の個人情報を安全に取扱い、\n'
                          '外部に漏出されません。',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: common_bg_padding),
                    TextFormField(
                      controller: _phoneNumberController,
                      validator: (phoneNumber) {
                        if (phoneNumber != null && phoneNumber.length == 13) {
                          return null;
                        } else {
                          return '電話番号が正しくないです。';
                        }
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [MaskedInputFormatter('000 0000 0000')],

                      decoration: InputDecoration(
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        hintText: '080 1234 5678',
                        hintStyle: TextStyle(color: Theme.of(context).hintColor),
                      ),
                    ),
                    SizedBox(height: common_sm_padding),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState != null) {
                          bool passed = _formKey.currentState!.validate();

                          if (passed) {
                            setState(() {
                              _verificationStatus = VerificationStatus.codeSent;
                            });
                          }
                        }
                      },
                      child: Text('暗証番号転送'),
                    ),
                    SizedBox(height: common_bg_padding),
                    AnimatedOpacity(
                      opacity: _verificationStatus == VerificationStatus.none
                          ? 0
                          : 1,
                      duration: Duration(milliseconds: 300),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: getVerificationHeight(_verificationStatus),
                        child: TextFormField(
                          controller: _verifyNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [MaskedInputFormatter('000000')],

                          decoration: InputDecoration(
                            border: inputBorder,
                            focusedBorder: inputBorder,
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: getVerificationHeight(_verificationStatus),
                      child: TextButton(onPressed: () {
                        attemptVerify();
                      }, child: _verificationStatus == VerificationStatus.verifying?CircularProgressIndicator(color: Colors.white):Text('暗証番号確認')),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

enum VerificationStatus { none, codeSent, verifying, verificationDone }
