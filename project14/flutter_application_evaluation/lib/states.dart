import 'package:flutter/foundation.dart';

class States {
  final String state;
  final String notes;
  final String covid19Site;
  final String covid19SiteSecondary;
  final String covid19SiteTertiary;
  final String covid19SiteQuaternary;
  final String covid19SiteQuinary;
  final String twitter;
  final String covid19SiteOld;
  final String covidTrackingProjectPreferredTotalTestUnits;
  final String covidTrackingProjectPreferredTotalTestField;
  final String totalTestResultsField;
  final String pui;
  final bool pum;
  final String name;
  final String fips;

 States({required this.state,
        required this.notes,
        required this.covid19Site,
        required this.covid19SiteSecondary,
        required this.covid19SiteTertiary,
        required this.covid19SiteQuaternary,
        required this.covid19SiteQuinary,
        required this.twitter,
        required this.covid19SiteOld,
        required this.covidTrackingProjectPreferredTotalTestUnits,
        required this.covidTrackingProjectPreferredTotalTestField,
        required this.totalTestResultsField,
        required this.pui,
        required this.pum,
        required this.name,
        required this.fips});

    factory States.fromJson(Map<String,dynamic> json){
      return States(state: json['states'] as String,
                     notes: json['notes'] as String,
                      covid19Site: json['covid19Site'] as String, 
                      covid19SiteSecondary: json['covid19SiteSecondary'] as String, 
                      covid19SiteTertiary: json['covid19SiteTertiary']as String, 
                      covid19SiteQuaternary: json['covid19SiteQuaternary']as String, 
                      covid19SiteQuinary: json['covid19SiteQuinary']as String, 
                      twitter: json['twitter']as String, 
                      covid19SiteOld: json['covid19SiteOld']as String, 
                      covidTrackingProjectPreferredTotalTestUnits: json['covidTrackingProjectPreferredTotalTestUnits']as String, 
                      covidTrackingProjectPreferredTotalTestField: json['covidTrackingProjectPreferredTotalTestField']as String, 
                      totalTestResultsField: json['totalTestResultsField']as String, 
                      pui: json['pui']as String, 
                      pum: json['pum']as bool, 
                      name: json['name']as String, 
                      fips: json['fips']as String);
    }
  
}
