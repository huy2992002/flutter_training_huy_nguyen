# Nike Sneaker Store

## OVERVIEW
- This is a document detailing the plan to build the Nike Sneaker Store app
- You can see the design app: [here](https://www.figma.com/file/NeMkgnPe650F4yep27Xmwm/NikeSneakerStore?type=design&node-id=0%3A1&mode=design&t=CCrQNYUpdEDs4dUQ-1)

## TIMELINE
- ESTIMATE: Feb 06, 2024 - Feb 27, 2024 (10 days)

## TEAM SIZE
- 1 Developer

## TECHNIQUES
- Flutter
- Dart

## EDITOR
- Visual Studio Code

## TARGETS
- Get familiar with Flutter user interface, widgets and Flutter CLI.
- Get acquainted with Flutter concepts and gain a better understanding of the architecture overview.
- Have an understanding at a basic level of how a Flutter application works.
- Be able to debug (with simulator & physical device) & and develop with some available tools from recommendation.
- Be able to build a responsive layout and interactivity for one mobile application.
- Understanding and applying the widget_book plugin for building UI documentation.

## Deployment Plan
- [x] Epic 1: Analysis design, component
- [x] Epic 2: Setup environment
- [x] Epic 3: Create skeleton structure practice
- [x] Epic 4: Setup themes, l10n
- [x] Epic 5: Implement the UI
- [x] Epic 6: Test the application and prepare for the review

## Download APK
- install: [here](https://drive.google.com/file/d/1fWOglAxj7uNc7ERgd6WwUEC9b0_DDAfD/view?usp=sharing)

## Build With
- [Flutter](https://flutter.dev/) version 3.19.1
- [Dark](https://dart.dev/) version 3.3.0
-  [Visual Studio Code](https://code.visualstudio.com/)

## Prerequisites
Before you continue, ensure you meet the following requirements
- Flutter sdk version: >=3.1.2 <4.0.0
- Dark sdk version: >=3.2.0-0 <4.0.0

## Installation
1. Clone the repository:
​
    ```
    git clone https://github.com/huy2992002/flutter_training_huy_nguyen.git
    ```
2. Checkout branch:
​
    ```
    git checkout <feature/flutter-practice-one> 
    ```
3. Pull origin branch:
​
    ```
    git pull origin <feature/flutter-practice-one> 
    ```
4. Get dependency:
​
    ```
    flutter pub get
    ```    
4. Run project:
   ```
    Run app:
        cd nike_sneaker_store
        flutter run ./lib/main.dart
    Run with device preview
        cd nike_sneaker_store
        flutter run ./lib/device_preview/device_preview.dart
    Run widget book
        cd nike_sneaker_store
        flutter run ./lib/widgetbook/widgetbook.dart     
   ```
5. Command used in project:
   ```
    Gen assets, l10n, WidgetBook:
        flutter pub run build_runner build --delete-conflicting-outputs 
    ```
