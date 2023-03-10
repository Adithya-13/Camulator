<h1 align="center">
  Camulator
</h1>
<p align="center">
  Camulator App
</p>
<p align="center">
  <a href="https://flutter.dev/"><img alt="Platform" src="https://img.shields.io/badge/platform-Flutter-blue.svg"></a>
  <a href="https://dart.dev/"><img alt="Dart" src="https://img.shields.io/badge/dart-2.18.5-blue.svg"></a>
  <a href="https://github.com/Adithya-13/Camulator/"><img alt="Star" src="https://img.shields.io/github/stars/Adithya-13/Camulator"></a>
</p>

<p align="center">
  <img src="demo/cover-camulator.png"/>
</p>

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Demo](#demo)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Dependencies](#dependencies)
- [TODO's](#todos)

## Introduction

Camulator is a Calculator Application, but with camera!

this app is for those of you that have a difficulties when buy something on market, but your hands is full of stuffs, so instead of open your calculator, use this Camulator to calculate with camera, do not need a lot of hands and gestures, just point out on the price of the product, and voila!

In this project, i use Riverpod as my State Management. for details you can see [here](#tech-stack).

The challenges that i've experienced is:
1. Create a library by myself

i created Viewfinder Widget (not published in pub.dev yet) which i never create before.

## vids for widget

this widget is like photomath app, the purpose of this widget is to crop the image, but before the image takken.

the challenge is, i have to find the reference first, and then i code it, there's a lot of trial and error to build this widget.

2. Research and Technical Debt.

so, this part that use a lot of time and think!

when i buy some food for the monthly expensess, i go to the market, and think, if i have an app that can calculate with camera, it would be life savings!

then i go to home, and then research it, but unfortunately, in flutter, not much reference to build this app (with one source).

so, this is what i do, i search for OCR in Flutter, and then i search how to build Viewfinder widget, and then i have to think what should i do to calculate the number but with the list.

with research and deployment, finally this app has done to complete the MVP!

To see what features I made, you can see [here](#features)

3. Challenges for myself

i created the [Flutask App](https://github.com/Adithya-13/Flutask), there's a lot of stars and forks that i've got, but that 2 years project, i did not continued at all, because of i have a lot of things to do in real life (because i still 17 y.o haha, there's an examination in school, im sorry...).

so, this time, with the new project, i challenge myself to finish what i've started. and voila!!

I use google_ml_kit_text_recognition for my OCR in Flutter. To see what Dependencies I created, you can see [here](#dependencies).

## Installation

Clone or Download and Open it into Android Studio, VSCode, or Other IDE / Text Editor
```
https://github.com/Adithya-13/Camulator.git
```  

## Demo

|Dashboard|Detail Restaurant|Search Restaurant|Add Review|
|--|--|--|--|
|![](demo/dashboard.gif)|![](demo/detail.gif)|![](demo/search.gif)|![](demo/add-review.gif)|

|Favorite|Unfavorite|Search Favorite|
|--|--|--|
|![](demo/favorite.gif)|![](demo/unfavorite.gif)|![](demo/search-favorite.gif)|

## Features
- Calculate with Camera for all of operations (Addition, Subtraction, Multiplication, Division)
- Rollback/undo Calculation
- List of Number calculations
- Delete one of the numbers in history calculatons
- Reset Calculations
- Calculate from Gallery (soon)
- LTR or RTL feature (soon)

## Tech Stack
- [Riverpod Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)

## Dependencies
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [camera](https://pub.dev/packages/camera)
- [path_provider](https://pub.dev/packages/path_provider)
- [google_mlkit_text_recognition](https://pub.dev/packages/google_mlkit_text_recognition)
- [permission_handler](https://pub.dev/packages/permission_handler)
- [dotted_border](https://pub.dev/packages/dotted_border)
- [image](https://pub.dev/packages/image)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [image_picker](https://pub.dev/packages/image_picker)
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- [easy_localization](https://pub.dev/packages/easy_localization)
- [sliding_up_panel](https://pub.dev/packages/sliding_up_panel)
- [auto_size_text](https://pub.dev/packages/auto_size_text)
- [collection](https://pub.dev/packages/collection)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)



## TODOs
- [x] UI Slicing
- [x] Create ViewFinder Widget
- [x] add side of viewfinder widget
- [x] filter only digit in OCR
- [x] centerize the viewfinder
- [x] set max height and width for viewfinder
- [x] Detect Text
- [x] Calculate Detected Number
- [x] Change Operator
- [x] Rollback
- [x] Show History of Calculation
- [x] thousand format
- [x] Show Result at the top of screen
- [ ] LTR / RTL Feature
- [ ] android still bug
- [ ] handle use flash or not (android automatically still flash)
- [ ] add indicator when capture
