# 📦 Parcelo – Smart Parcel Delivery App

Parcelo is a cross-platform Flutter mobile app designed to streamline parcel delivery and logistics. Whether you're a sender, receiver, or admin — Parcelo brings a powerful set of tools to your hands.

---

## 🚀 Features

### ✅ User Side
- 📍 **Live Delivery Tracking** with Google Maps
- 📦 **Smart Parcel Management** – schedule deliveries, track status, and get real-time updates
- 🔔 **Push Notifications** for delivery status & actions
- 🌐 **Multi-language Support** (🇬🇧 English, 🇸🇦 Arabic)
- 💳 **Integrated Payments** using **Paymob**
- 📶 **No Internet Screen** – Friendly fallback when offline
- ⚠️ **Custom Error Screen** – Handles unexpected crashes gracefully
- 👤 **Secure Login & Auth** via Supabase
- 🧭 Smooth Navigation with `GNav` bottom bar

---

### 🛠 Admin Panel (in-app)
- 📊 Admin Dashboard for full control
- 👥 Manage users and deliveries
- 🚚 Approve, assign, or cancel parcels
- 📷 View user-uploaded images

---

## 💡 Tech Stack

- 🔧 **Flutter 3.4.3**
- ☁️ **Supabase** (auth + backend)
- 💳 **Paymob** for payments
- 🗺 **Google Maps API**
- 🌐 **WebView Flutter** for embedded flows
- 🧠 **BLoC + get_it** for state management & DI
- 📦 **SharedPreferences + SecureStorage** for secure local data

---

## 🌍 Localization

Supports **English 🇬🇧** and **Arabic 🇸🇦** – easily toggle language from settings.

---

## 📱 Screenshots / Demo

> [🧠 You can add video or images here later – just place them in a `/screenshots` folder and link.]

---

## 🛠 Setup

```bash
git clone https://github.com/Mohamedsaqr7/parcelo.git
cd parcelo
flutter pub get
flutter run
