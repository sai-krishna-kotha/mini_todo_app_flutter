# Mini Todo App (Flutter)

A simple Todo application built with Flutter as part of my Flutter learning journey.

## Features

* Add new tasks
* Edit existing tasks
* Delete tasks
* Mark tasks as completed
* Cancel task editing
* Empty state message when no tasks are available
* Basic input validation (prevents empty tasks)

## Screenshots
 *Empty state* <br>
 *Add task* <br>
 *Edit task* <br>

<div style="display: flex; gap: 10px;">
  <img src="./assets/screenshots/empty_state.png" alt="Empty State" width="32%">
  <img src="./assets/screenshots/add_task.png" alt="Add Task" width="32%">
  <img src="./assets/screenshots/edit_task.png" alt="Edit Task" width="32%">
</div>

---
### Version 1.0

Implemented:

* Create Todo
* Read Todos
* Update Todo
* Delete Todo
* Toggle Completion Status
* Edit Mode
* Empty State UI
* Reusable TodoItem Widget

## Concepts Learned

### Flutter Fundamentals

* StatelessWidget
* StatefulWidget
* Widget Tree
* Widget Composition
* setState()

### User Input

* TextField
* TextEditingController

### Lists & UI Rendering

* ListView.builder
* ListTile
* Conditional Rendering

### State Management

* State ownership
* Parent-child communication
* Callback functions
* VoidCallback

### Dart Concepts

* Classes and Objects
* Constructors
* Required parameters
* Lists
* Null Safety (`?`)
* Closures
* Function references

### Project Structure

* Model extraction (`Todo`)
* Widget extraction (`TodoItem`)
* Separation of concerns
<br>
---
### Version 2.0

Implemented:

* Create Todo
* Read Todos
* Update Todo
* Delete Todo
* Toggle Completion Status
* Edit Mode
* Cancel Editing
* Empty State UI
* Reusable TodoItem Widget
* Custom Todo Model
* Local Data Persistence using SharedPreferences
* JSON Serialization & Deserialization

---

### Storage

* SharedPreferences
* JSON Encoding
* JSON Decoding
* Local Persistence

---

## Version 3.0

Implemented:

- Task Details Screen
- Navigation with Navigator.push()
- Returning with Navigator.pop()
- Route-based Data Passing
- Multi-Screen App Architecture
- Navigation Callbacks for State Updates

### Navigation

- Navigator
- Navigator.push()
- Navigator.pop()
- MaterialPageRoute
- Route Stack
- Passing Data Between Screens

## Screenshots
  *main screen* <br>
  *detail task screen* <br>

<div style="display: flex; gap: 10px;">
  <img src="./assets/screenshots/main_screen.png" alt="Main Screen" width="32%">
  <img src="./assets/screenshots/detail_screen.png" alt="Detail Screen" width="32%">
</div>

## Future Improvements

- [x] Local Persistence (Shared Preferences)
- [x] Multiple Screens
- [x] Navigation Callbacks
- [ ] Task Filtering
- [ ] Search Tasks
- [ ] Dark Mode
- [ ] Improved UI/UX

---

## Getting Started

```bash
git clone <repository-url>
cd mini_todo_app
flutter pub get
flutter run
```

---

## Learning Goal

This project was built to practice Flutter fundamentals, state management with `setState()`, widget composition, callbacks, and application architecture before moving to more advanced topics such as persistence, navigation, and state management solutions like Provider or Riverpod.

