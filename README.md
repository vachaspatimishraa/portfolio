# Vachaspati Mishra — Modern Flutter Portfolio (2026 Edition)

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![AKTU](https://img.shields.io/badge/AKTU-B.Tech%20CSE%20(7.4%20CGPA)-6366F1?style=for-the-badge)](https://aktu.ac.in)
[![MBA](https://img.shields.io/badge/MBA-2nd%20Year%20(IT%20%26%20Marketing)-10B981?style=for-the-badge)](https://aktu.ac.in)
[![License](https://img.shields.io/badge/License-MIT-06B6D4?style=for-the-badge)](LICENSE)

### *"I build products, not just projects."*

An ultra-modern, responsive, high-performance portfolio website built with **Flutter Web**, showcasing software engineering excellence, product craftsmanship, and practical business impact.

[🌐 Live Portfolio Demo](https://vachaspatimishra.vercel.app/) • [📫 Contact Me](mailto:vachaspatimishra@outlook.in) • [💼 LinkedIn](https://linkedin.com/in/vachaspatimishra) • [🐙 GitHub](https://github.com/vachaspatimishraa)

</div>

---

## 🌟 Overview

This portfolio embodies the unique blend of **Software Engineering**, **System Architecture**, and **Product Strategy**:
- **Software Developer & Product Builder** with a focus on cross-platform Flutter applications, offline-first architectures, and modern cloud backends.
- **Academic Foundation**: B.Tech in Computer Science & Engineering (**Class of 2026, 7.4 CGPA**) & currently pursuing **MBA 2nd Year (IT & Marketing)** from Dr. A.P.J. Abdul Kalam Technical University (AKTU).
- Engineered with dark glassmorphism aesthetics, responsive breakpoints across all screen sizes (mobile, tablet, desktop), fluid micro-animations, and zero render overflow constraints.

---

## 🚀 Featured Products

| Product | Focus / Domain | Tech Stack | Status |
| :--- | :--- | :--- | :--- |
| **[PrepMateAI](https://github.com/vachaspatimishraa)** | AI Resume Authoring, ATS Scoring & Interview Prep | Flutter, Supabase, AI APIs | 🟢 **Completed** |
| **[Taskuvo](https://github.com/vachaspatimishraa)** | High-Efficiency Productivity & Task Lifecycle Management | Flutter, Local Cache, Supabase | 🟢 **Completed** |
| **[FinTrack](https://github.com/vachaspatimishraa)** | Offline-First Personal Finance, Analytics & Biometric Vault | Flutter, Isar DB, Supabase | 🟢 **Completed** |
| **[VitaFolio](https://github.com/vachaspatimishraa)** | Dynamic Resume & CV Builder with Export Workflows | Flutter, Supabase, PDF Engine | 🟢 **Completed** |
| **[Voryn](https://github.com/vachaspatimishraa)** | Real-Time Encrypted 1:1 Audio & Video Communication | Flutter, WebRTC, Supabase | 🔵 **Active Flagship** |

---

## 🎓 Education & Milestones

- **Master of Business Administration (MBA)** — AKTU *(Pursuing, Currently in 2nd Year)*
  - Dual Specializations in **Information Technology (IT)** and **Marketing**
- **Bachelor of Technology (B.Tech) in Computer Science & Engineering** — AKTU *(Class of 2026)*
  - Graduated with **7.4 CGPA**
- **Senior Secondary (Class XII)** — UP Board *(2022)*
  - Passed with 1st Division Honors (PCM)
- **High School (Class X)** — UP Board *(2020)*
  - Passed with 1st Division Academic Distinction

---

## 🛠️ Technical Stack & Skills

### **Core Engineering**
- **Languages**: Dart, Python, JavaScript, SQL, C/C++
- **Frameworks & UI**: Flutter (Web, Android, iOS, Desktop), Material 3, Glassmorphism Design System
- **State Management & Architecture**: Riverpod, Provider, Clean Architecture, Repository Pattern, Offline-First Sync
- **Databases & Cloud**: Supabase, PostgreSQL, Isar DB, SQLite, Firebase, RESTful APIs, WebSockets
- **DevOps & Tooling**: Git, GitHub Actions, Docker, Linux, VS Code, Android Studio, Postman

---

## ✨ Portfolio Key Features

- **📱 Fully Responsive**: Adaptive layouts crafted for mobile (< 700px), tablet (700px – 1099px), and desktop (≥ 1100px) with custom collapsible navigation and dynamic drawers.
- **🎨 Modern Dark Aesthetic**: Tailored deep-navy / obsidian palette (`#080C14`) paired with glowing cyan (`#06B6D4`), violet (`#8B5CF6`), and emerald (`#10B981`) accents.
- **🏷️ Interactive Category Filtering**: Dynamic filter pills across *All Products*, *AI & Career*, *FinTech & Tools*, and *Communication*.
- **🔍 Deep-Dive Project Modal**: Detailed dialog sheets featuring architectural overviews, core highlights, and direct repository links.
- **⏳ Interactive Milestones Timeline**: Visual journey mapping academic achievements and completed product cycles from 2020 to 2026.
- **⚡ Native Performance**: Built natively with Flutter Web CanvasKit / HTML renderers, zero external heavyweight packages, strict YAGNI, and passing automated test suites.

---

## 📂 Project Directory Structure

```plaintext
myportfolio/
├── assets/
│   ├── icons/
│   │   ├── social/       # GitHub, LinkedIn, Email assets
│   │   └── tech/         # Flutter, Dart, Python, Docker, etc.
│   └── images/
│       ├── backgrounds/  # Ambient glows & grid patterns
│       ├── profile/      # Profile avatar & brand iconography
│       └── projects/     # PrepMateAI, Connectify/Voryn UI showcases
├── lib/
│   ├── models/
│   │   └── portfolio_models.dart  # Strongly-typed data models & project specs
│   ├── theme/
│   │   └── app_theme.dart         # Glassmorphism tokens, gradients & styles
│   ├── utils/
│   │   └── url_helper.dart        # Universal URL launcher for Web & Mobile
│   ├── widgets/
│   │   ├── about_section.dart     # Professional background & MBA/IT vision
│   │   ├── contact_section.dart   # Contact cards & interactive message trigger
│   │   ├── education_section.dart # 4 education cards (B.Tech 7.4 CGPA, MBA)
│   │   ├── footer_section.dart    # Clean footer with quick links & copyright
│   │   ├── hero_section.dart      # Hero headline, CTA buttons, metrics bar
│   │   ├── journey_section.dart   # 2020–2026 timeline milestones
│   │   ├── nav_header.dart        # Glassmorphic top navigation bar & drawer
│   │   ├── project_detail_modal.dart # Interactive project view dialog
│   │   ├── projects_section.dart  # Filterable product showcase cards
│   │   └── skills_section.dart    # Organized technical competence badges
│   └── main.dart                  # Application entrypoint & scroll controller
├── test/
│   └── widget_test.dart           # Automated responsiveness & overflow tests
├── web/
│   ├── index.html                 # SEO metadata & responsive viewport config
│   └── manifest.json              # Web PWA capabilities
└── pubspec.yaml                   # Flutter dependencies & asset registrations
```

---

## 💻 Local Development Setup

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`v3.19.0` or later recommended)
- Google Chrome or any modern web browser

### 1. Clone the Repository
```bash
git clone https://github.com/vachaspatimishraa/portfolio.git
cd portfolio
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the Development Server
```bash
# Run in Chrome
flutter run -d chrome

# Or run with web-server mode
flutter run -d web-server --web-port 8080
```

### 4. Build Production Web Bundle
```bash
flutter build web --release
```
The compiled static production bundle will be generated in `build/web/`.

### 5. Run Verification & Tests
```bash
flutter analyze
flutter test
```

---

## 📬 Connect with Me

- **Email**: [vachaspatimishra@outlook.in](mailto:vachaspatimishra@outlook.in)
- **Phone**: [+91 8081025075](tel:+918081025075)
- **LinkedIn**: [linkedin.com/in/vachaspatimishra](https://linkedin.com/in/vachaspatimishra)
- **GitHub**: [@vachaspatimishraa](https://github.com/vachaspatimishraa)

---

<div align="center">
  <sub>Designed & Developed with ❤️ using Flutter by Vachaspati Mishra • © 2026 All Rights Reserved</sub>
</div>
