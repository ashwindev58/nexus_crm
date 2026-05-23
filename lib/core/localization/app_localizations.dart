import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // Splash screen
      'unlockingPotential': 'Unlocking Corporate Potential',
      'welcomeToCRM': 'Welcome to Nexus CRM',
      
      // Login screen
      'signIn': 'Sign In',
      'enterCredentials': 'Enter your credentials to continue',
      'emailAddress': 'Email Address',
      'password': 'Password',
      'loginSuccess': 'Login Success',
      'loginFailed': 'Login Failed',
      'emailRequired': 'Please enter your email',
      'passwordRequired': 'Please enter your password',
      'invalidEmail': 'Please enter a valid email address',
      'passwordTooShort': 'Password must be at least 6 characters',
      
      // Dashboard screen
      'crmDashboard': 'CRM Dashboard',
      'totalCompanies': 'Total Companies',
      'revenue': 'Revenue',
      'activeClients': 'Active Clients',
      'pendingTasks': 'Pending Tasks',
      'recentActivity': 'Recent Activity Stream',
      'upcomingMeetings': 'Upcoming Meetings',
      'refresh': 'Refresh',
      'devMode': 'DEV MODE',
      'stagingMode': 'STAGING MODE',
      'signOut': 'Sign Out',
      
      // Companies screen
      'companies': 'Companies',
      'searchCompanies': 'Search companies...',
      'allStatuses': 'All Statuses',
      'statusActive': 'Active',
      'statusPending': 'Pending',
      'statusInactive': 'Inactive',
      'noCompaniesFound': 'No companies found matching criteria.',
      'offlineCacheView': 'Offline Cache View',
      'details': 'Company Details',
      'username': 'Username',
      'website': 'Website',
      'phone': 'Phone',
      'companyName': 'Company Name',
      'catchPhrase': 'Catch Phrase',
      'bs': 'Business Strategy',
      'city': 'City',
      'street': 'Street',
      'suite': 'Suite',
      'zipcode': 'Zipcode',
      'aboutCompany': 'About Company',
      'location': 'Location Address',
      'lastActive': 'Last Active',
      'unknown': 'Unknown',
    },
    'ml': {
      // Splash screen
      'unlockingPotential': 'കോർപ്പറേറ്റ് കഴിവുകൾ അൺലോക്ക് ചെയ്യുന്നു',
      'welcomeToCRM': 'നെക്സസ് സിആർഎമ്മിലേക്ക് സ്വാഗതം',
      
      // Login screen
      'signIn': 'ലോഗിൻ ചെയ്യുക',
      'enterCredentials': 'തുടരുന്നതിന് നിങ്ങളുടെ വിവരങ്ങൾ നൽകുക',
      'emailAddress': 'ഇമെയിൽ വിലാസം',
      'password': 'പാസ്‌വേഡ്',
      'loginSuccess': 'ലോഗിൻ വിജയിച്ചു',
      'loginFailed': 'ലോഗിൻ പരാജയപ്പെട്ടു',
      'emailRequired': 'ദയവായി ഇമെയിൽ നൽകുക',
      'passwordRequired': 'ദയവായി പാസ്‌വേഡ് നൽകുക',
      'invalidEmail': 'ദയവായി സാധുവായ ഇമെയിൽ നൽകുക',
      'passwordTooShort': 'പാസ്‌വേഡിന് കുറഞ്ഞത് 6 അക്ഷരങ്ങൾ വേണം',
      
      // Dashboard screen
      'crmDashboard': 'സിആർഎം ഡാഷ്‌ബോർഡ്',
      'totalCompanies': 'ആകെ കമ്പനികൾ',
      'revenue': 'വരുമാനം',
      'activeClients': 'സജീവ ഉപഭോക്താക്കൾ',
      'pendingTasks': 'ബാക്കിയുള്ള ജോലികൾ',
      'recentActivity': 'സമീപകാല പ്രവർത്തനങ്ങൾ',
      'upcomingMeetings': 'വരാനിരിക്കുന്ന മീറ്റിംഗുകൾ',
      'refresh': 'പുതുക്കുക',
      'devMode': 'ഡെവലപ്പ്മെന്റ് മോഡ്',
      'stagingMode': 'സ്റ്റേജിംഗ് മോഡ്',
      'signOut': 'ലോഗ് ഔട്ട് ചെയ്യുക',
      
      // Companies screen
      'companies': 'കമ്പനികൾ',
      'searchCompanies': 'കമ്പനികൾ തിരയുക...',
      'allStatuses': 'എല്ലാ അവസ്ഥകളും',
      'statusActive': 'സജീവം',
      'statusPending': 'തീരുമാനമാകാത്തത്',
      'statusInactive': 'നിഷ്ക്രിയം',
      'noCompaniesFound': 'കമ്പനികൾ ഒന്നും കണ്ടെത്തിയില്ല.',
      'offlineCacheView': 'ഓഫ്‌ലൈൻ കാഷെ കാഴ്ച',
      'details': 'കമ്പനി വിവരങ്ങൾ',
      'username': 'ഉപയോക്തൃനാമം',
      'website': 'വെബ്സൈറ്റ്',
      'phone': 'ഫോൺ നമ്പർ',
      'companyName': 'കമ്പനിയുടെ പേര്',
      'catchPhrase': 'മുദ്രാവാക്യം',
      'bs': 'ബിസിനസ്സ് തന്ത്രം',
      'city': 'നഗരം',
      'street': 'തെരുവ്',
      'suite': 'മുറി/സ്യൂട്ട്',
      'zipcode': 'പിൻകോഡ്',
      'aboutCompany': 'കമ്പനിയെക്കുറിച്ച്',
      'location': 'വിലാസം',
      'lastActive': 'അവസാനം സജീവമായത്',
      'unknown': 'അജ്ഞാതം',
    }
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? _localizedValues['en']?[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ml'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
