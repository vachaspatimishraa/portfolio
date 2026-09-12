# Vachaspati Mishra Portfolio --- Design, Tech Stack & Functional Specification

> **Purpose:** Authoritative implementation plan for a personal
> portfolio website for Vachaspati Mishra.
>
> **Framework decision:** Use **Flutter Web**.
>
> **Important:** Inspect the repository before implementation. Reuse
> working architecture/components where appropriate. Do not introduce
> unnecessary infrastructure.

------------------------------------------------------------------------

# 1. PRODUCT

## Portfolio owner

**Vachaspati Mishra**

## Primary goal

Create a premium personal portfolio that presents Vachaspati as a:

-   Software Developer
-   Product Builder
-   MBA student specializing in IT & Marketing

The portfolio should showcase five major products:

-   FinTrack
-   VitaFolio
-   Taskuvo
-   PrepMate
-   Voryn

The website itself should demonstrate strong Flutter UI engineering.

------------------------------------------------------------------------

# 2. FRAMEWORK

Use:

**Flutter Web**

Preferred environment:

-   Current stable Flutter
-   Dart 3.x compatible with the selected Flutter release

Do not use Flutter merely as a visual wrapper around an ordinary static
site. The application should use Flutter's responsive/layout
capabilities intentionally.

------------------------------------------------------------------------

# 3. RECOMMENDED TECH STACK

## Core

``` text
Flutter
Dart
Flutter Web
```

## State management

Prefer a lightweight existing architecture.

If a new state-management layer is required:

**Riverpod**

Do not add state management solely for static content.

------------------------------------------------------------------------

## Routing

**go_router**

Recommended routes:

``` text
/
 /about
 /projects
 /projects/fintrack
 /projects/vitafolio
 /projects/taskuvo
 /projects/prepmate
 /projects/voryn
 /skills
 /education
 /contact
```

Project detail pages may alternatively use query/parameter-based routing
if the final information architecture benefits from it.

------------------------------------------------------------------------

## Responsive layout

Use Flutter's responsive layout primitives:

-   `LayoutBuilder`
-   `MediaQuery`
-   `ConstrainedBox`
-   `Flex`
-   `Wrap`
-   adaptive navigation

Do not hardcode desktop-only dimensions.

------------------------------------------------------------------------

## Animation

Prefer:

-   Flutter implicit animations
-   `AnimatedContainer`
-   `AnimatedSwitcher`
-   `TweenAnimationBuilder`
-   `Hero`
-   `FadeTransition`
-   `SlideTransition`

If a dedicated animation library is needed, use a lightweight package
such as `flutter_animate`.

Animations must remain subtle and professional.

------------------------------------------------------------------------

## Typography

Use a modern, highly readable typeface.

If using Google Fonts:

**google_fonts**

Select one primary family and use a disciplined type scale.

Do not mix many fonts.

------------------------------------------------------------------------

## Icons

Use:

-   Material Symbols / Material Icons where appropriate
-   Project-specific assets for project branding

Do not use random icon packs that make the interface visually
inconsistent.

------------------------------------------------------------------------

# 4. HOSTING

Recommended deployment:

**Vercel, Firebase Hosting, Netlify, or GitHub Pages**

Choose based on the final repository/deployment workflow.

Flutter Web can be built with:

``` bash
flutter build web --release
```

The deployment target must support SPA fallback so deep links such as:

``` text
/projects/voryn
```

work correctly.

------------------------------------------------------------------------

# 5. DESIGN LANGUAGE

The visual direction should be:

-   premium
-   modern
-   minimal
-   developer-focused
-   product-focused
-   responsive
-   accessible
-   fast

Avoid:

-   excessive glassmorphism
-   excessive gradients
-   giant skill bars
-   unnecessary 3D effects
-   template-looking sections
-   excessive animation
-   crowded dashboards
-   fake metrics

The projects should be the visual focus.

------------------------------------------------------------------------

# 6. COLOR SYSTEM

Use centralized theme tokens.

## Dark mode

Conceptual:

``` text
Background       #000000
Surface          #121316
Elevated         #191A1F
Primary text     #F7F7F8
Secondary text   #A5A6AD
Accent           #6C7CFF
```

## Light mode

Conceptual:

``` text
Background       #F7F7F9
Surface          #FFFFFF
Secondary        #EFEFF3
Primary text     #111114
Accent           #5669F5
```

These are starting tokens, not permission to scatter hardcoded values.

------------------------------------------------------------------------

# 7. THEME

Support exactly:

``` text
Light
Dark
System
```

Default:

**System**

Theme selection should persist locally.

When System is selected, Flutter should follow device/browser
appearance.

Use:

``` dart
ThemeMode.system
```

where appropriate.

------------------------------------------------------------------------

# 8. GLOBAL HEADER

Desktop:

``` text
[Vachaspati / Logo]     About Projects Skills Education Contact     [Theme]
```

Mobile:

``` text
[Vachaspati]                         [Menu]
```

Navigation should collapse cleanly on smaller screens.

Primary CTA may be:

**View Projects**

Secondary CTA:

**Contact Me**

------------------------------------------------------------------------

# 9. HERO SECTION

The first screen should immediately communicate:

**Vachaspati Mishra**

Suggested headline:

> **I build products, not just projects.**

Supporting copy should communicate:

-   MBA in IT & Marketing
-   software development
-   product building
-   practical applications

Primary buttons:

``` text
View Projects
Contact Me
```

Secondary social links:

-   GitHub
-   LinkedIn

Do not overcrowd the hero.

------------------------------------------------------------------------

# 10. HERO VISUAL

Use a subtle product/developer visual.

Possible implementation:

-   abstract gradient/mesh
-   project cards floating subtly
-   minimal code/product motif
-   profile image if supplied

Do not use a generic stock developer illustration.

------------------------------------------------------------------------

# 11. ABOUT SECTION

Heading:

**About Me**

Focus on the combination of:

``` text
Technology
+
Product Development
+
Business/Marketing
```

Explain that Vachaspati is pursuing an MBA from AKTU in IT and Marketing
while building practical software products.

Keep the final copy factual and based on verified information.

------------------------------------------------------------------------

# 12. PROJECTS SECTION

This is the most important section.

Heading:

**Selected Projects**

Show five project cards:

``` text
FinTrack
VitaFolio
Taskuvo
PrepMate
Voryn
```

Each card should contain:

-   project logo/visual
-   name
-   one-line description
-   technology badges
-   status
-   View Project button

Avoid huge cards that make scrolling unnecessarily long.

------------------------------------------------------------------------

# 13. PROJECT CARD INTERACTION

Desktop:

-   subtle hover elevation
-   slight transform
-   reveal action
-   image movement where appropriate

Mobile:

-   no hover dependency
-   clear tap target

Clicking:

**View Project**

opens the project detail page.

------------------------------------------------------------------------

# 14. PROJECT DETAIL PAGE

Every project should have a consistent layout:

``` text
Project Hero
↓
Problem / Purpose
↓
What I Built
↓
Key Features
↓
Technology
↓
Architecture / How It Works
↓
Screenshots
↓
Challenges / Engineering Decisions
↓
Links
```

Only display sections for which verified content exists.

------------------------------------------------------------------------

# 15. FINTRACK PAGE

Present FinTrack as a finance-management product.

Known technology:

``` text
Flutter
Isar
Supabase
```

Known areas:

-   income/expense tracking
-   accounts
-   categories
-   reports
-   PDF/Excel export
-   search
-   biometric/app lock
-   themes
-   English/Hindi
-   offline-first/local data
-   synchronization

Verify repository status before claiming all are complete.

------------------------------------------------------------------------

# 16. VITAFOLIO PAGE

Present VitaFolio as a professional resume/CV builder.

Known areas:

-   resume creation
-   editing
-   education
-   experience
-   languages
-   skills
-   preview
-   version/history workflows
-   OCR/parser work
-   phone validation
-   country-code selection
-   email verification
-   phone OTP

Known backend:

**Supabase**

Use real screenshots from the project where possible.

------------------------------------------------------------------------

# 17. TASKUVO PAGE

Include Taskuvo as a major project.

Do not invent its features or stack.

Populate detailed sections only after repository/project-context
verification.

------------------------------------------------------------------------

# 18. PREPMATE PAGE

Include PrepMate as a major project.

Do not invent its features or stack.

Populate detailed sections only after repository/project-context
verification.

------------------------------------------------------------------------

# 19. VORYN PAGE

Present Voryn as a communication product.

Official name:

**Voryn**

Tagline:

**Connect your way.**

Known product areas:

-   audio calling
-   video calling
-   meetings
-   screen sharing
-   call-related lightweight messaging
-   contact discovery
-   call history
-   contacts
-   presence
-   DND
-   call waiting
-   merged/group calls

Backend direction:

**Supabase**

Development phases:

``` text
UI/mock
→ backend/local sync
→ real media
→ integration/testing
```

Make the page visually strong because Voryn demonstrates product/system
design thinking.

------------------------------------------------------------------------

# 20. SKILLS SECTION

Do not invent a skills list.

Build the UI so verified skills can be categorized:

``` text
Languages
Frameworks
Backend
Database
Tools
Product / Business
```

Use technology badges rather than progress bars.

Do not display:

``` text
Flutter 95%
Dart 90%
```

unless there is a genuine reason to quantify proficiency.

------------------------------------------------------------------------

# 21. EDUCATION SECTION

Display:

``` text
MBA
AKTU
Specializations: IT & Marketing
CGPA: 7.4
```

Do not invent dates.

Additional education can be added after verification.

------------------------------------------------------------------------

# 22. CONTACT SECTION

Heading:

**Let's Connect**

Display:

``` text
Email
vachaspatimishra@outlook.in

Phone
8081025075

GitHub
github.com/vachaspatimishraa

LinkedIn
linkedin.com/in/vachaspatimishra
```

Email should use a `mailto:` action.

Phone should use a `tel:` action where appropriate.

External profiles should open in a new browser tab.

------------------------------------------------------------------------

# 23. FOOTER

Minimal footer:

``` text
Vachaspati Mishra

Software Developer • Product Builder • MBA (IT & Marketing)

GitHub · LinkedIn · Email

© [current year] Vachaspati Mishra
```

Do not hardcode an outdated year.

------------------------------------------------------------------------

# 24. RESPONSIVENESS

Target:

-   mobile
-   tablet
-   laptop
-   desktop
-   wide desktop

Suggested breakpoints:

``` text
< 600px       Mobile
600–1024px    Tablet
1024–1440px   Desktop
> 1440px      Wide desktop
```

Do not assume exact breakpoints are mandatory; use layout constraints
where better.

------------------------------------------------------------------------

# 25. MOBILE NAVIGATION

Use a compact mobile menu.

Do not use a bottom navigation bar like an application unless there is a
compelling design reason.

This is a portfolio website, not one of Vachaspati's mobile apps.

------------------------------------------------------------------------

# 26. PERFORMANCE

Prioritize:

-   optimized images
-   lazy loading where appropriate
-   minimal dependencies
-   compressed assets
-   avoiding unnecessary rebuilds
-   avoiding large animation payloads
-   semantic structure
-   fast first render

Project screenshots should be optimized before shipping.

------------------------------------------------------------------------

# 27. SEO

Flutter Web SEO is weaker than a traditional SSR web framework, so
compensate where practical.

Include:

-   meaningful page titles
-   descriptions
-   proper route titles
-   Open Graph metadata where supported
-   favicon
-   social preview image
-   sitemap/deployment configuration where applicable
-   `robots.txt`

Do not claim SEO advantages that Flutter Web does not provide.

------------------------------------------------------------------------

# 28. ACCESSIBILITY

Support:

-   keyboard navigation
-   visible focus states
-   semantic labels
-   sufficient contrast
-   large tap targets
-   reduced reliance on animation
-   readable font sizes

Interactive controls must not depend only on color.

------------------------------------------------------------------------

# 29. DATA MODEL FOR PORTFOLIO CONTENT

Keep project content structured rather than embedding everything
directly inside widgets.

Example conceptual model:

``` dart
class Project {
  final String id;
  final String name;
  final String description;
  final String? logoAsset;
  final List<String> technologies;
  final List<String> features;
  final String status;
  final String? githubUrl;
  final String? liveUrl;
  final List<String> screenshots;
}
```

Store verified content in a local data layer such as:

``` text
lib/data/
lib/models/
lib/content/
```

Choose the repository's existing conventions if already established.

------------------------------------------------------------------------

# 30. RECOMMENDED FLUTTER STRUCTURE

Conceptual structure:

``` text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme/
│       ├── app_theme.dart
│       ├── colors.dart
│       └── typography.dart
│
├── core/
│   ├── responsive/
│   ├── widgets/
│   └── utils/
│
├── data/
│   ├── project_data.dart
│   └── profile_data.dart
│
├── models/
│   ├── project.dart
│   └── profile.dart
│
└── features/
    ├── home/
    ├── about/
    ├── projects/
    ├── skills/
    ├── education/
    └── contact/
```

If the existing repository has a different sound architecture, adapt
instead of rewriting it.

------------------------------------------------------------------------

# 31. LOCAL STORAGE

For a mostly static portfolio, do not introduce a database.

Local persistence is only needed for preferences such as:

-   theme selection

Use a lightweight preference mechanism.

------------------------------------------------------------------------

# 32. BACKEND

The portfolio itself does NOT require Supabase initially.

Prefer a static/mostly-static architecture.

Supabase should only be introduced if an actual requirement appears,
such as:

-   contact form persistence
-   analytics requiring a backend
-   CMS
-   dynamic content

Do not add a backend simply because Vachaspati's other projects use
Supabase.

------------------------------------------------------------------------

# 33. CONTACT FORM

Phase 1 recommendation:

Use direct contact actions:

-   Email
-   Phone
-   LinkedIn
-   GitHub

If a form is added later, use a secure service/backend.

Never expose private API keys or service-role credentials in Flutter
Web.

------------------------------------------------------------------------

# 34. ANALYTICS

Optional.

If analytics are needed, use a privacy-conscious web analytics solution.

Do not add analytics before launch without a clear purpose.

------------------------------------------------------------------------

# 35. SECURITY

Never put secrets in Flutter Web.

Everything shipped to a browser should be considered publicly
inspectable.

Do not put:

-   Supabase service-role keys
-   private API credentials
-   SMTP passwords
-   private tokens

inside the Flutter application.

------------------------------------------------------------------------

# 36. PROJECT STATUS SYSTEM

Use clear status labels such as:

``` text
In Development
Active
Completed
Prototype
```

Only assign a status after checking the actual project.

Do not call an unfinished project "Production Ready."

------------------------------------------------------------------------

# 37. INTERACTION PHILOSOPHY

The website should feel polished but not gimmicky.

Use animation for:

-   page entrance
-   card hover
-   section transitions
-   navigation feedback

Avoid:

-   constant motion
-   distracting particles
-   excessive parallax
-   long loading animations
-   animation that blocks reading

------------------------------------------------------------------------

# 38. IMAGE/ASSET STRATEGY

Use:

``` text
assets/
├── branding/
├── profile/
├── projects/
│   ├── fintrack/
│   ├── vitafolio/
│   ├── taskuvo/
│   ├── prepmate/
│   └── voryn/
└── social/
```

Use real project screenshots and logos.

Do not use fake UI screenshots.

------------------------------------------------------------------------

# 39. DEVELOPMENT WORKFLOW

Before coding:

1.  Inspect repository.
2.  Inspect `pubspec.yaml`.
3.  Identify existing architecture.
4.  Identify reusable widgets/theme.
5.  Check Flutter version.
6.  Check assets.
7.  Check existing routing/state management.
8.  Preserve working code.

Then implement incrementally.

------------------------------------------------------------------------

# 40. IMPLEMENTATION ORDER

Recommended order:

``` text
1. Project audit
2. Theme system
3. Global responsive shell
4. Header/navigation
5. Hero
6. About
7. Projects listing
8. Project detail pages
9. Skills
10. Education
11. Contact
12. Footer
13. Responsive refinement
14. Animations
15. SEO/meta/deployment setup
16. Testing
17. Production build
```

------------------------------------------------------------------------

# 41. TESTING

Verify at minimum:

### Desktop

-   navigation
-   project routing
-   hover interactions
-   external links
-   theme switching

### Mobile

-   menu
-   responsive cards
-   project pages
-   text wrapping
-   tap targets
-   external links

### Theme

-   Light
-   Dark
-   System

### Build

``` bash
flutter analyze
flutter test
flutter build web --release
```

Fix all relevant analyzer errors before release.

------------------------------------------------------------------------

# 42. FINAL USER EXPERIENCE

A visitor should be able to understand within seconds:

1.  Who Vachaspati Mishra is.
2.  What he builds.
3.  That he combines IT and Marketing/business knowledge.
4.  What his major products are.
5.  How to inspect his work.
6.  How to contact him.

The website should make the projects the proof of capability.

------------------------------------------------------------------------

# 43. FINAL DESIGN PRINCIPLE

The portfolio should not look like:

> "Here is a student with a list of technologies."

It should look like:

> **"Here is a product builder who happens to be pursuing an MBA in IT &
> Marketing and has built multiple real applications."**

The implementation should make that distinction visible through
hierarchy, project storytelling, screenshots, architecture explanations,
and clean interaction design.
