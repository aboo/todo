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

## Manual

before running the app, enter the following command in terminal
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
