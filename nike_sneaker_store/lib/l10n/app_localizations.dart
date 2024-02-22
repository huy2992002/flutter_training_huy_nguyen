import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome To \nNike'**
  String get welcomeTo;

  /// No description provided for @letStartJourney.
  ///
  /// In en, this message translates to:
  /// **'Let’s Start Journey \nWith Nike'**
  String get letStartJourney;

  /// No description provided for @smartGorgeousFashionable.
  ///
  /// In en, this message translates to:
  /// **'Smart, Gorgeous & Fashionable \nCollection Explore Now'**
  String get smartGorgeousFashionable;

  /// No description provided for @youHavePowerTo.
  ///
  /// In en, this message translates to:
  /// **'You Have the \nPower To'**
  String get youHavePowerTo;

  /// No description provided for @thereAreManyBeautifulAttractive.
  ///
  /// In en, this message translates to:
  /// **'There Are Many Beautiful And Attractive \nPlants To Your Room'**
  String get thereAreManyBeautifulAttractive;

  /// No description provided for @helloAgain.
  ///
  /// In en, this message translates to:
  /// **'Hello Again!'**
  String get helloAgain;

  /// No description provided for @fillYourDetails.
  ///
  /// In en, this message translates to:
  /// **'Fill Your Details'**
  String get fillYourDetails;

  /// No description provided for @registerAccount.
  ///
  /// In en, this message translates to:
  /// **'Register Account'**
  String get registerAccount;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get yourName;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @newUser.
  ///
  /// In en, this message translates to:
  /// **'New User? '**
  String get newUser;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @recoveryPassword.
  ///
  /// In en, this message translates to:
  /// **'Recovery Password'**
  String get recoveryPassword;

  /// No description provided for @alreadyAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account? '**
  String get alreadyAccount;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @enterEmailResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email Account To Reset \nYour Password'**
  String get enterEmailResetPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @checkYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get checkYourEmail;

  /// No description provided for @weHaveSendRecoveryCode.
  ///
  /// In en, this message translates to:
  /// **'We Have Send Password Recovery Code In Your Email'**
  String get weHaveSendRecoveryCode;

  /// No description provided for @otpVerification.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otpVerification;

  /// No description provided for @pleaseCheckYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please Check Your Email To See The Verification Code'**
  String get pleaseCheckYourEmail;

  /// No description provided for @otpCode.
  ///
  /// In en, this message translates to:
  /// **'OTP Code'**
  String get otpCode;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code to'**
  String get resendCode;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @lookingForShoes.
  ///
  /// In en, this message translates to:
  /// **'Looking for shoes'**
  String get lookingForShoes;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @allShoes.
  ///
  /// In en, this message translates to:
  /// **'All Shoes'**
  String get allShoes;

  /// No description provided for @outDoor.
  ///
  /// In en, this message translates to:
  /// **'Outdoor'**
  String get outDoor;

  /// No description provided for @tennis.
  ///
  /// In en, this message translates to:
  /// **'Tennis'**
  String get tennis;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @fieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldIsRequired;

  /// No description provided for @passwordLeast6.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 digits long'**
  String get passwordLeast6;

  /// No description provided for @validEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get validEmailAddress;

  /// No description provided for @confirmPasswordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Confirm password is not match'**
  String get confirmPasswordNotMatch;

  /// No description provided for @emailOrPasswordIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Email or password is incorrect'**
  String get emailOrPasswordIncorrect;

  /// No description provided for @emailAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Email already exists'**
  String get emailAlreadyExists;

  /// No description provided for @hintTextEmail.
  ///
  /// In en, this message translates to:
  /// **'xyz@gmail.com'**
  String get hintTextEmail;

  /// No description provided for @hintTextPassword.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get hintTextPassword;

  /// No description provided for @hintTextDefault.
  ///
  /// In en, this message translates to:
  /// **'xxxxxxxx'**
  String get hintTextDefault;

  /// No description provided for @nameNikeJordan.
  ///
  /// In en, this message translates to:
  /// **'Nike Jordan'**
  String get nameNikeJordan;

  /// No description provided for @descriptionNikeJordan.
  ///
  /// In en, this message translates to:
  /// **'The Nike Air Jordan 1 Retro High stands as an unmistakable icon in the sneaker world. Originating from the collaboration between Nike and Michael Jordan, this silhouette has transcended its basketball roots to become a staple in fashion, culture, and lifestyle.'**
  String get descriptionNikeJordan;

  /// No description provided for @nameNikeAirMax.
  ///
  /// In en, this message translates to:
  /// **'Nike Air Max'**
  String get nameNikeAirMax;

  /// No description provided for @descriptionNikeAirMax.
  ///
  /// In en, this message translates to:
  /// **'The Nike Air Max 90 is an iconic sneaker that revolutionized the world of athletic footwear. With its distinctive design and pioneering air cushioning technology, this shoe has captivated sneaker enthusiasts, athletes, and fashion-forward individuals for decades.'**
  String get descriptionNikeAirMax;

  /// No description provided for @nameNikeAirMax200.
  ///
  /// In en, this message translates to:
  /// **'Nike Air Max 200'**
  String get nameNikeAirMax200;

  /// No description provided for @descriptionNikeAirMax200.
  ///
  /// In en, this message translates to:
  /// **'The Nike Air Max 200 is a modern twist on the classic Air Max legacy, offering a bold, refreshed look while retaining the comfort and performance that fans have come to expect from the Air Max series.'**
  String get descriptionNikeAirMax200;

  /// No description provided for @nameNikeAirMax270.
  ///
  /// In en, this message translates to:
  /// **'Nike Air Max 270'**
  String get nameNikeAirMax270;

  /// No description provided for @descriptionNikeAirMax270.
  ///
  /// In en, this message translates to:
  /// **'The Nike Air Max 270 represents a significant milestone in the evolution of the Air Max family, blending classic style with modern technology to create a sneaker that\'s visually striking and supremely comfortable. Designed to support lifestyle wear rather than sports performance, the Air Max 270 draws inspiration from the Air Max lineage, showcasing Nike\'s biggest heel Air unit yet.'**
  String get descriptionNikeAirMax270;

  /// No description provided for @nameNikeClubMax.
  ///
  /// In en, this message translates to:
  /// **'Nike Club Max'**
  String get nameNikeClubMax;

  /// No description provided for @descriptionNikeClubMax.
  ///
  /// In en, this message translates to:
  /// **'The Nike Club Max represents a significant milestone in the evolution of the Air Max family, blending classic style with modern technology to create a sneaker that\'s visually striking and supremely comfortable. Designed to support lifestyle wear rather than sports performance, the Air Max 270 draws inspiration from the Air Max lineage, showcasing Nike\'s biggest heel Air unit yet.'**
  String get descriptionNikeClubMax;

  /// No description provided for @popularShoes.
  ///
  /// In en, this message translates to:
  /// **'Popular Shoes'**
  String get popularShoes;

  /// No description provided for @newArrivals.
  ///
  /// In en, this message translates to:
  /// **'New Arrivals'**
  String get newArrivals;

  /// No description provided for @summerSale.
  ///
  /// In en, this message translates to:
  /// **'Summer Sale'**
  String get summerSale;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @discountOff.
  ///
  /// In en, this message translates to:
  /// **'{discount}% OFF'**
  String discountOff(int discount);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
