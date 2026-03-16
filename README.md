# mct_prayer_book

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# How to generate aab file for plat store

### 1. First search release android flutter

The url is : https://docs.flutter.dev/deployment/android
Scroll down and come to *Create an upload keystore*

### Run the command for Mack

#### *keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000
-alias upload*

It will ask to set up password along with keys so do not forget the password

### Run the command for windows

#### *keytool -genkey -v -keystore $env:USERPROFILE\upload-keystore.jks -storetype JKS -keyalg RSA
-keysize 2048 -validity 10000 -alias upload*

After this process, we will be get generated upload_keystore.jks file which need to be pasted inside
*android folder*

Now Scroll down in browser and search *Reference the keystore from the app*

### Create a folder name with key.properties and paste the below code

storePassword=<password-from-previous-step> *Replace the password which you had generated*
keyPassword=<password-from-previous-step> *Replace the password which you had generated*
keyAlias=upload
storeFile=<keystore-file-location> *replace the file name with ../upload/keystore.jks*

### Now need to do Configure signing in Gradle (Scroll down)

1. Go to [project]/android/app/build.gradle.kts
2. Copy the code
   *import java.util.Properties
   import java.io.FileInputStream* [paste it top of the project]

*val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}* [Paste it above android]

### 2. Now come to  signing configuration before the buildTypes property block inside the android property block.

1. Inside the folder *[project]/android/app/build.gradle.kts*
2. copy the code and paste it in the above folder but ensure that you comment the existing
   *BuildTypes*

*signingConfigs {
create("release") {
keyAlias = keystoreProperties["keyAlias"] as String
keyPassword = keystoreProperties["keyPassword"] as String
storeFile = keystoreProperties["storeFile"]?.let { file(it) }
storePassword = keystoreProperties["storePassword"] as String
}
}
buildTypes {
release {
// TODO: Add your own signing config for the release build.
// Signing with the debug keys for now,
// so `flutter run --release` works.
signingConfig = signingConfigs.getByName("debug")
signingConfig = signingConfigs.getByName("release")
}
}*

### All the steps has been done, now just these commands

1. Flutter clean
2. Flutter pub get
3. Flutter build appbundle.

# Ending the process of generating aab file

### First prepare the following details:

1. .AAB File
2. App Icon 512*512 Pixel
3. Banner 1024*500 Pixel
4. Screenshots 9:16 ratio
5. Short description (80 characters)
6. Long description (4000 characters)
7. Privacy Policy
8. Demo login details
9. Play Console Account

### Create a new app in play store account




 