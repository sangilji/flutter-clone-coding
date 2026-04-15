import 'package:beamer/beamer.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/constants/common_size.dart';
import 'package:practice/states/user_provider.dart';
import 'package:practice/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

const duration = Duration(milliseconds: 300);

class _AuthPageState extends State<AuthPage> {
  final inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  );

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  VerificationStatus _verificationStatus = VerificationStatus.none;

  String? _verificationId;
  int? _forceResendingToken;

  double getVerificationHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      default:
        return 48;
    }
  }

  void attemptVerify(BuildContext context) async {
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: _codeController.text,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      logger.e('fail');
      SnackBar snackBar = SnackBar(content: Text('fail'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
    });
    // context.read<UserProvider>().setUserAuth(true);
    // context.beamToNamed('/');
    // context.beamToReplacementNamed('/');
    context.go('/');
  }

  _getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String address = prefs.getString('address') ?? "";
    logger.d('address : $address');
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;

        return IgnorePointer(
          ignoring: _verificationStatus == VerificationStatus.verifying,
          child: Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                elevation: AppBarTheme.of(context).elevation,
              ),
              body: GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: Padding(
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
                            'キャロットマーケットは電話番号で\n'
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
                        inputFormatters: [
                          MaskedInputFormatter('000 0000 0000'),
                        ],

                        decoration: InputDecoration(
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          hintText: '080 1234 5678',
                          hintStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                      SizedBox(height: common_sm_padding),
                      TextButton(
                        onPressed: () async {
                          // _getAddress();
                          if (_verificationStatus ==
                              VerificationStatus.codeSending) {
                            return;
                          }
                          if (_formKey.currentState != null) {
                            bool passed = _formKey.currentState!.validate();
                            print(passed);
                            if (passed) {
                              String phoneNumber = _phoneNumberController.text;
                              phoneNumber = phoneNumber
                                  .replaceAll(' ', '')
                                  .replaceFirst('0', '');
                              FirebaseAuth auth = FirebaseAuth.instance;



                              await auth.verifyPhoneNumber(
                                verificationCompleted: (credential) async {
                                  logger.d('complete');
                                  await auth.signInWithCredential(credential);
                                  setState(() {
                                    _verificationStatus =
                                        VerificationStatus.codeSending;
                                  });
                                },
                                phoneNumber: '+81$phoneNumber',
                                forceResendingToken: _forceResendingToken,
                                verificationFailed:
                                    (FirebaseAuthException error) {
                                      setState(() {
                                        _verificationStatus =
                                            VerificationStatus.none;
                                      });
                                      logger.e(error.message);
                                    },
                                codeSent:
                                    (
                                      String verificationId,
                                      int? forceResendingToken,
                                    ) async {
                                      setState(() {
                                        _verificationStatus =
                                            VerificationStatus.codeSent;
                                      });
                                      _verificationId = verificationId;
                                      _forceResendingToken =
                                          forceResendingToken;
                                    },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
                            }
                          }
                        },
                        child:
                            (_verificationStatus ==
                                VerificationStatus.codeSending)
                            ? SizedBox(
                                height: 26,
                                width: 26,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text('暗証番号転送'),
                      ),
                      SizedBox(height: common_bg_padding),
                      AnimatedOpacity(
                        opacity: _verificationStatus == VerificationStatus.none
                            ? 0
                            : 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: AnimatedContainer(
                          duration: duration,
                          curve: Curves.easeInOut,
                          height: getVerificationHeight(_verificationStatus),
                          child: TextFormField(
                            controller: _codeController,
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
                        duration: duration,
                        curve: Curves.easeInOut,
                        height: getVerificationHeight(_verificationStatus),
                        child: TextButton(
                          onPressed: () {
                            attemptVerify(context);
                          },
                          child:
                              _verificationStatus ==
                                  VerificationStatus.verifying
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text('暗証番号確認'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

enum VerificationStatus {
  none,
  codeSending,
  codeSent,
  verifying,
  verificationDone,
}
