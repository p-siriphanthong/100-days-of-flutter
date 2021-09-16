# 100 Days Of Flutter

This is a challenge for 100 days to create a daily programming habit to develop my skill sets. More details about the challenge can be found here: [100daysofcode.com](https://www.100daysofcode.com).

This repository contains all the source code which I did while learning Flutter.

## Code Log

### [Brainstorming Board](./brainstorming_board)

Learn about the basics of Flutter

![](./demo/brainstorming_board.gif)

**Day 1**

- Create routes for list screen and form screen
- Add `floatingActionButton` in list screen for navigate to form screen
- Create `IdeaCard` widget

**Day 2**

- Create form UI
- Using `SafeArea` in form screen
- Create `TextField` widget for custom `TextFormField`

**Day 3**

- Create `json-server` for faking REST API
- Fetch ideas from `json-server` to show in list screen

**Day 4**

- Binding form screen to create new idea

**Day 5**

- Using `AutoSizeText` for dynamic font size in `IdeaCard`
- Create device utilities for check device type (mobile, tablet, desktop)
- Responsive list screen

**Day 6**

- Implementing dark/light mode themes
- Implementing pull-to-refresh
- Change application name and icon

**Day 7**

- Fix the Android emulator cannot access API
- Create splash screen using `flutter_native_splash` package
- Using `CupertinoButton` for iOS and `ElevatedButton` for Android

### [Todo List](./todo_list)

Learn about state management

![](./demo/todo_list.gif)

**Day 8**

- Create todo list UI

**Day 9**

- Manage state of todo list by setState
- Manage state of todo list by Provider

**Day 10**

- Manage state of todo list by GetX

**Day 11**

- Manage state of todo list by Bloc

**Day 12**

- Manage state of todo list by MobX

**Day 13**

- Manage state of todo list by Redux

### [FlutterFire Auth](./flutterfire_auth)

Firebase authentication on Flutter

![](./demo/flutterfire_auth.gif)

**Day 14**

- Create home, sign in, and sign up screens

**Day 15**

- Using `flutter_form_builder` package for manage and validate sign in and sign up forms

**Day 16**

- Initialize the FlutterFire in the iOS app (in progress)

**Day 17**

- Initialize the FlutterFire in the iOS app
- Initialize the FlutterFire in the Android app

**Day 18**

- Upgrade `firebase_core` version to 1.4.0
- Sign-up with email and password
- Sign-in with email and password

**Day 19**

- Handle sign-out
- Listen authentication state changes
- Create `AuthenticationGuard` and `UnauthenticationGuard`

**Day 20**

- Replace `Provider` with `GetX` (in progress)

**Day 21**

- Replace `Provider` with `GetX` (in progress)

**Day 22**

- Replace `Provider` with `GetX`

**Day 23**

- Create error handler
- Fix widget overflowed on sign-up and sign-in screens

**Day 24**

- Force a reload user on starting the app (support disable or delete the user via the Firebase console)
- Sign-in with Google in the iOS app

**Day 25**

- Sign-in with Google in the Android app
- Replace `flutter_signin_button` with `sign_button` package

**Day 26**

- Sign-in with Facebook

**Day 27**

- Sign-in with Twitter in the iOS app

**Day 28**

- Sign-in with Twitter in the Android app
- Read environment variables from `.env` file by using `flutter_config` package

**Day 29**

- Using environment variables from `.env` file in native files by using `flutter_config` package

**Day 30**

- Using `git-secret` to encrypt and decrypt `.env` file

**Day 31**

- Sign-in with Apple in the iOS app (in progress)

**Day 32**

- Try to build the app on physical iOS device
- Remove sign-in with Apple because the "Personal Team" account doesn't allow to use it

**Day 33**

- Create assets directory
- Remove `sign_button` package and use images from assets directory instead
- Sign-in with LINE (in progress)

**Day 34**

- Remove sign-in with LINE

### [Mastermind](./mastermind)

Color code breaking game

**Day 35**

- Feature ideation

**Day 36**

- Create routes for home screen and game screen
- Create main layout of game screen
- Using `Draggable` and `DragTarget` to drag and drop the code pegs

**Day 37**

- Manage state of game list by GetX
- Create `GuessRow` and `PegHole` widgets
- Handle drop event of `PegHole` widget

**Day 38**

- Focus on `PegHole` widget

**Day 39**

- Setup font family and icon font
- Update UI

**Day 40**

- Handle guess code and give feedback
