# 🐦 Flappy Bird - Godot 4.3

Dự án tái hiện lại trò chơi **Flappy Bird** huyền thoại bằng **Godot Engine 4.3**. Đây là một bản clone tập trung vào sự chính xác về vật lý, cảm giác chơi và quy trình xuất bản trò chơi (Game Export).

## ✨ Tính năng chính (Key Features)

* **Simple Mechanics:** Cơ chế điều khiển "một nút" đặc trưng, bay lên khi nhấn phím hoặc chuột.
* **Infinite Gameplay:** Hệ thống chướng ngại vật (ống nước) được sinh ra ngẫu nhiên và liên tục.
* **Score System:** Tính điểm mỗi khi vượt qua chướng ngại vật thành công.
* **Ready to Play:** Dự án đã được đóng gói sẵn thành file thực thi (.exe) để trải nghiệm ngay lập tức.

## 🛠️ Công nghệ sử dụng (Tech Stack)

* **Game Engine:** [Godot Engine 4.3](https://godotengine.org/)
* **Scripting:** GDScript.
* **Exported for:** Windows (index.exe).

## 📁 Cấu trúc dự án (Folder Structure)

```text
├── Assets/              # Chứa tài nguyên hình ảnh (Chim, Ống nước, Nền, Âm thanh)
├── Scenes/              # Các cảnh chính: World, Player, Pipe, UI
├── Scripts/             # Logic xử lý chim bay, cuộn nền và tính điểm
├── Flappy Bird.zip      # Bản lưu trữ mã nguồn đóng gói
├── index.exe            # File chạy game trực tiếp trên Windows
├── index.pck            # File dữ liệu tài nguyên đã đóng gói
├── export_presets.cfg   # Cấu hình xuất bản dự án
└── project.godot        # File cấu hình chính của Godot 4.3
