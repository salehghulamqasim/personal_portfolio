# Responsive Screen Utility Documentation

## Overview

This Flutter web portfolio now includes a comprehensive responsive design system that adapts to different screen sizes using the `ScreenUtils` class and responsive widgets.

## Breakpoints

- **Mobile**: < 600px
- **Tablet**: 600px - 1024px  
- **Desktop**: > 1024px

## Core ScreenUtils Methods

### Device Detection
```dart
ScreenUtils.isMobile(context)    // Returns true for mobile screens
ScreenUtils.isTablet(context)    // Returns true for tablet screens
ScreenUtils.isDesktop(context)   // Returns true for desktop screens
```

### Responsive Sizing
```dart
ScreenUtils.widthPercent(context, 50)   // 50% of screen width
ScreenUtils.heightPercent(context, 30)  // 30% of screen height
```

### Responsive Values
```dart
ScreenUtils.responsiveFontSize(context,
  mobile: 14.0,
  tablet: 16.0,
  desktop: 18.0,
)

ScreenUtils.responsivePadding(context,
  mobile: EdgeInsets.all(16),
  tablet: EdgeInsets.all(20),
  desktop: EdgeInsets.all(24),
)

ScreenUtils.responsiveSpacing(context,
  mobile: 8.0,
  tablet: 12.0,
  desktop: 16.0,
)
```

### Layout Helpers
```dart
ScreenUtils.responsiveColumns(context,
  mobile: 1,
  tablet: 2,
  desktop: 3,
)

ScreenUtils.responsiveConstraints(context,
  mobileMaxWidth: double.infinity,
  tabletMaxWidth: 800,
  desktopMaxWidth: 1200,
)
```

## Applied Responsive Changes

### 1. CustomAppBar (`lib/components/app_bar.dart`)
- **Mobile**: Hides navigation buttons, shows hamburger menu icon
- **Tablet/Desktop**: Shows full navigation with responsive spacing
- **Font sizes**: 16px (mobile) → 17px (tablet) → 18px (desktop)
- **Padding**: Responsive horizontal padding based on screen size

### 2. ProjectCard (`lib/components/project_card.dart`)
- **Mobile**: Vertical stack layout (image above text)
- **Tablet/Desktop**: Horizontal layout with alternating sides
- **Constraints**: Uses responsive max-width constraints
- **Typography**: Responsive font sizes for title and description
- **Images**: AspectRatio-based sizing with responsive ratios

### 3. HeroSection (`lib/sections/hero_section.dart`)
- **Mobile**: Vertical stack with 40% height image
- **Tablet**: Side-by-side with 2:1 text-to-image ratio
- **Desktop**: Side-by-side with 1:1 ratio
- **Typography**: Large responsive font scaling (28px → 36px → 42px for main title)
- **Buttons**: Wrap layout for mobile overflow handling

### 4. Homescreen (`lib/pages/homescreen.dart`)
- **Container**: Responsive max-width constraints (100% mobile, 95% tablet, 1200px desktop)
- **Spacing**: Responsive vertical spacing between sections
- **Projects**: Dynamic layout using projects data array

## Additional Responsive Widgets

### ResponsiveLayout
Wrapper widget for consistent responsive containers:
```dart
ResponsiveLayout(
  child: YourContent(),
  mobileMaxWidth: double.infinity,
  desktopMaxWidth: 1200,
)
```

### ResponsiveGrid
Auto-responsive grid system:
```dart
ResponsiveGrid(
  mobileColumns: 1,
  tabletColumns: 2,
  desktopColumns: 3,
  children: [...],
)
```

### ResponsiveText
Automatically scaled text:
```dart
ResponsiveText(
  'Your text',
  mobileFontSize: 14,
  desktopFontSize: 18,
)
```

## Implementation Benefits

1. **Automatic Adaptation**: No manual breakpoint checking needed
2. **Consistent Spacing**: Unified spacing system across all screen sizes
3. **Optimized Layouts**: Mobile-first approach with progressive enhancement
4. **Maintainable**: Centralized responsive logic in ScreenUtils
5. **Flexible**: Easy to customize breakpoints and values per component

## Usage Guidelines

1. **Always use ScreenUtils methods** instead of hardcoded values
2. **Test on all breakpoints** using browser dev tools
3. **Use percentage-based widths** with `ScreenUtils.widthPercent()`
4. **Prefer Expanded/Flexible** over fixed dimensions
5. **Implement mobile-first** design patterns

## Browser Testing

Test responsive behavior at these common screen widths:
- **Mobile**: 320px, 375px, 414px
- **Tablet**: 768px, 834px, 1024px
- **Desktop**: 1280px, 1440px, 1920px

## Performance Considerations

- Uses `LayoutBuilder` and `MediaQuery` efficiently
- Minimal rebuilds on orientation changes
- Cached responsive calculations where possible
- SingleChildScrollView prevents overflow on all screen sizes