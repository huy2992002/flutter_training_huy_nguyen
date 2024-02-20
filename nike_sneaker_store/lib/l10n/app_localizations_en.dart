import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get welcomeTo => 'Welcome To \nNike';

  @override
  String get letStartJourney => 'Let’s Start Journey \nWith Nike';

  @override
  String get smartGorgeousFashionable => 'Smart, Gorgeous & Fashionable \nCollection Explore Now';

  @override
  String get youHavePowerTo => 'You Have the \nPower To';

  @override
  String get thereAreManyBeautifulAttractive => 'There Are Many Beautiful And Attractive \nPlants To Your Room';

  @override
  String get helloAgain => 'Hello Again!';

  @override
  String get fillYourDetails => 'Fill Your Details';

  @override
  String get registerAccount => 'Register Account';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get yourName => 'Your Name';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signOut => 'Sign Out';

  @override
  String get newUser => 'New User? ';

  @override
  String get createAccount => 'Create Account';

  @override
  String get recoveryPassword => 'Recovery Password';

  @override
  String get alreadyAccount => 'Already Have Account?';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get enterEmailResetPassword => 'Enter Your Email Account To Reset \nYour Password';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get checkYourEmail => 'Check Your Email';

  @override
  String get weHaveSendRecoveryCode => 'We Have Send Password Recovery Code In Your Email';

  @override
  String get otpVerification => 'OTP Verification';

  @override
  String get pleaseCheckYourEmail => 'Please Check Your Email To See The Verification Code';

  @override
  String get otpCode => 'OTP Code';

  @override
  String get verify => 'Verify';

  @override
  String get resendCode => 'Resend code to';

  @override
  String get explore => 'Explore';

  @override
  String get lookingForShoes => 'Looking for shoes';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get allShoes => 'All Shoes';

  @override
  String get outDoor => 'Outdoor';

  @override
  String get tennis => 'Tennis';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';

  @override
  String get fieldIsRequired => 'This field is required';

  @override
  String get passwordLeast6 => 'Password must be at least 6 digits long';

  @override
  String get validEmailAddress => 'Enter a valid email address';

  @override
  String get confirmPasswordNotMatch => 'Confirm password is not match';

  @override
  String discountOff(int discount) {
    return '$discount% OFF';
  }
}
