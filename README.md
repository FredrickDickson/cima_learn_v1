
# CIMA Learn Hub (v1)

CIMA Learn Hub is a cross-platform mobile and web application built with **Flutter**.  
It is designed to provide world-class training in **International Arbitration, Mediation, Compliance, and Commercial Law**, giving learners access to structured courses and resources in dispute resolution.

This repository (`cima_learn_hub_v1`) contains the **first working version** of the app.

---

## 🚀 Features

- 📚 **Course Catalog**  
  Browse featured and categorized courses in arbitration, mediation, commercial law, and compliance.  

- 🏷 **Course Cards with Details**  
  Each course includes title, instructor, rating, reviews, duration, student count, price, and discount options.  

- 🎨 **Modern UI/UX**  
  Built using Flutter’s Material 3 design with a professional theme, clean typography, and responsive layouts.  

- 🌍 **Responsive Layouts**  
  Optimized for both mobile and larger screens (tablet/web).  

- 🖼 **Hero Section**  
  Beautiful hero banner with a clear call-to-action (CTA).  

- 🧭 **Navigation & Routing**  
  Initial route setup (`/` for home and a fallback 404 page).  

- 🎉 **Animations & Interactions**  
  Smooth fade-in and scaling animations on course cards.  

- 🍞 **Toast Notifications**  
  Informative messages such as **“Welcome to CIMA Learn Hub!”** and button click feedback.  

---

## 📂 Project Structure

```

cima\_learn\_hub\_v1/
│
├── lib/
│   ├── main.dart                # Entry point of the app
│   ├── models/                  # Data models (Course, etc.)
│   ├── widgets/                 # Reusable UI components
│   ├── screens/                 # App screens (Home, NotFound)
│   └── utils/                   # Helper functions
│
├── assets/
│   └── images/                  # Course and hero images
│
├── pubspec.yaml                 # Dependencies and asset configs
├── README.md                    # Project documentation
└── LICENSE                      # Open-source license (if applicable)

````

---

## 📸 Screenshots (Planned)

> Add screenshots of the home screen, course catalog, and hero banner once available.  

---

## ⚙️ Installation & Setup

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x or higher)  
- Dart 3.x  
- Android Studio / VS Code with Flutter extensions  

### Clone the repository
```bash
git clone https://github.com/FredrickDickson/cima_learn_hub_v1.git
cd cima_learn_hub_v1
````

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

---

## 🛠 Dependencies

Key Flutter packages used in this version:

* `supabase_flutter` – (planned integration for backend services)
* `fluttertoast` – toasts for notifications
* `material3` (via Flutter) – modern UI components

All dependencies are listed in `pubspec.yaml`.

---

## 📌 Roadmap

* [ ] Integrate **Supabase** for authentication & database
* [ ] Add user login & sign-up flows
* [ ] Connect courses to backend API
* [ ] Add payment gateway (Stripe/Paystack)
* [ ] Multi-language support
* [ ] Deployment on iOS, Android, and Web

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📜 License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Fredrick Kwesi Poku Dickson**

* 🌐 [GitHub](https://github.com/FredrickDickson)
* 💼 Full-Stack Engineer

---

## 🙏 Acknowledgements

* Flutter & Dart Community
* Supabase for backend services
* All course instructors and contributors at **CIMA**

---

