# Flutter Auth Form Demo

This is a simple Flutter project demonstrating an authentication form with email and password validation. The form includes fields for email and password, with custom validation and visibility toggling for the password field.

## Features

- Email and password input fields.
- Custom validation for email and password.
- Password visibility toggle.
- Display validation messages below the input fields.
- Success dialog on form submission if validation passes.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (latest stable version)
- A code editor (e.g., [Visual Studio Code](https://code.visualstudio.com/))

### Installation

Clone the repository

   ```sh
   git clone https://github.com/your-username/flutter-auth-form-demo.git
   cd flutter-auth-form-demo
```

Install dependencies:

```sh
flutter pub get
```

Run the app

```sh
flutter run -d chrome
```

## Usage

Open the app in your browser.
Fill in the email and password fields.
Click the "Sign Up" button.
If the validation passes, a success dialog will appear. If not, validation messages will be displayed below the input fields.

## Code Overview

main.dart
The entry point of the application. It sets up the MaterialApp and the home screen.

sign_up_page.dart
Contains the SignUpPage widget, which includes the form and its validation logic. This file handles the state management for the form and displays the success dialog upon successful form submission.

input_decoration.dart
Defines a reusable InputDecoration for the input fields. This base decoration is used for all input fields in the form.

password_input_decoration.dart
Extends the base InputDecoration to include a suffix icon for toggling password visibility.

## Custom Validation Logic

### Email Validation

Checks if the email is not empty and is in a valid email format.

### Password Validation

Checks if the password is between 8 and 64 characters long.
Checks if the password contains both lowercase and uppercase letters.
Checks if the password contains at least one digit.

## License

This project is licensed under the MIT License.
