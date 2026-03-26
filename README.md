## Bookia Appstore
Elevating the Digital Reading Experience.

Bookia is a high-performance, cross-platform application designed to streamline the way users discover, organize, and consume literature.  Bookia provides a frictionless gateway to a world of knowledge.

## 🚀 Key Features:
- (1) Created a Splash Screen with a Future.delayed of 3 seconds.
- (2) Created a Home Screen that contains two buttons: one for the Login Screen and the other for the Register Screen.
- (3) The Login Screen contains two TextFormFields with validation, and two options to log in using Google and Apple.
- (4) Created a Register Screen to allow users to create a new account.
- (5) Created a Forgot Password Screen that contains one TextFormField to enter the email address and send the verification code to the email.
- (6) Created an OTP Verification Screen where the user can enter the verification code.
- (7) Implemented state management and validation on the Login Screen.
- (8) Implemented validation on the Register Screen and added a loading state for the whole page.
- (9) To implement the loading state, I used BlocConsumer to show the loading indicator on the entire page instead of only on the button.
- (10) call the APIS parallel for homescreen parts (slider & bestseller part )
- (11) implemented GoRoutes navigation and changed all routes from push to Routes
- (12) made the wishlist and made cubit for wishlist and you can remove any book from the wishlist 


## 🏗️ Technical Architecture:
"The project follows a Feature-First folder structure, promoting a clean separation of concerns.
By isolating the data, domain, and presentation layers within each feature, the codebase remains decoupled, testable, and easy to navigate as the application scales."

## 🛠️ Tech Stack:
Framework: Flutter (Latest Stable)
Language: Dart
Architecture: Feature-First / Clean Architecture

## 🖼️ Screenshots:

<img width="250" height="750" alt="Splash Screen" src="https://github.com/user-attachments/assets/b352eb79-8c6e-4114-9805-8bc22c32e7dc" />
<img width="250" height="750" alt="Welcome Screen" src="https://github.com/user-attachments/assets/4b9ddcd5-1bba-4273-a12e-8fd49525d5c8" />
<img width="250" height="750" alt="Login Screen" src="https://github.com/user-attachments/assets/6bb1db4d-43ca-408a-91a5-c4a1e8b402ce" />
<img width="250" height="750" alt="Register Screen" src="https://github.com/user-attachments/assets/7ad09581-3bd3-4cd3-ba3d-45f4c0ccabda" />
<img width="250" height="750" alt="forget password screen" src="https://github.com/user-attachments/assets/ee1730df-b645-478a-9175-d69a520d496d" />
<img width="250" height="750" alt="Otp Verfication" src="https://github.com/user-attachments/assets/fc14194f-81c5-4358-900d-c10facb74088" />
<img width="250" height="750" alt="New Password" src="https://github.com/user-attachments/assets/91e97f1f-7109-48f4-9a93-bf5dfe0fb41e" />
<img width="250" height="750" alt="Password Changed" src="https://github.com/user-attachments/assets/a1967a17-6b43-42da-b01b-b9ee86441027" />
<img width="250" height="750" alt="Screenshot 2026-03-07 152658" src="https://github.com/user-attachments/assets/adf8a1dc-4350-427d-b5af-22615a78ea48" />
<img width="250" height="750" alt="Screenshot 2026-03-07 152802" src="https://github.com/user-attachments/assets/1de94265-4863-4713-ae79-61f9edbe43e3" />
<img width="250" height="750" alt="Screenshot 2026-03-07 152635" src="https://github.com/user-attachments/assets/6e5c8524-7972-4f8e-a513-a9ea3abf1603" />
<img width="250" height="750" alt="Screenshot 2026-03-07 152421" src="https://github.com/user-attachments/assets/351b7014-c492-4820-b39b-6c6e0d106b41" />
<img width="250" height="750" alt="Home Screen" src="https://github.com/user-attachments/assets/8e149123-dad7-4a93-ad06-ca5561efa918" />
<img width="250" height="750" alt="Home screen" src="https://github.com/user-attachments/assets/a01d2e30-81e4-46e0-8f49-ac80482c6beb" />
<img width="250" height="750" alt="Shimmer" src="https://github.com/user-attachments/assets/446065d0-0a8c-4cee-ae54-837ad096fded" />
<img width="250" height="750" alt="Text loading shimmer" src="https://github.com/user-attachments/assets/39dc807b-24ca-4777-bc99-1fcb69026fe3" />
<img width="250" height="750" alt="Screenshot_1773691245" src="https://github.com/user-attachments/assets/63864993-f278-4730-966d-0fb3520fb1a5" />
<img width="250" height="750" alt="Screenshot_1773691256" src="https://github.com/user-attachments/assets/d05a91a0-963a-4f13-9222-7975e53f9271" />
<img width="250" height="750" alt="Screenshot_1773691251" src="https://github.com/user-attachments/assets/f1a6ba34-97b7-4d2b-aaf4-ea34cd2c8819" />
<img width="250" height="750" alt="Screenshot_1773691256" src="https://github.com/user-attachments/assets/f5deec61-526b-47d7-86ce-01b230db34a7" />
<img width="250" height="750" alt="Screenshot_1773691245" src="https://github.com/user-attachments/assets/69532075-97d2-4b99-9883-cc536c0432be" />
<img width="250" height="750" alt="Screenshot_1774351354" src="https://github.com/user-attachments/assets/22725078-e01d-44ae-ba4d-e39512f07f85" />
<img width="250" height="750" alt="Screenshot_1773691245" src="https://github.com/user-attachments/assets/aac70213-88dc-469d-88c3-9d15b419cee9" />
<img width="250" height="750" alt="Screenshot_1774284833" src="https://github.com/user-attachments/assets/61af330f-1ef2-4715-bdc4-b137779f297f" />
<img width="250" height="750" alt="Screenshot_1774351548" src="https://github.com/user-attachments/assets/e744be23-37b3-4270-a50f-afada7c9e6f3" />
<img width="250" height="750" alt="Screenshot_1774349697" src="https://github.com/user-attachments/assets/aed9e130-dc91-4a98-8e1e-a75c0512e2f1" />
<img width="250" height="750" alt="Screenshot_1774349695" src="https://github.com/user-attachments/assets/0b799e18-2725-4474-bc50-08d84ff72d6a" />
<img width="250" height="750" alt="Screenshot_1774436374" src="https://github.com/user-attachments/assets/147d2ed1-600b-48ac-9818-1d487ff80ea8" />
<img width="250" height="750" alt="Screenshot_1774436402" src="https://github.com/user-attachments/assets/0f234a7b-0a4d-4f90-921d-527b83649395" />
<img width="250" height="750" alt="Screenshot_1774441992" src="https://github.com/user-attachments/assets/d0a94fcd-ea61-4bf9-a731-e31ba79ba9a9" />
<img width="250" height="750" alt="Screenshot_1774447933" src="https://github.com/user-attachments/assets/e3031da3-1c48-40fd-acc3-c6a4e1444888" />
<img width="250" height="750" alt="Screenshot_1774447923" src="https://github.com/user-attachments/assets/3f36436e-eff0-41c1-8c5b-75e62d3d6897" />
<img width="250" height="750" alt="Screenshot_1774449134" src="https://github.com/user-attachments/assets/1d7dcd6d-62a9-4261-9a6f-bac55700de56" />
<img width="250" height="750" alt="Screenshot_1774449390" src="https://github.com/user-attachments/assets/952e1e6b-9090-4af6-a060-95f46d21dcff" />
<img width="250" height="750" alt="Screenshot_1774540400" src="https://github.com/user-attachments/assets/0f60f861-ff98-4bfb-b9f2-02608ce14b10" />
<img width="250" height="750" alt="Screenshot_1774449390" src="https://github.com/user-attachments/assets/34708b9f-07ba-4b41-9510-7415f3b73eb3" />
<img width="250" height="750" alt="Screenshot_1774449110" src="https://github.com/user-attachments/assets/da9cd713-1e6d-4280-81e3-7e1be481df54" />
<img width="250" height="750" alt="Screenshot_1774449110" src="https://github.com/user-attachments/assets/b774bb05-444d-4e57-a0b8-2b0db79d46dc" />
<img width="250" height="750" alt="Screenshot_1774449110" src="https://github.com/user-attachments/assets/b608292f-7d1b-42b5-9ee6-8a04cf563ba0" />
























