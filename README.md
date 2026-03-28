# Continuum

Continuum is an interpolation API for GameMaker. It handles curve-driven lerping between two values, with support for completion callbacks and mid-interpolation exception callbacks, all through a single function call per step.

It is designed to be simple to use without sacrificing flexibility.

---

## Why Continuum?

GameMaker's built-in `lerp()` is stateless -- it takes a start, end, and factor, and returns a value. That's fine for simple cases, but managing the factor over time, knowing when the lerp is done, and triggering callbacks at specific points all require boilerplate you end up rewriting every project.

Continuum handles all of that. You call `lerp_cm()` every step, pass it a name and the values you want to interpolate between, and it manages the rest. When it finishes it cleans itself up and calls your completion function. You never touch a timer or a flag.

It also uses GameMaker animation curves rather than a hardcoded easing function, so the shape of every interpolation is as flexible as your curve editor allows.

---

## Feature Overview

- Curve-driven interpolation between two values
- Automatic state management -- no timers or flags needed
- Completion callback fired when the interpolation finishes
- Exception callback fired at a specified percentage through the interpolation
- Self-cleaning -- entries are removed from the store automatically on completion
- Configurable global store location
- Bundled animation curves covering common easing and pulse styles, ready to use out of the box

---

## Getting Started

See the [Setup](Docs/Setup.md) page to get Continuum integrated into your project.

---

## Documentation

- [Setup](Docs/Setup.md)
- [How It Works](Docs/How-It-Works.md)
- [Using lerp_cm](Docs/Using-lerp-cm.md)
- [Animation Curves](Docs/Animation-Curves.md)
- [Callbacks](Docs/Callbacks.md)
- [API Reference](Docs/API-Reference.md)
