# ToDo Application Challenge

This challenge is to implement the best possible ToDo list application in the
shortest amount of time.

## Objectives

The objectives of this task is to present your skills in following areas:

- Understanding Flutter application flow
- Project structure
- Use of design patterns
- Use of TDD
- Application Architecture
- Clean coding
- Source control

## Requirements

Followings are the requirements of the project:

> [!NOTE] UI is not important and you can use vanilla material design.

- List of ToDo items
- Ability to scroll a long list of items
- Ability to Re-order the ToDo items
- Marking the item as Complete
- Deleting an item
- Ability to see the details of a ToDo item
- Ability to modify a ToDo item
- Create a new ToDo item with following fields
  - Title
  - Description
  - Tags
- The data persist on the device between sessions
- There should be a counter in the app bar always showing the current number of
  ToDo items pending
- Filtering bae on tag and status

## Delivering

The result should be delivered within the following criteria:

- The time difference between the first commit and the last commit should be
  more than 30 mins and less that 2 hours
- When the application is ready, create a pull request into the master branch
- Your branch should be compile-able
- Your branch should be runnable on iOS, Android and Web

## Bonus Points

You will receive bonus points if:

- The application works on Windows as well


- List of ToDo items ☑
- Ability to scroll a long list of items ☑
- Ability to Re-order the ToDo items ☑
- Marking the item as Complete ☑
- Deleting an item ☑
- Ability to see the details of a ToDo item ☑
- Ability to modify a ToDo item ☑
- Create a new ToDo item with following fields
  - Title ☑
  - Description ☑
  - Tags ✘
- The data persist on the device between sessions ☑
- There should be a counter in the app bar always showing the current number of ☑
  ToDo items pending ☑
- Filtering bae on tag and status️✘

##Attention
Two of the items from the above list weren't done. 
I was asked to do all the tasks on the list in 2 hours but honestly, 
I have done most of them in near 3 hours.
(Installation for devices)

##Run
get the packages: flutter pub get
 
Run flutter channel dev
Run flutter upgrade
If you've never run a desktop build before, 
you will need to enable it with a one-time command for your current platform:

flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop

If you re-start your IDE, you should also see a new launch option for your current desktop platform.

Run:
flutter run -d windows
flutter run -d macos
flutter run -d linux
flutter run -d android
flutter run -d ios
flutter run -d web
