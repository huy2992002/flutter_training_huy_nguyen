# Nike Sneaker Store
 <img width="100%" alt="Design App Banner" src="https://github.com/huy2992002/flutter_training_huy_nguyen/assets/119470320/56a903cf-392b-45a5-8e6b-44d47e8e9267">

## 📝 OVERVIEW
- This is a document detailing the plan to build the Nike Sneaker Store app.
- The application is built with state management with BloC.
- Unit testing and coverage > 70%.
- You can see the design app: [here](https://www.figma.com/file/NeMkgnPe650F4yep27Xmwm/NikeSneakerStore?type=design&node-id=0%3A1&mode=design&t=CCrQNYUpdEDs4dUQ-1)
- You can see document Test Case: [here](https://docs.google.com/spreadsheets/d/1QVw7b-pdqrIVHnqYjT9XgA0WwJoXXqrHcFGR0PsZY_4/edit?usp=sharing)

## 👩🏻‍💻 TEAM SIZE
- 1 Developer.

## 🎮 TECHNIQUES
- Flutter.
- Dart.

## 🎯 TARGETS
- Get familiar with Flutter user interface, widgets and Flutter CLI.
- Get acquainted with Flutter concepts and gain a better understanding of the architecture overview.
- Have an understanding at a basic level of how a Flutter application works.
- Be able to debug (with simulator & physical device) & and develop with some available tools from recommendation.
- Apply BLoC from previous practice flutter basic.
- Understanding concepts, pros, and cons state managements.
- Integrate with APIs, custom exceptions, and more error handling when integrated with APIs.
- Apply unit testing for Widget test and BLoC testing, and make sure that we cover basic scenarios for all and handle edge cases. The key is to ensure that each unit of code behaves as expected in isolation.
- Understanding and applying the widget_book plugin for building UI documentation.

## 🔽 Download APK
- You can download and use the application via the following [link](https://drive.google.com/file/d/1Fr0QzR_ySmfKjWtS9GJhT1sCz4OfYSEH/view?usp=sharing).

## 💻 Requirements
Before you continue, ensure you meet the following requirements
- An operating system (Android).
- An IDE ([VSCode](https://code.visualstudio.com/), [Android Studio](https://developer.android.com/), [IntelliJ](https://www.jetbrains.com/idea/download/), etc ).
- [Flutter](https://flutter.dev/) SDK version: >=3.1.2 <4.0.0.
- [Dart](https://dart.dev/) SDK version: >=3.2.0-0 <4.0.0.

## 🛠️ Installation
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
5. Set up environment:
    ``` 
    Create .env file
        Set Up SUPABASE_API_KEY
               SUPABASE_BASE_URL
               API_URL
               UPLOAD_URL
    ```   
6. Command used in project:
   ```
    Gen Assets, L10n, WidgetBook, Evn:
        flutter pub run build_runner build --delete-conflicting-outputs 
   ```
7. Run project:
   ```
    cd nike_sneaker_store
    Run app: 
        flutter run ./lib/main.dart
    Run with device preview:   
        flutter run ./lib/device_preview/device_preview.dart
    Run widget book:    
        flutter run ./lib/widgetbook/widgetbook.dart 
    Run test:
        flutter test            
   ```
