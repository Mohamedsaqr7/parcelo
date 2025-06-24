# 📦 Parcelo – Smart Parcel Delivery App

**Parcelo** is a full-featured parcel tracking and delivery management app built with **Flutter**, offering a complete experience for both users and admins. It supports real-time tracking, error handling, and admin control, all wrapped in a sleek UI and robust architecture.

---

## 🎯 Purpose

**Problem:** Parcel delivery and tracking systems are often unorganized, confusing, or unreliable under poor internet conditions.

**Solution:** Parcelo simplifies the process through real-time maps, multi-language support, secure payment integration, and offline/error-handling screens.

---

## ✅ Core Features

### For Users:

* 📍 **Real-time tracking with Google Maps**
* 🕒 **Flexible parcel scheduling**
* 🔔 **Instant order status notifications**
* 💳 **Secure payments via Paymob**
* 🌃 **Light/Dark mode toggle**
* 🌐 **Arabic & English support**

### For Admins:

* ✅ **User management**: Approve/reject/edit users
* 📦 **Order control**: Assign, modify, or cancel orders
* 📊 **Dashboard insights**: View user and order analytics

### Robust UX in Emergencies:

* 📴 **No Internet Screen**: Automatically shown with ConnectionCubit
* ⛔️ **Error Screen**: Custom error UI using `ErrorWidget.builder`

---

## 🛠️ Tech Stack

* **Flutter** – Cross-platform mobile app
* **Supabase** – Authentication & real-time DB
* **Paymob** – Online payment integration
* **Google Maps API** – Real-time delivery tracking
* **BLoC + get\_it** – State management & dependency injection
* **WebView** – For payment flows
* **SharedPreferences + Secure Storage** – Data caching and secure tokens
* **GNav** – Bottom navigation bar

---

## 🧫 User & Admin Flow

| Role  | First-Time Flow      | Regular Use               | Special Features            |
| ----- | -------------------- | ------------------------- | --------------------------- |
| User  | Sign up via Supabase | Track parcels, Pay online | Multi-language, Offline UX  |
| Admin | Access via Supabase  | Manage orders and users   | Full control & live updates |

---

## 🔐 Smart Design Choices

* **Theme Control:** Default is **Light Mode**, can be toggled with `SharedPreferences`
* **Language:** Stored using `SharedPreferences`, defaults to `en`
* **Offline Detection:** Uses `ConnectionCubit` to detect and display fallback screens

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── app_cubit/            # Theme & language
│   ├── connection/           # Offline & error handlers
│   ├── constants/            # Keys, resources
│   ├── di/                   # Dependency Injection
│   └── routes/               # App navigation
├── features/
│   ├── auth/                 # Splash, onboarding
│   ├── customer/
│   │   ├── home/            # Main user flow
│   │   ├── maps/            # Live tracking
│   │   ├── orders/          # Order management
│   │   └── profile/         # Profile screen
│   └── admin/…               # Admin functionalities
└── main.dart                # Entry point
```

---

## 🚀 Getting Started

```bash
git clone https://github.com/Mohamedsaqr7/parcelo.git
cd parcelo
flutter pub get
flutter run
```

> ⚠️ Don’t forget to configure your `.env` file with your Supabase keys, Paymob API, and Google Maps token.

---

## 🎉 Next Steps

Parcelo is production-ready and can be released on Google Play as an AAB file. It can be further extended for merchants or driver-specific dashboards.

---

## 📼 Screenshots

### 📱 User Interface

![User 1](screenshots/1_Parcelo-Your-Smart-Parcel-Delivery-Solution.png)
![User 2](screenshots/2_Experience-the-Future-Parcelo-Your-Ultimate-Parcel-Delivery-Solution.png)
![User 3](screenshots/3_Addressing-Delivery-Challenges.png)
![User 4](screenshots/4_Core-Features-for-Users.png)

### 📈 Admin & System

![Admin](screenshots/5_Powerful-Admin-Capabilities.png)
![UX](screenshots/6_Robust-UX.png)
![Tech](screenshots/7_Under-the-Hood-Tech-Stack.png)
![Design](screenshots/8_Smart-Design-Choices.png)
![Preview](screenshots/9_Parcelo-See-It-in-Action.png)

---

## 🙍 Contact

Feel free to reach out if you have suggestions, want to contribute, or spot a bug!

---

Thanks for checking out **Parcelo**! 🚀
