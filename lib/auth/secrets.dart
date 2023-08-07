// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';

var myApiKey = Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCbsAKQ7oRBBRfXt6vRoAz1IJYawAcbXdM",
        authDomain: "mediweb-dceca.firebaseapp.com",
        projectId: "mediweb-dceca",
        storageBucket: "mediweb-dceca.appspot.com",
        messagingSenderId: "8300651559",
        appId: "1:8300651559:web:3b5b2262ee7ef4c76fda02",
        measurementId: "G-5PPT1WGNVN"));

//firebase.initializeApp(firebaseConfig); *unless needed