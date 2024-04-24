# csc454 HW2
# Document containing Various Approaches to Storage Management with Pros and Cons:
For our Fridge Partner app, we have considered several approaches to storage management on the Android platform:
## 1. Shared Preferences:
Pros: Lightweight and easy to use for storing key-value pairs, suitable for storing small amounts of data like user settings.

Cons: Limited in capacity and not suitable for storing large amounts of data or complex data structures.
## 2. Internal Storage:
Pros: Provides private storage space within the app's sandbox, ensuring data security and privacy.

Cons: Limited in capacity and not accessible to other apps or users, restricting data sharing or backup options.
## 3. External Storage (SD card):
Pros: Offers larger storage capacity and flexibility for storing media files like images or videos.

Cons: Requires additional permissions and may not always be available or accessible, depending on device configuration.
## 4. SQLite Database:
Pros: Provides a structured and efficient way to store and retrieve structured data, suitable for complex data models.

Cons: Requires more setup and management overhead compared to other storage options, may be overkill for simple data storage needs.

# App Demonstrating Storage Management:
![80f00df907518f542c596d76596eed5](https://github.com/WendyRl/CSC545HW2/assets/80219810/fa63f841-c17d-4adc-9f2e-ee0acaf38df3)

This Flutter application demonstrates the ability to save and load an image from local storage, store and load  user settings using SharedPreferences.
## Dart File Breakdown:
### Main Function and MyApp Class
void main() { runApp(MyApp()); } is the entry point of the Flutter application. It runs the MyApp widget.

MyApp class sets up the basic configuration for the Flutter application, such as the title and theme. It also specifies StoragePage as the home page of the app.

### StoragePage StatefulWidget
StoragePage is a stateful widget, meaning it has mutable state that can change over the lifecycle of the widget.

_StoragePageState is where the state and the main functionality of StoragePage are managed.

### State Management and UI
The state class _StoragePageState contains variables to keep track of the loaded image (_image), user settings (_settingValue), and feedback messages (_feedbackMessage).

The _showFeedback method is used to update feedback messages on the UI dynamically.

### Image Handling Functions
#### _pickAndSaveImage:
This function uses ImagePicker to allow the user to select an image from their gallery.

If an image is picked, it saves the image to the app's document directory using path_provider.

The image path and success message are stored, and the UI is updated to show this feedback.

#### _loadImage:
It attempts to load the saved image from the app's document directory.

If the image file exists, it is displayed and a success message is shown; otherwise, an error message is shown.

### Settings Handling Functions
#### _saveSetting:
This function saves a specified key-value pair to SharedPreferences, which provides a persistent store for simple data.

It then displays a feedback message indicating the save operation was successful.

#### _loadSetting:
This function retrieves a value from SharedPreferences using a specified key.

It updates the UI to display the retrieved value and a success message if the operation was successful.

### User Interface
The Scaffold widget is used to create the basic visual structure of the app screen, including an AppBar and a SingleChildScrollView to allow for scrolling when content exceeds the screen size.

The UI consists of a series of buttons that trigger the save and load functions for both images and settings

It also displays the loaded image (if available), the feedback messages, and the loaded settings value.

## Key Flutter Concepts Used
StatefulWidget: Allows updating the UI dynamically based on internal state changes.

async/await: Handles asynchronous operations such as file I/O and data fetching.

SharedPreferences: Manages simple data persistently across app launches.

ImagePicker: Interacts with the system's gallery to pick media files.

path_provider: Finds the correct local path to store data


