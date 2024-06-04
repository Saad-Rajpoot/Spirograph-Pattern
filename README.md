# Spirograph Pattern in Flutter

Welcome to the Spirograph Pattern Flutter project! This project demonstrates how to create beautiful and interactive spirograph patterns using Flutter's powerful drawing capabilities. Whether you're an experienced developer or just starting out, this project offers a fun and educational way to explore Flutter's custom painting and UI design features.


## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Usage](#usage)
    - [Adjusting Parameters](#adjusting-parameters)
- [Code Overview](#code-overview)
    - [Main Widgets](#main-widgets)
    - [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)


## Introduction

A spirograph is a geometric drawing device that produces mathematical curves known as hypotrochoids and epitrochoids. This Flutter project recreates the spirograph experience, allowing users to generate and manipulate these intricate patterns through an intuitive mobile interface.


## Features

- **Interactive UI:** Use sliders to adjust the parameters of the spirograph in real-time.
- **Customizable Design:** Modify radii, rotation speed, and other parameters to create unique patterns.
- **Responsive Layout:** The spirograph dynamically adjusts to different screen sizes and orientations.
- **Smooth Animations:** Watch as the spirograph pattern updates seamlessly with user inputs.


## Screenshots

<p align="start">
<video width="320" height="240" controls>
    <source src="https://github.com/USERNAME/REPOSITORY_NAME/blob/BRANCH_NAME/PATH_TO_YOUR_VIDEO.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>
</p>


## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)


### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/spirograph-flutter.git
    cd spirograph-flutter
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## Usage

After running the app, you will see a spirograph pattern displayed on the screen. Use the slider at the bottom to adjust the parameters and explore different designs.


### Adjusting Parameters

- **Radius (R):** Controls the radius of the larger circle.
- **Radius (r):** Controls the radius of the smaller circle.
- **Offset (d):** Controls the distance from the center of the smaller circle to the drawing point.


## Code Overview

### Main Widgets

- **SpirographDemo:** This is the main widget containing the UI elements, including the slider and the CustomPaint widget.
- **SpirographPainter:** A custom painter class responsible for drawing the spirograph pattern on the canvas.

Here is an example of the `SpirographPainter` class:

```dart
class SpirographPainter extends CustomPainter {
  final double t;

  SpirographPainter({required this.t});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final R = 100.0; // Large circle radius
    final r = 10.0;  // Small circle radius
    final d = 50.0;  // Distance from center of the small circle

    final path = Path();

    for (double theta = 0.0; theta < 2 * pi; theta += 0.01) {
      final x = (R - r) * cos(theta) + d * cos((R - r) / r * theta);
      final y = (R - r) * sin(theta) - d * sin((R - r) / r * theta);

      if (theta == 0.0) {
        path.moveTo(size.width / 2 + x, size.height / 2 + y);
      } else {
        path.lineTo(size.width / 2 + x, size.height / 2 + y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SpirographPainter oldDelegate) {
    return oldDelegate.t != t;
  }
}
```


### Customization

You can modify the `SpirographPainter` class to change how the spirograph is drawn. Adjust the parameters like `R`, `r`, and `d` to see different patterns. Here's how you might do it:

```dart
class SpirographPainter extends CustomPainter {
  final double t;
  final double R;
  final double r;
  final double d;

  SpirographPainter({required this.t, required this.R, required this.r, required this.d});

  @override
  void paint(Canvas canvas, Size size) {
    // Drawing logic
  }

  @override
  bool shouldRepaint(SpirographPainter oldDelegate) {
    return oldDelegate.t != t || oldDelegate.R != R || oldDelegate.r != r || oldDelegate.d != d;
  }
}
```


## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


## Contact

If you have any questions or suggestions, feel free to reach out:

- Email: saadi47123@gmail.com
- GitHub: [Saad Rajpoot](https://github.com/Saad-Rajpoot)
- LinkedIn: [Saad Rajpoot](https://www.linkedin.com/in/saad-rajpoot-b3ba85225/)

Thank you for checking out the Spirograph Pattern Flutter project! Enjoy creating your own unique patterns and feel free to share your creations with the community.
