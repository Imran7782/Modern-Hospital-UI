## Hospital Management App
This Flutter app is a part of a hospital management system that allows users to log in using Firebase Authentication. The app features a stylish login screen with a background image and supports both email/password and Google login methods.

## Features
Firebase Authentication: Sign in using email and password.
Stylish UI: Custom-designed login screen with background images and animations.
Responsive Layout: The app is optimized for various screen sizes.
Navigation: Redirect users to different screens based on login status (HomePage for logged-in users, Signup for new users).
Google Login: Future feature to allow users to sign in with Google.
## Prerequisites
Flutter SDK
Firebase account and Firebase project set up
Android or iOS device/emulator for testing
Setup
Clone the repository:

bash
Copy
Edit
git clone https://github.com/imran7782/your-repository.git
Navigate to the project directory:

bash
Copy
Edit
cd your-repository
Install dependencies:

bash
Copy
Edit
flutter pub get
Set up Firebase for your project:

Go to the Firebase Console.
Create a new Firebase project or use an existing one.
Enable Firebase Authentication in the Firebase Console.
Add your Android or iOS app to the Firebase project and follow the instructions to download the google-services.json or GoogleService-Info.plist file, and add it to the project.
Initialize Firebase:

Ensure that Firebase is properly initialized in your project by using the Firebase.initializeApp() function.
Run the app:

bash
Copy
Edit
flutter run
Firebase Configuration
Firebase Authentication
Enable Email/Password authentication and Google authentication in the Firebase console.
Firebase Initialization
Add Firebase initialization code in main.dart:

dart
Copy
Edit
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Hospital());
}
File Structure
bash
Copy
Edit
lib/
├── hompage.dart           # The home page for authenticated users
├── login.dart             # The login screen
├── signup.dart            # The signup screen (future feature)
└── main.dart              # Main entry point, initializes Firebase
assets/
├── images/
│   ├── circle.png        # Background image
│   ├── Group 1.png       # Logo image
│   ├── circlePink.png    # Another background element
│   ├── Rectangle 1.png   # Additional image for the UI
│   └── google.png        # Google login button image
Screenshots
Login Screen

Future Features
Google Login: Allow users to log in with their Google account.
Signup Screen: Add a signup feature for new users.
Troubleshooting
Make sure you have added the correct google-services.json (Android) or GoogleService-Info.plist (iOS) to your project.
Ensure Firebase Authentication is enabled for both Email/Password and Google authentication methods in the Firebase Console.


