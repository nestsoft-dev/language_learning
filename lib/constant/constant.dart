import 'package:flutter/material.dart';

const orange = Colors.orange;
const onBoardingBg = Color(0xFFF080E1E);
const onBoardingButton = Color(0xfff5b7bfe);
const appBarColor = Color(0xfff410FA3);
const textInputColor = Color(0xfff1B2336);
const textInputColorShade = Color.fromARGB(255, 31, 41, 63);
const timerColor = Color.fromARGB(255, 0, 181, 79);

List<Map<String, String>> onBoardingList = [
  {
    'title': 'Confidence in your words',
    'description':
        'With conversation-based learning, you\'ll be talking from lesson one',
    'image': 'assets/onboarding_one.png',
  },
  {
    'title': 'Take your time to learn',
    'description':
        'Develop a habit of learning and make it a part of your daily routine',
    'image': 'assets/onboarding_two.png',
  },
  {
    'title': 'The lessons you need to learn',
    'description': 'Using a variety of learning styles to learn and retain',
    'image': 'assets/onboarding_three.png',
  },
];

List<Map<String, String>> intro_one_language = [
  {'flag': 'assets/england.png', 'lang': 'English', 'lan_code': 'en'},
  {'flag': 'assets/france.png', 'lang': 'French', 'lan_code': 'fr'},
  {'flag': 'assets/german.png', 'lang': 'German', 'lan_code': 'gr'},
  {'flag': 'assets/hindi.png', 'lang': 'Hindi', 'lan_code': 'hi'},
  {'flag': 'assets/south-korea.png', 'lang': 'Korean', 'lan_code': 'kr'},
  {'flag': 'assets/bengali.png', 'lang': 'Bengali', 'lan_code': 'bl'},
  {'flag': 'assets/italy.png', 'lang': 'Italian', 'lan_code': 'it'},
];

List<String> headText = [
  'What is Language do you want to Learn?',
  'What is the main Reason for learning ',
  'How much do you know about ',
  'How old are you?',
  'How much time do you have to learn ',
  'How did you hear about LingoLearn?',
];

List<Map<String, String>> intro_two_reason = [
  {
    'flag': 'assets/travel.png',
    'lang': 'Travel',
  },
  {
    'flag': 'assets/school.png',
    'lang': 'School',
  },
  {
    'flag': 'assets/working.png',
    'lang': 'Work',
  },
  {
    'flag': 'assets/family.png',
    'lang': 'Family/Friends',
  },
  {
    'flag': 'assets/skill_improve.png',
    'lang': 'Skill Improvements',
  },
  {
    'flag': 'assets/others.png',
    'lang': 'Others',
  },
];

List<Map<String, String>> intro_three_knowledge = [
  {
    'flag': 'assets/level.png',
    'lang': 'Not Much',
  },
  {
    'flag': 'assets/level.png',
    'lang': 'Medium',
  },
  {
    'flag': 'assets/level.png',
    'lang': 'Expert',
  },
];

List<Map<String, String>> intro_four_age = [
  {
    'flag': 'assets/age.png',
    'lang': 'Under 18',
  },
  {
    'flag': 'assets/age.png',
    'lang': '18-24',
  },
  {
    'flag': 'assets/age.png',
    'lang': '25-34',
  },
  {
    'flag': 'assets/age.png',
    'lang': '35-44',
  },
  {
    'flag': 'assets/age.png',
    'lang': '45-54',
  },
  {
    'flag': 'assets/age.png',
    'lang': '55-64',
  },
  {
    'flag': 'assets/age.png',
    'lang': '65 or older',
  },
];

List<Map<String, String>> intro_five_time = [
  {
    'flag': 'assets/clock.png',
    'lang': '5min/Day',
  },
  {
    'flag': 'assets/clock.png',
    'lang': '15min/Day',
  },
  {
    'flag': 'assets/clock.png',
    'lang': '30min/Day',
  },
  {
    'flag': 'assets/clock.png',
    'lang': '60min/Day',
  },
];

List<Map<String, String>> intro_six_hearabtus = [
  {
    'flag': 'assets/family.png',
    'lang': 'Friends/Family',
  },
  {
    'flag': 'assets/playstore.png',
    'lang': 'Play store',
  },
  {
    'flag': 'assets/youtube.png',
    'lang': 'Youtube',
  },
  {
    'flag': 'assets/tv.png',
    'lang': 'Tv',
  },
  {
    'flag': 'assets/podcast.png',
    'lang': 'Podcast',
  },
  {
    'flag': 'assets/website.png',
    'lang': 'Website Ads',
  },
];

List<Map<String, String>> goalCardOne = [
  {
    'title': 'Basic',
    'message':
        'Use familiar everyday expressions, such as\nintroductions, details about yourself and your\nfamily.'
  },
  {
    'title': 'Independent',
    'message':
        'Understand the main points when\ncommunicating in everyday situatios and can\nshare your options.'
  },
  {
    'title': 'Proficient',
    'message':
        'Communicate effectively and flexible in most\nsocial, academic and professional contexts and\nunderstand indirect meaning.'
  },
];

List<String> goalCardTwo = [
  '1-3 Months',
  '3-6 Months',
  '6-12 Months',
  'More than 12 Months',
];

List<Map<String, String>> featureList = [
  {'title': 'Grammar\nQuiz', 'description': 'Master desired\nlanguage','image':'assets/onboarding_two.png'},
  {'title': 'Essay\nQuiz', 'description': 'Master desired by\nwriting eassay'
  
  ,
  'image':'assets/grammar_writing.png'},
  {'title': 'Writing\nQuiz', 'description': 'Master desired\nlanguage writing',
  'image':'assets/writing.png'
  },
  {
    'title': 'Guessing\nQuiz',
    'description': 'Master desired\nlanguage model items'
    ,
  'image':'assets/teacher.png'
  },
];
