# 🌳 GoalTree

**GoalTree** is a Flutter app designed to help users manage long-term goals through a visual and structured **tree-based system**. It’s ideal for breaking down massive life goals into smaller, achievable steps — each visualized like branches and leaves on a tree.

---

## ✨ Features

- 📌 Visualize big goals as root nodes (e.g., "Move to the USA")
- 🌱 Add sub-goals and tasks as nested nodes (e.g., "Learn English", "Improve Programming")
- 📊 Track progress and deadlines
- 📁 Attach useful resources (articles, videos, etc.)
- ⚡ Real-time updates using ObjectBox + Bloc pattern

---

## 📦 Tech Stack

| Tool         | Purpose                            |
|--------------|------------------------------------|
| Flutter      | UI and App Development             |
| ObjectBox    | Local database (NoSQL)             |
| Bloc         | State management                   |
| build_runner | Code generation for ObjectBox      |

---

## 🧠 Data Structure

The app uses a **tree-like structure** for goals:
```
Goal (root)
├── Node: Learn English
│   ├── Node: Watch YouTube videos
│   └── Node: Practice speaking
└── Node: Improve Programming
    ├── Node: Master Dart
    └── Node: Build portfolio
```

---

## 🗂️ Folder Structure

```
lib/
├── core/
│   ├── helpers/      # Helper functions and classes
│   ├── models/       # Data models for the app
│   └── theme/        # App theme and text styles
├── features/
│   ├── add_new_goal/ # Add new goal feature
│   ├── goal_details/ # Goal details feature
│   └── home/         # Home screen feature
├── main.dart         # App entry point
└── ...               # Other generated and config files
```

---

## 🔧 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/mhmaldyb510/goal-tree.git
   cd goal-tree
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Build ObjectBox models**
   ```bash
   dart run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 💾 Database

This project uses **ObjectBox** for local data storage.

> Note: `watchAllGoals()` gives you real-time stream updates of all stored goals, safely cleaned up when cancelled.

---

## ✅ TODO

- [ ] Add drag-and-drop tree visualization
- [ ] Add cloud sync
- [ ] Export and share goal trees
- [ ] Add authentication

---

## 📃 License

This project is licensed under the MIT License.

---

## 🙋‍♂️ Author

Made with ❤️ by **Mohamed Naser Mohamed Aldeeb**  
[GitHub](https://github.com/mhmaldyb510) • [LinkedIn](https://www.linkedin.com/in/mhmaldyb510)
