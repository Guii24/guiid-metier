import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic>? getPhoneNumberCountriesList() {
  return [
    {"name": "Afghanistan", "flag": "🇦🇫", "code": "AF", "dial_code": "+93"},
    {"name": "Albania", "flag": "🇦🇱", "code": "AL", "dial_code": "+355"},
    {"name": "Algeria", "flag": "🇩🇿", "code": "DZ", "dial_code": "+213"},
    {
      "name": "American Samoa",
      "flag": "🇦🇸",
      "code": "AS",
      "dial_code": "+1684"
    },
    {"name": "Andorra", "flag": "🇦🇩", "code": "AD", "dial_code": "+376"},
    {"name": "Angola", "flag": "🇦🇴", "code": "AO", "dial_code": "+244"},
    {
      "name": "Antigua and Barbuda",
      "flag": "🇦🇬",
      "code": "AG",
      "dial_code": "+1268"
    },
    {"name": "Argentina", "flag": "🇦🇷", "code": "AR", "dial_code": "+54"},
    {"name": "Armenia", "flag": "🇦🇲", "code": "AM", "dial_code": "+374"},
    {"name": "Aruba", "flag": "🇦🇼", "code": "AW", "dial_code": "+297"},
    {"name": "Australia", "flag": "🇦🇺", "code": "AU", "dial_code": "+61"},
    {"name": "Austria", "flag": "🇦🇹", "code": "AT", "dial_code": "+43"},
    {"name": "Azerbaijan", "flag": "🇦🇿", "code": "AZ", "dial_code": "+994"},
    {"name": "Bahamas", "flag": "🇧🇸", "code": "BS", "dial_code": "+1242"},
    {"name": "Bangladesh", "flag": "🇧🇩", "code": "BD", "dial_code": "+880"},
    {"name": "Barbados", "flag": "🇧🇧", "code": "BB", "dial_code": "+1246"},
    {"name": "Belarus", "flag": "🇧🇾", "code": "BY", "dial_code": "+375"},
    {"name": "Belgium", "flag": "🇧🇪", "code": "BE", "dial_code": "+32"},
    {"name": "Belize", "flag": "🇧🇿", "code": "BZ", "dial_code": "+501"},
    {"name": "Benin", "flag": "🇧🇯", "code": "BJ", "dial_code": "+229"},
    {"name": "Bermuda", "flag": "🇧🇲", "code": "BM", "dial_code": "+1441"},
    {"name": "Bhutan", "flag": "🇧🇹", "code": "BT", "dial_code": "+975"},
    {
      "name": "Bolivia, Plurinational State of bolivia",
      "flag": "🇧🇴",
      "code": "BO",
      "dial_code": "+591"
    },
    {
      "name": "Bosnia and Herzegovina",
      "flag": "🇧🇦",
      "code": "BA",
      "dial_code": "+387"
    },
    {"name": "Botswana", "flag": "🇧🇼", "code": "BW", "dial_code": "+267"},
    {"name": "Brazil", "flag": "🇧🇷", "code": "BR", "dial_code": "+55"},
    {
      "name": "Brunei Darussalam",
      "flag": "🇧🇳",
      "code": "BN",
      "dial_code": "+673"
    },
    {"name": "Bulgaria", "flag": "🇧🇬", "code": "BG", "dial_code": "+359"},
    {"name": "Burkina Faso", "flag": "🇧🇫", "code": "BF", "dial_code": "+226"},
    {"name": "Cambodia", "flag": "🇰🇭", "code": "KH", "dial_code": "+855"},
    {"name": "Cameroon", "flag": "🇨🇲", "code": "CM", "dial_code": "+237"},
    {"name": "Canada", "flag": "🇨🇦", "code": "CA", "dial_code": "+1"},
    {"name": "Cape Verde", "flag": "🇨🇻", "code": "CV", "dial_code": "+238"},
    {
      "name": "Cayman Islands",
      "flag": "🇰🇾",
      "code": "KY",
      "dial_code": "+345"
    },
    {
      "name": "Central African Republic",
      "flag": "🇨🇫",
      "code": "CF",
      "dial_code": "+236"
    },
    {"name": "Chile", "flag": "🇨🇱", "code": "CL", "dial_code": "+56"},
    {"name": "Curaçao", "flag": "🇨🇼", "code": "CW", "dial_code": "+599"},
    {"name": "Colombia", "flag": "🇨🇴", "code": "CO", "dial_code": "+57"},
    {"name": "Comoros", "flag": "🇰🇲", "code": "KM", "dial_code": "+269"},
    {"name": "Congo", "flag": "🇨🇬", "code": "CG", "dial_code": "+242"},
    {
      "name": "Congo, The Democratic Republic of the Congo",
      "flag": "🇨🇩",
      "code": "CD",
      "dial_code": "+243"
    },
    {"name": "Cook Islands", "flag": "🇨🇰", "code": "CK", "dial_code": "+682"},
    {"name": "Costa Rica", "flag": "🇨🇷", "code": "CR", "dial_code": "+506"},
    {
      "name": "Cote d'Ivoire",
      "flag": "🇨🇮",
      "code": "CI",
      "dial_code": "+225"
    },
    {"name": "Croatia", "flag": "🇭🇷", "code": "HR", "dial_code": "+385"},
    {"name": "Cyprus", "flag": "🇨🇾", "code": "CY", "dial_code": "+357"},
    {
      "name": "Czech Republic",
      "flag": "🇨🇿",
      "code": "CZ",
      "dial_code": "+420"
    },
    {"name": "Denmark", "flag": "🇩🇰", "code": "DK", "dial_code": "+45"},
    {"name": "Djibouti", "flag": "🇩🇯", "code": "DJ", "dial_code": "+253"},
    {"name": "Dominica", "flag": "🇩🇲", "code": "DM", "dial_code": "+1767"},
    {
      "name": "Dominican Republic",
      "flag": "🇩🇴",
      "code": "DO",
      "dial_code": "+1849"
    },
    {"name": "Ecuador", "flag": "🇪🇨", "code": "EC", "dial_code": "+593"},
    {"name": "Egypt", "flag": "🇪🇬", "code": "EG", "dial_code": "+20"},
    {"name": "El Salvador", "flag": "🇸🇻", "code": "SV", "dial_code": "+503"},
    {
      "name": "Equatorial Guinea",
      "flag": "🇬🇶",
      "code": "GQ",
      "dial_code": "+240"
    },
    {"name": "Ethiopia", "flag": "🇪🇹", "code": "ET", "dial_code": "+251"},
    {
      "name": "Falkland Islands (Malvinas)",
      "flag": "🇫🇰",
      "code": "FK",
      "dial_code": "+500"
    },
    {
      "name": "Faroe Islands",
      "flag": "🇫🇴",
      "code": "FO",
      "dial_code": "+298"
    },
    {"name": "Fiji", "flag": "🇫🇯", "code": "FJ", "dial_code": "+679"},
    {"name": "Finland", "flag": "🇫🇮", "code": "FI", "dial_code": "+358"},
    {"name": "France", "flag": "🇫🇷", "code": "FR", "dial_code": "+33"},
    {
      "name": "French Guiana",
      "flag": "🇬🇫",
      "code": "GF",
      "dial_code": "+594"
    },
    {"name": "Gabon", "flag": "🇬🇦", "code": "GA", "dial_code": "+241"},
    {"name": "Gambia", "flag": "🇬🇲", "code": "GM", "dial_code": "+220"},
    {"name": "Georgia", "flag": "🇬🇪", "code": "GE", "dial_code": "+995"},
    {"name": "Germany", "flag": "🇩🇪", "code": "DE", "dial_code": "+49"},
    {"name": "Ghana", "flag": "🇬🇭", "code": "GH", "dial_code": "+233"},
    {"name": "Gibraltar", "flag": "🇬🇮", "code": "GI", "dial_code": "+350"},
    {"name": "Greece", "flag": "🇬🇷", "code": "GR", "dial_code": "+30"},
    {"name": "Greenland", "flag": "🇬🇱", "code": "GL", "dial_code": "+299"},
    {"name": "Grenada", "flag": "🇬🇩", "code": "GD", "dial_code": "+1473"},
    {"name": "Guadeloupe", "flag": "🇬🇵", "code": "GP", "dial_code": "+590"},
    {"name": "Guatemala", "flag": "🇬🇹", "code": "GT", "dial_code": "+502"},
    {"name": "Guernsey", "flag": "🇬🇬", "code": "GG", "dial_code": "+44"},
    {"name": "Guyana", "flag": "🇬🇾", "code": "GY", "dial_code": "+592"},
    {"name": "Haiti", "flag": "🇭🇹", "code": "HT", "dial_code": "+509"},
    {"name": "Honduras", "flag": "🇭🇳", "code": "HN", "dial_code": "+504"},
    {"name": "Hong Kong", "flag": "🇭🇰", "code": "HK", "dial_code": "+852"},
    {"name": "Hungary", "flag": "🇭🇺", "code": "HU", "dial_code": "+36"},
    {"name": "India", "flag": "🇮🇳", "code": "IN", "dial_code": "+91"},
    {"name": "Indonesia", "flag": "🇮🇩", "code": "ID", "dial_code": "+62"},
    {"name": "Iraq", "flag": "🇮🇶", "code": "IQ", "dial_code": "+964"},
    {"name": "Ireland", "flag": "🇮🇪", "code": "IE", "dial_code": "+353"},
    {"name": "Isle of Man", "flag": "🇮🇲", "code": "IM", "dial_code": "+44"},
    {"name": "Israel", "flag": "🇮🇱", "code": "IL", "dial_code": "+972"},
    {"name": "Italy", "flag": "🇮🇹", "code": "IT", "dial_code": "+39"},
    {"name": "Jamaica", "flag": "🇯🇲", "code": "JM", "dial_code": "+1876"},
    {"name": "Japan", "flag": "🇯🇵", "code": "JP", "dial_code": "+81"},
    {"name": "Jersey", "flag": "🇯🇪", "code": "JE", "dial_code": "+44"},
    {"name": "Jordan", "flag": "🇯🇴", "code": "JO", "dial_code": "+962"},
    {"name": "Kazakhstan", "flag": "🇰🇿", "code": "KZ", "dial_code": "+7"},
    {"name": "Kenya", "flag": "🇰🇪", "code": "KE", "dial_code": "+254"},
    {
      "name": "Korea, Republic of South Korea",
      "flag": "🇰🇷",
      "code": "KR",
      "dial_code": "+82"
    },
    {"name": "Kuwait", "flag": "🇰🇼", "code": "KW", "dial_code": "+965"},
    {"name": "Kyrgyzstan", "flag": "🇰🇬", "code": "KG", "dial_code": "+996"},
    {"name": "Laos", "flag": "🇱🇦", "code": "LA", "dial_code": "+856"},
    {"name": "Latvia", "flag": "🇱🇻", "code": "LV", "dial_code": "+371"},
    {"name": "Lebanon", "flag": "🇱🇧", "code": "LB", "dial_code": "+961"},
    {"name": "Lesotho", "flag": "🇱🇸", "code": "LS", "dial_code": "+266"},
    {
      "name": "Libyan Arab Jamahiriya",
      "flag": "🇱🇾",
      "code": "LY",
      "dial_code": "+218"
    },
    {
      "name": "Liechtenstein",
      "flag": "🇱🇮",
      "code": "LI",
      "dial_code": "+423"
    },
    {"name": "Lithuania", "flag": "🇱🇹", "code": "LT", "dial_code": "+370"},
    {"name": "Luxembourg", "flag": "🇱🇺", "code": "LU", "dial_code": "+352"},
    {"name": "Macao", "flag": "🇲🇴", "code": "MO", "dial_code": "+853"},
    {"name": "Macedonia", "flag": "🇲🇰", "code": "MK", "dial_code": "+389"},
    {"name": "Madagascar", "flag": "🇲🇬", "code": "MG", "dial_code": "+261"},
    {"name": "Malawi", "flag": "🇲🇼", "code": "MW", "dial_code": "+265"},
    {"name": "Malaysia", "flag": "🇲🇾", "code": "MY", "dial_code": "+60"},
    {"name": "Malta", "flag": "🇲🇹", "code": "MT", "dial_code": "+356"},
    {"name": "Mauritius", "flag": "🇲🇺", "code": "MU", "dial_code": "+230"},
    {"name": "Mayotte", "flag": "🇾🇹", "code": "YT", "dial_code": "+262"},
    {"name": "Mexico", "flag": "🇲🇽", "code": "MX", "dial_code": "+52"},
    {
      "name": "Micronesia, Federated States of Micronesia",
      "flag": "🇫🇲",
      "code": "FM",
      "dial_code": "+691"
    },
    {"name": "Moldova", "flag": "🇲🇩", "code": "MD", "dial_code": "+373"},
    {"name": "Mongolia", "flag": "🇲🇳", "code": "MN", "dial_code": "+976"},
    {"name": "Montenegro", "flag": "🇲🇪", "code": "ME", "dial_code": "+382"},
    {"name": "Montserrat", "flag": "🇲🇸", "code": "MS", "dial_code": "+1664"},
    {"name": "Morocco", "flag": "🇲🇦", "code": "MA", "dial_code": "+212"},
    {"name": "Mozambique", "flag": "🇲🇿", "code": "MZ", "dial_code": "+258"},
    {"name": "Myanmar", "flag": "🇲🇲", "code": "MM", "dial_code": "+95"},
    {"name": "Namibia", "flag": "🇳🇦", "code": "NA", "dial_code": "+264"},
    {"name": "Nepal", "flag": "🇳🇵", "code": "NP", "dial_code": "+977"},
    {"name": "Netherlands", "flag": "🇳🇱", "code": "NL", "dial_code": "+31"},
    {
      "name": "New Caledonia",
      "flag": "🇳🇨",
      "code": "NC",
      "dial_code": "+687"
    },
    {"name": "New Zealand", "flag": "🇳🇿", "code": "NZ", "dial_code": "+64"},
    {"name": "Nicaragua", "flag": "🇳🇮", "code": "NI", "dial_code": "+505"},
    {"name": "Niger", "flag": "🇳🇪", "code": "NE", "dial_code": "+227"},
    {"name": "Nigeria", "flag": "🇳🇬", "code": "NG", "dial_code": "+234"},
    {
      "name": "Norfolk Island",
      "flag": "🇳🇫",
      "code": "NF",
      "dial_code": "+672"
    },
    {"name": "Norway", "flag": "🇳🇴", "code": "NO", "dial_code": "+47"},
    {"name": "Oman", "flag": "🇴🇲", "code": "OM", "dial_code": "+968"},
    {"name": "Pakistan", "flag": "🇵🇰", "code": "PK", "dial_code": "+92"},
    {
      "name": "Palestinian Territory, Occupied",
      "flag": "🇵🇸",
      "code": "PS",
      "dial_code": "+970"
    },
    {"name": "Panama", "flag": "🇵🇦", "code": "PA", "dial_code": "+507"},
    {
      "name": "Papua New Guinea",
      "flag": "🇵🇬",
      "code": "PG",
      "dial_code": "+675"
    },
    {"name": "Paraguay", "flag": "🇵🇾", "code": "PY", "dial_code": "+595"},
    {"name": "Peru", "flag": "🇵🇪", "code": "PE", "dial_code": "+51"},
    {"name": "Philippines", "flag": "🇵🇭", "code": "PH", "dial_code": "+63"},
    {"name": "Poland", "flag": "🇵🇱", "code": "PL", "dial_code": "+48"},
    {"name": "Portugal", "flag": "🇵🇹", "code": "PT", "dial_code": "+351"},
    {"name": "Puerto Rico", "flag": "🇵🇷", "code": "PR", "dial_code": "+1939"},
    {"name": "Qatar", "flag": "🇶🇦", "code": "QA", "dial_code": "+974"},
    {"name": "Romania", "flag": "🇷🇴", "code": "RO", "dial_code": "+40"},
    {"name": "Russia", "flag": "🇷🇺", "code": "RU", "dial_code": "+7"},
    {"name": "Rwanda", "flag": "🇷🇼", "code": "RW", "dial_code": "+250"},
    {"name": "Reunion", "flag": "🇷🇪", "code": "RE", "dial_code": "+262"},
    {
      "name": "Saint Helena, Ascension and Tristan Da Cunha",
      "flag": "🇸🇭",
      "code": "SH",
      "dial_code": "+290"
    },
    {
      "name": "Saint Kitts and Nevis",
      "flag": "🇰🇳",
      "code": "KN",
      "dial_code": "+1869"
    },
    {"name": "Saint Lucia", "flag": "🇱🇨", "code": "LC", "dial_code": "+1758"},
    {"name": "Saint Martin", "flag": "🇲🇫", "code": "MF", "dial_code": "+590"},
    {
      "name": "Saint Pierre and Miquelon",
      "flag": "🇵🇲",
      "code": "PM",
      "dial_code": "+508"
    },
    {
      "name": "Saint Vincent and the Grenadines",
      "flag": "🇻🇨",
      "code": "VC",
      "dial_code": "+1784"
    },
    {"name": "Samoa", "flag": "🇼🇸", "code": "WS", "dial_code": "+685"},
    {
      "name": "Sao Tome and Principe",
      "flag": "🇸🇹",
      "code": "ST",
      "dial_code": "+239"
    },
    {"name": "Saudi Arabia", "flag": "🇸🇦", "code": "SA", "dial_code": "+966"},
    {"name": "Senegal", "flag": "🇸🇳", "code": "SN", "dial_code": "+221"},
    {"name": "Serbia", "flag": "🇷🇸", "code": "RS", "dial_code": "+381"},
    {"name": "Seychelles", "flag": "🇸🇨", "code": "SC", "dial_code": "+248"},
    {"name": "Sierra Leone", "flag": "🇸🇱", "code": "SL", "dial_code": "+232"},
    {"name": "Singapore", "flag": "🇸🇬", "code": "SG", "dial_code": "+65"},
    {"name": "Slovakia", "flag": "🇸🇰", "code": "SK", "dial_code": "+421"},
    {"name": "Slovenia", "flag": "🇸🇮", "code": "SI", "dial_code": "+386"},
    {"name": "South Africa", "flag": "🇿🇦", "code": "ZA", "dial_code": "+27"},
    {"name": "Spain", "flag": "🇪🇸", "code": "ES", "dial_code": "+34"},
    {"name": "Sri Lanka", "flag": "🇱🇰", "code": "LK", "dial_code": "+94"},
    {"name": "Suriname", "flag": "🇸🇷", "code": "SR", "dial_code": "+597"},
    {"name": "Swaziland", "flag": "🇸🇿", "code": "SZ", "dial_code": "+268"},
    {"name": "Sweden", "flag": "🇸🇪", "code": "SE", "dial_code": "+46"},
    {"name": "Switzerland", "flag": "🇨🇭", "code": "CH", "dial_code": "+41"},
    {"name": "Taiwan", "flag": "🇹🇼", "code": "TW", "dial_code": "+886"},
    {
      "name": "Tanzania, United Republic of Tanzania",
      "flag": "🇹🇿",
      "code": "TZ",
      "dial_code": "+255"
    },
    {"name": "Thailand", "flag": "🇹🇭", "code": "TH", "dial_code": "+66"},
    {"name": "Timor-Leste", "flag": "🇹🇱", "code": "TL", "dial_code": "+670"},
    {"name": "Togo", "flag": "🇹🇬", "code": "TG", "dial_code": "+228"},
    {"name": "Tonga", "flag": "🇹🇴", "code": "TO", "dial_code": "+676"},
    {
      "name": "Trinidad and Tobago",
      "flag": "🇹🇹",
      "code": "TT",
      "dial_code": "+1868"
    },
    {"name": "Turkey", "flag": "🇹🇷", "code": "TR", "dial_code": "+90"},
    {"name": "Turkmenistan", "flag": "🇹🇲", "code": "TM", "dial_code": "+993"},
    {
      "name": "Turks and Caicos Islands",
      "flag": "🇹🇨",
      "code": "TC",
      "dial_code": "+1649"
    },
    {"name": "Uganda", "flag": "🇺🇬", "code": "UG", "dial_code": "+256"},
    {"name": "Ukraine", "flag": "🇺🇦", "code": "UA", "dial_code": "+380"},
    {
      "name": "United Arab Emirates",
      "flag": "🇦🇪",
      "code": "AE",
      "dial_code": "+971"
    },
    {
      "name": "United Kingdom",
      "flag": "🇬🇧",
      "code": "GB",
      "dial_code": "+44"
    },
    {"name": "United States", "flag": "🇺🇸", "code": "US", "dial_code": "+1"},
    {"name": "Uruguay", "flag": "🇺🇾", "code": "UY", "dial_code": "+598"},
    {"name": "Uzbekistan", "flag": "🇺🇿", "code": "UZ", "dial_code": "+998"},
    {
      "name": "Venezuela, Bolivarian Republic of Venezuela",
      "flag": "🇻🇪",
      "code": "VE",
      "dial_code": "+58"
    },
    {"name": "Vietnam", "flag": "🇻🇳", "code": "VN", "dial_code": "+84"},
    {
      "name": "Virgin Islands, British",
      "flag": "🇻🇬",
      "code": "VG",
      "dial_code": "+1284"
    },
    {
      "name": "Virgin Islands, U.S.",
      "flag": "🇻🇮",
      "code": "VI",
      "dial_code": "+1340"
    },
    {"name": "Yemen", "flag": "🇾🇪", "code": "YE", "dial_code": "+967"},
    {"name": "Zambia", "flag": "🇿🇲", "code": "ZM", "dial_code": "+260"},
    {"name": "Zimbabwe", "flag": "🇿🇼", "code": "ZW", "dial_code": "+263"}
  ];
}

List<PostRecord> combineTwoListCopy(
  List<PostRecord> list1,
  List<PostRecord> list2,
) {
  // combine two list and return one
  List<PostRecord> combinedList = [...list1, ...list2];
  return combinedList;
}

bool validatorName(String name) {
  bool emailValid = RegExp(r"^[a-zA-Z]{2,}$").hasMatch(name);

  if (name.isNotEmpty && emailValid) {
    return true;
  }
  return false;
}

String deleteSPlus(String number) {
  String str = number;
  String result = str.replaceAll(RegExp("[a-zA-Z:\s\+]"), "");
  return (result); // Output: "abcde"
}

DateTime years() {
  DateTime now = new DateTime.now();
  DateTime lastDayOfMonth = new DateTime(now.year - 18, now.month, now.day);
  return lastDayOfMonth;
}

String deleteSpaceAndDivider(String number) {
  String str = number;
  String result = str.replaceAll(RegExp(r'[( --)]'), '');
  return (result); // Output: "abcde"
}

String deleteSpaceAndDividerCopy(String number) {
  String str = number;
  String result = str.replaceAll(RegExp(r'[( --)]'), '');
  return (result); // Output: "abcde"
}

bool validatorNameCopy(String name) {
  bool emailValid =
      RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
          .hasMatch(name);

  if (name.isNotEmpty && emailValid) {
    return true;
  }
  return false;
}

bool counter(
  String image,
  int intLimit,
) {
  if (image.length < intLimit) {
    return false;
  }
  return true;
}

List<dynamic> search(
  List<dynamic> countryCodes,
  String searchingText,
) {
  List<dynamic> sortedList = [];
  if (searchingText.isEmpty) {
    return countryCodes;
  }
  for (dynamic i in countryCodes) {
    if (i["name"]
        .toString()
        .toLowerCase()
        .contains(searchingText.toLowerCase())) {
      sortedList.add(i);
    }
  }
  return sortedList;
}

int getAgeOfUser(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  var age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}

String getFileNameFromFirebaseStorageLink(String url) {
  RegExp regex = RegExp(r'[^/]+(?=\?)');
  return regex.stringMatch(Uri.decodeFull(url)) ?? url;
}

List<String>? createList(
  String list1,
  List<String> list2,
) {
  // combine two list and return one if empty return null
  List<String> result = [];
  if (list1.isNotEmpty) {
    result.add(list1);
  }
  if (list2.isNotEmpty) {
    result.addAll(list2);
  }
  return result.isNotEmpty ? result : null;
}

List<String> returnJobType(
  String jobSalary,
  List<String> jobType,
) {
  List<String> Info = [];
  Info.add(jobSalary);
  Info.addAll(jobType);
  return Info;
}

String imageToString(String url) {
  return url.toString();
}

List<PostRecord> searchPosts(
  String searchingText,
  List<PostRecord> posts,
) {
  List<PostRecord> filteredPosts = [];
  for (PostRecord item in posts) {
    String name = '${item.postText}'.toLowerCase();
    if (name.contains(searchingText.toLowerCase())) {
      filteredPosts.add(item);
    }
  }
  return filteredPosts;
}

List<JobRecord> searchJob(
  String searchingText,
  List<JobRecord> jobs,
) {
  List<JobRecord> filteredjobs = [];
  for (JobRecord item in jobs) {
    String name = '${item.jobTittle} ${item.jobDescription}.'.toLowerCase();
    if (name.contains(searchingText.toLowerCase())) {
      filteredjobs.add(item);
    }
  }
  return filteredjobs;
}

List<UsersRecord> searchUser(
  String searchingText,
  List<UsersRecord> users,
) {
  List<UsersRecord> filteredUsers = [];
  for (UsersRecord item in users) {
    String name = '${item.displayName}'.toLowerCase();
    if (name.contains(searchingText.toLowerCase())) {
      filteredUsers.add(item);
    }
  }
  return filteredUsers;
}

String returnTextFromJson(
  dynamic json,
  String value,
) {
  // Access values from JSON

  return json['$value'].toString();
}

dynamic jsonAsString(
  String name,
  String code,
  String flag,
  String dialCode,
) {
// return '{"name": "$name", "flag": "🇦$flag", "code": "$code", "dial_code": "$dialCode"}';
// {"name": "Afghanistan", "flag": "🇦🇫", "code": "AF", "dial_code": "+93"},
//  return '{\"name\":\"$name\",\"flag\":\"$flag\",\"code\":\"$code\",\"dial_code\":\"$dialCode\"}';
  return {
    "name": "$name",
    "flag": "$flag",
    "code": "$code",
    "dial_code": "$dialCode"
  };
}

List<ArticlesRecord> searchArticles(
  String searchingText,
  List<ArticlesRecord> articles,
) {
  List<ArticlesRecord> filteredArticles = [];
  for (ArticlesRecord item in articles) {
    String name = '${item.articleTitle}'.toLowerCase();
    if (name.contains(searchingText.toLowerCase())) {
      filteredArticles.add(item);
    }
  }
  return filteredArticles;
}

bool validatorEmail(String email) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  if (email.isNotEmpty && emailValid) {
    return true;
  }
  return false;
}

bool containsProfanity(String input) {
  List<String> profaneWords = [
    "abbo",
    "abo",
    "abortion",
    "abuse",
    "addict",
    "addicts",
    "adult",
    "africa",
    "african",
    "alla",
    "allah",
    "alligatorbait",
    "amateur",
    "american",
    "anal",
    "analannie",
    "angie",
    "angry",
    "anus",
    "arab",
    "arabs",
    "areola",
    "argie",
    "aroused",
    "arse",
    "arsehole",
    "asian",
    "ass",
    "assassin",
    "assassinate",
    "assassination",
    "assault",
    "athletesfoot",
    "attack",
    "australian",
    "babe",
    "babies",
    "backdoor",
    "backdoorman",
    "backseat",
    "balls",
    "banging",
    "baptist",
    "barelylegal",
    "barf",
    "barface",
    "barfface",
    "bast",
    "bastard",
    "bazongas",
    "bazooms",
    "beaner",
    "beast",
    "beastality",
    "beastial",
    "beastiality",
    "beaver",
    "bestial",
    "bestiality",
    "bi",
    "biatch",
    "bible",
    "bicurious",
    "bigass",
    "bigbastard",
    "bigbutt",
    "bigger",
    "bisexual",
    "bi-sexual",
    "bitch",
    "bitchy",
    "biteme",
    "black",
    "blackman",
    "blackout",
    "blacks",
    "blind",
    "blow",
    "boang",
    "bogan",
    "bohunk",
    "bollick",
    "bollock",
    "bomb",
    "bombers",
    "bombing",
    "bombs",
    "bomd",
    "bondage",
    "boner",
    "bong",
    "boob",
    "boom",
    "boong",
    "boonga",
    "boonie",
    "booty",
    "bountybar",
    "bra",
    "brea5t",
    "breast",
    "breastjob",
    "breastlover",
    "breastman",
    "brothel",
    "bugger",
    "buggered",
    "buggery",
    "bullcrap",
    "bulldike",
    "bulldyke",
    "bullshit",
    "buried",
    "burn",
    "butt",
    "byatch",
    "cacker",
    "cameljockey",
    "cameltoe",
    "canadian",
    "cancer",
    "carpetmuncher",
    "carruth",
    "catholic",
    "catholics",
    "cemetery",
    "chav",
    "cherrypopper",
    "chickslick",
    "chin",
    "chinese",
    "chink",
    "chinky",
    "choad",
    "chode",
    "christ",
    "christian",
    "church",
    "cigarette",
    "cigs",
    "clamdigger",
    "clamdiver",
    "clit",
    "clitoris",
    "clogwog",
    "cocaine",
    "cock",
    "cocktail",
    "cocky",
    "cohee",
    "coitus",
    "color",
    "colored",
    "coloured",
    "commie",
    "communist",
    "condom",
    "conservative",
    "conspiracy",
    "coolie",
    "cooly",
    "coon",
    "coondog",
    "copulate",
    "cornhole",
    "corruption",
    "cra5h",
    "crabs",
    "crack",
    "crap",
    "crappy",
    "crash",
    "creamy",
    "crime",
    "crimes",
    "criminal",
    "criminals",
    "crotch",
    "cum",
    "cybersex",
    "cyberslimer",
    "dago",
    "dahmer",
    "dammit",
    "damn",
    "damnation",
    "damnit",
    "dead",
    "death",
    "deepthroat",
    "defecate",
    "dego",
    "demon",
    "deposit",
    "desire",
    "destroy",
    "deth",
    "devil",
    "devilworshipper",
    "dick",
    "diddle",
    "die",
    "died",
    "dies",
    "dike",
    "dildo",
    "dingleberry",
    "dink",
    "dipstick",
    "dirty",
    "disease",
    "diseases",
    "disturbed",
    "dive",
    "dong",
    "doodoo",
    "doo-doo",
    "doom",
    "dope",
    "dragqueen",
    "dragqween",
    "dripdick",
    "drug",
    "drunk",
    "drunken",
    "dumb",
    "dyefly",
    "dyke",
    "easyslut",
    "eatballs",
    "ecstacy",
    "ejaculate",
    "ejaculation",
    "enema",
    "enemy",
    "erect",
    "erection",
    "ero",
    "escort",
    "ethiopian",
    "ethnic",
    "european",
    "evl",
    "excrement",
    "execute",
    "executed",
    "execution",
    "executioner",
    "explosion",
    "faeces",
    "failed",
    "failure",
    "fairies",
    "fairy",
    "faith",
    "fart",
    "farted",
    "farting",
    "fat",
    "fatah",
    "fear",
    "feces",
    "felatio",
    "felch",
    "felcher",
    "felching",
    "fellatio",
    "feltch",
    "feltcher",
    "feltching",
    "fetish",
    "fight",
    "filipina",
    "filipino",
    "fingerfood",
    "fire",
    "firing",
    "fister",
    "fisting",
    "flange",
    "flasher",
    "flatulence",
    "floo",
    "flydie",
    "flydye",
    "fok",
    "fondle",
    "footaction",
    "footfuck",
    "footfucker",
    "footlicker",
    "footstar",
    "fore",
    "foreskin",
    "forni",
    "fornicate",
    "foursome",
    "fourtwenty",
    "fraud",
    "fubar",
    "fudgepacker",
    "fugly",
    "fuk",
    "fuks",
    "funeral",
    "fungus",
    "gangbang",
    "gangbanged",
    "gangbanger",
    "gangsta",
    "gatorbait",
    "gay",
    "geez",
    "geezer",
    "geni",
    "genital",
    "german",
    "getiton",
    "gin",
    "ginzo",
    "gipp",
    "girls",
    "glazeddonut",
    "gob",
    "god",
    "gonorrehea",
    "gonzagas",
    "gook",
    "gotohell",
    "goy",
    "goyim",
    "greaseball",
    "gringo",
    "groe",
    "gross",
    "grostulation",
    "gubba",
    "gummer",
    "gun",
    "gyp",
    "gypo",
    "gypp",
    "gyppie",
    "gyppo",
    "gyppy",
    "hamas",
    "hapa",
    "harder",
    "harem",
    "headlights",
    "hebe",
    "heeb",
    "hell",
    "henhouse",
    "heroin",
    "herpes",
    "heterosexual",
    "hijack",
    "hijacker",
    "hijacking",
    "hillbillies",
    "hindoo",
    "hiscock",
    "hitler",
    "hitlerism",
    "hitlerist",
    "hiv",
    "ho",
    "hobo",
    "hodgie",
    "hoes",
    "hole",
    "holestuffer",
    "homicide",
    "homo",
    "homosexual",
    "honger",
    "honk",
    "honkers",
    "honkey",
    "honky",
    "hook",
    "hork",
    "horn",
    "horney",
    "horniest",
    "horny",
    "horseshit",
    "hosejob",
    "hoser",
    "hostage",
    "hotdamn",
    "hottotrot",
    "hummer",
    "husky",
    "hussy",
    "hustler",
    "hymen",
    "hymie",
    "idiot",
    "ikey",
    "illegal",
    "incest",
    "insest",
    "intercourse",
    "interracial",
    "israel",
    "israeli",
    "italiano",
    "itch",
    "jackass",
    "jacktheripper",
    "jade",
    "jap",
    "japanese",
    "jebus",
    "jeez",
    "jesus",
    "jesuschrist",
    "jew",
    "jewish",
    "jiga",
    "jigaboo",
    "jigg",
    "jigga",
    "jiggabo",
    "jigger",
    "jiggy",
    "jihad",
    "jijjiboo",
    "jimfish",
    "jism",
    "jiz",
    "jizim",
    "jizjuice",
    "jizm",
    "jizz",
    "jizzim",
    "jizzum",
    "joint",
    "jugs",
    "junglebunny",
    "kaffer",
    "kaffir",
    "kaffre",
    "kafir",
    "kanake",
    "kid",
    "kigger",
    "kike",
    "kill",
    "killed",
    "killer",
    "killing",
    "kills",
    "kink",
    "kinky",
    "knife",
    "knockers",
    "kock",
    "koon",
    "kotex",
    "kraut",
    "kumquat",
    "ky",
    "kyke",
    "lactate",
    "laid",
    "lapdance",
    "latin",
    "lesbain",
    "lesbayn",
    "lesbian",
    "lesbin",
    "lez",
    "lezz",
    "lezzo",
    "liberal",
    "libido",
    "licker",
    "lies",
    "limey",
    "limy",
    "lingerie",
    "liquor",
    "loadedgun",
    "lolita",
    "looser",
    "loser",
    "lotion",
    "lovebone",
    "lovejuice",
    "lovemuscle",
    "loverocket",
    "lowlife",
    "lsd",
    "lucifer",
    "luckycammeltoe",
    "lugan",
    "lynch",
    "macaca",
    "mad",
    "mafia",
    "magicwand",
    "mams",
    "manhater",
    "manpaste",
    "marijuana",
    "masterblaster",
    "masturbate",
    "meth",
    "mexican",
    "mgger",
    "mggor",
    "mickeyfinn",
    "mideast",
    "milf",
    "minority",
    "mockey",
    "mockie",
    "mocky",
    "mofo",
    "moky",
    "moles",
    "molest",
    "molestation",
    "molester",
    "molestor",
    "moneyshot",
    "mooncricket",
    "mormon",
    "moron",
    "moslem",
    "mosshead",
    "muff",
    "muffdive",
    "muffdiver",
    "muffindiver",
    "mufflikcer",
    "mulatto",
    "muncher",
    "munt",
    "murder",
    "murderer",
    "muslim",
    "naked",
    "narcotic",
    "nasty",
    "nazi",
    "necro",
    "negro",
    "negroes",
    "nig",
    "niger",
    "nigerian",
    "nigerians",
    "nip",
    "nipple",
    "nipplering",
    "nook",
    "noonan",
    "nooner",
    "nude",
    "nudger",
    "nuke",
    "nymph",
    "ontherag",
    "oral",
    "orga",
    "orgasim",
    "orgasm",
    "osama",
    "paki",
    "palesimian",
    "palestinian",
    "pansies",
    "pansy",
    "panti",
    "panties",
    "payo",
    "pearlnecklace",
    "peck",
    "pecker",
    "pee",
    "pee-pee",
    "peepshow",
    "peepshpw",
    "pendy",
    "penile",
    "penis",
    "penises",
    "penthouse",
    "period",
    "pi55",
    "picaninny",
    "piccaninny",
    "pickaninny",
    "piker",
    "pikey",
    "piky",
    "pimp",
    "piss",
    "pissed",
    "pisser",
    "pisses",
    "pisshead",
    "pissin",
    "pissing",
    "pissoff",
    "pistol",
    "pixie",
    "pixy",
    "playboy",
    "playgirl",
    "pocha",
    "pocho",
    "pocketpool",
    "pohm",
    "polack",
    "pom",
    "pommie",
    "pommy",
    "poo",
    "poon",
    "poontang",
    "poop",
    "pooper",
    "pooperscooper",
    "pooping",
    "popimp",
    "porn",
    "pornflick",
    "pornking",
    "porno",
    "pornography",
    "pot",
    "poverty",
    "premature",
    "pric",
    "prick",
    "prickhead",
    "primetime",
    "propaganda",
    "pros",
    "prostitute",
    "protestant",
    "pu55i",
    "pu55y",
    "pube",
    "pubic",
    "pubiclice",
    "pud",
    "pudboy",
    "pudd",
    "puddboy",
    "puke",
    "puntang",
    "purinapricness",
    "puss",
    "pussycat",
    "pusy",
    "quashie",
    "queer",
    "quickie",
    "quim",
    "ra8s",
    "rabbi",
    "racial",
    "racist",
    "radical",
    "radicals",
    "randy",
    "rape",
    "raped",
    "raper",
    "rapist",
    "rearend",
    "rearentry",
    "rectum",
    "redlight",
    "redneck",
    "reefer",
    "reestie",
    "refugee",
    "reject",
    "remains",
    "republican",
    "rere",
    "ribbed",
    "rigger",
    "rimjob",
    "rimming",
    "roach",
    "robber",
    "roundeye",
    "rump",
    "russki",
    "russkie",
    "sadis",
    "sadom",
    "samckdaddy",
    "sandm",
    "satan",
    "scag",
    "scallywag",
    "scat",
    "schlong",
    "screw",
    "screwyou",
    "scrotum",
    "scum",
    "seppo",
    "servant",
    "sex",
    "sexual",
    "sexually",
    "sexy",
    "sexymoma",
    "sexy-slim",
    "shag",
    "shat",
    "shav",
    "sheeney",
    "shinola",
    "shoot",
    "shooting",
    "showtime",
    "sick",
    "skank",
    "skinflute",
    "skum",
    "skumbag",
    "slant",
    "slanteye",
    "slapper",
    "slaughter",
    "slav",
    "slave",
    "slavedriver",
    "sleezebag",
    "sleezeball",
    "slideitin",
    "slime",
    "slimeball",
    "slimebucket",
    "slopehead",
    "slopey",
    "slopy",
    "slut",
    "sluts",
    "slutt",
    "slutty",
    "slutwear",
    "smack",
    "smut",
    "snatch",
    "snatchpatch",
    "sniper",
    "snot",
    "snowback",
    "sob",
    "sodom",
    "sodomise",
    "sodomite",
    "sodomize",
    "sodomy",
    "sooty",
    "sos",
    "soviet",
    "spank",
    "sperm",
    "spermacide",
    "spit",
    "spitter",
    "splittail",
    "spooge",
    "spreadeagle",
    "spunk",
    "spunky",
    "squaw",
    "stagg",
    "stiffy",
    "strapon",
    "stringer",
    "stripclub",
    "stroke",
    "stroking",
    "stupid",
    "suck",
    "sucker",
    "suicide",
    "swallow",
    "swallower",
    "swalow",
    "swastika",
    "sweetness",
    "syphilis",
    "taboo",
    "taff",
    "tampon",
    "tang",
    "tantra",
    "tarbaby",
    "tard",
    "teat",
    "terror",
    "terrorist",
    "teste",
    "testicle",
    "testicles",
    "thicklips",
    "thirdeye",
    "thirdleg",
    "threesome",
    "threeway",
    "tinkle",
    "tit",
    "tnt",
    "toilet",
    "tongue",
    "tortur",
    "torture",
    "tosser",
    "towelhead",
    "transexual",
    "transsexual",
    "triplex",
    "trojan",
    "trots",
    "tuckahoe",
    "tunneloflove",
    "turd",
    "turnon",
    "twat",
    "twink",
    "twinkie",
    "uck",
    "uk",
    "unfuckable",
    "upskirt",
    "uptheass",
    "urinary",
    "urinate",
    "urine",
    "usama",
    "uterus",
    "vagina",
    "vaginal",
    "vatican",
    "vibr",
    "vibrater",
    "vibrator",
    "vietcong",
    "violence",
    "virgin",
    "vomit",
    "vulva",
    "wab",
    "wank",
    "wanker",
    "wanking",
    "waysted",
    "weapon",
    "welcher",
    "welfare",
    "wetb",
    "wetback",
    "wetspot",
    "whacker",
    "whash",
    "whiskey",
    "whit",
    "white",
    "whitey",
    "whiz",
    "whop",
    "wigger",
    "willie",
    "williewanker",
    "willy",
    "wn",
    "wog",
    "wop",
    "wtf",
    "wuss",
    "wuzzie",
    "xtc",
    "xxx",
    "yankee",
    "yellowman",
    "zigabo",
    "zipperhead",
    "children's",
    "women's",
    "negro's",
    "israel's"
  ];
  // for (var word in profaneWords) {
  //   if (input.toLowerCase().contains(word)) {
  //     return true;
  //   }
  // }
  // return false;

  List<String> words =
      input.toLowerCase().split(RegExp(r'\s+')); // Split input into words

  for (var word in words) {
    if (profaneWords.contains(word)) {
      return true;
    }
  }
  return false;
}

List<dynamic> newCustomFunction(
  List<String> images,
  List<String> videos,
) {
  int nums = 0;
  List<Map<String, String>> list = [];
  for (var i in images) {
    list.add({'url': i, 'type': 'photo'});
  }
  for (var i in videos) {
    list.add({'url': i, 'type': 'video'});
  }

  if (list.length <= 4) {
    nums = list.length;
  }
  if (list.length > 4) {
    nums = 4;
  }

  List<dynamic> mySet = [];

  for (var q = 0; q < nums; q++) {
    mySet.add(list[q]);
  }
  return mySet;
}

List<String> messageStringDate(List<MessageRecord> chatMessage) {
  Set<String> mySet = {};
  for (var i = 0; i < chatMessage.length; i++) {
    DateTime creation = DateTime(
      chatMessage[i].messageTime!.year,
      chatMessage[i].messageTime!.month,
      chatMessage[i].messageTime!.day,
    );

    DateFormat dateFormat = DateFormat("MMMMd");
    var string = dateFormat.format(creation);
    mySet.add(string);
  }
  List<String> newSet = List.from(mySet);

  return (newSet);
}

String? notificationFormatString() {
  DateTime time = DateTime.now();
  DateTime art = DateTime(time.year, time.month, time.day);
  DateFormat dateFormat = DateFormat("MMMMd");
  var string = dateFormat.format(art);

  return string;
}

String dateformatforSub(String value) {
  // formted jsondateformat to dateformat 'MMMM dd, yyyy'
  final jsonDate = '{"date": "2022-02-14T12:00:00.000Z"}';
  final parsedJson = jsonDecode(jsonDate);
  final date = DateTime.parse(parsedJson['date']);
  final formattedDate = DateFormat('MMMM dd, yyyy').format(date);
  return formattedDate;
}
