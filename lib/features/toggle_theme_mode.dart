import 'package:flutter/material.dart';

void main() {
  runApp(const ToggleThemeMode());
}

class ToggleThemeMode extends StatefulWidget {
  const ToggleThemeMode({super.key});

  @override
  State<ToggleThemeMode> createState() => _ToggleThemeModeState();
}

class _ToggleThemeModeState extends State<ToggleThemeMode> {
  bool _isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Toggle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF0F4FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0E17),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: ThemeTogglePage(isDarkMode: _isDarkMode, onToggle: _toggleTheme),
    );
  }
}

// ─── Custom Toggle Switch Widget ────────────────────────────────────────────

class ThemeToggleSwitch extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  const ThemeToggleSwitch({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onToggle(!isDarkMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isDarkMode
              ? const LinearGradient(
                  colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [Color(0xFF74B9FF), Color(0xFFA29BFE)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? const Color(0xFF6C63FF).withOpacity(0.4)
                  : const Color(0xFF74B9FF).withOpacity(0.5),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Stars (dark mode) or Sun rays (light mode) in background
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isDarkMode ? 1.0 : 0.0,
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.star, color: Colors.white54, size: 10),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isDarkMode ? 0.0 : 1.0,
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.wb_sunny, color: Colors.white70, size: 14),
                ),
              ),
            ),
            // Sliding knob
            AnimatedAlign(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutBack,
              alignment: isDarkMode
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => RotationTransition(
                      turns: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                    child: Icon(
                      isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
                      key: ValueKey(isDarkMode),
                      size: 18,
                      color: isDarkMode
                          ? const Color(0xFF6C63FF)
                          : const Color(0xFFFDCB6E),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Demo Page ───────────────────────────────────────────────────────────────

class ThemeTogglePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  const ThemeTogglePage({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        decoration: BoxDecoration(
          gradient: isDark
              ? const LinearGradient(
                  colors: [Color(0xFF0F0E17), Color(0xFF1A1A2E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [Color(0xFFF0F4FF), Color(0xFFE8E0FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Icon(
                    isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                    key: ValueKey(isDark),
                    size: 80,
                    color: isDark
                        ? const Color(0xFFA29BFE)
                        : const Color(0xFFFDCB6E),
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 400),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : const Color(0xFF2D3436),
                    letterSpacing: 0.5,
                  ),
                  child: Text(isDark ? 'Dark Mode' : 'Light Mode'),
                ),
                const SizedBox(height: 8),

                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 400),
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white38 : const Color(0xFF636E72),
                    letterSpacing: 0.3,
                  ),
                  child: Text(
                    isDark
                        ? 'Easy on the eyes at night'
                        : 'Crisp and bright for daytime',
                  ),
                ),
                const SizedBox(height: 48),

                // Toggle Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 400),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: !isDark
                            ? const Color(0xFF6C63FF)
                            : Colors.white38,
                      ),
                      child: const Text('Light'),
                    ),
                    const SizedBox(width: 16),
                    ThemeToggleSwitch(
                      isDarkMode: isDarkMode,
                      onToggle: onToggle,
                    ),
                    const SizedBox(width: 16),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 400),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? const Color(0xFFA29BFE)
                            : Colors.black26,
                      ),
                      child: const Text('Dark'),
                    ),
                  ],
                ),
                const SizedBox(height: 60),

                // Preview Card
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E1E30) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? const Color(0xFF6C63FF).withOpacity(0.15)
                            : Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: isDark
                                ? const Color(0xFF6C63FF).withOpacity(0.3)
                                : const Color(0xFF6C63FF).withOpacity(0.1),
                            child: const Icon(
                              Icons.person,
                              color: Color(0xFF6C63FF),
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Flutter Dev',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: isDark
                                      ? Colors.white
                                      : const Color(0xFF2D3436),
                                ),
                              ),
                              Text(
                                'Theme Preview Card',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark
                                      ? Colors.white38
                                      : Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isDark
                              ? Colors.white10
                              : Colors.black.withOpacity(0.07),
                        ),
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: LinearGradient(
                                colors: isDark
                                    ? [
                                        const Color(0xFF6C63FF),
                                        const Color(0xFFA29BFE),
                                      ]
                                    : [
                                        const Color(0xFF74B9FF),
                                        const Color(0xFF6C63FF),
                                      ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Toggle the switch above to see the theme change!',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white38 : Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
