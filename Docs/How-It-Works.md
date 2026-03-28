# How It Works

[Home](../README.md)

---

Understanding how Continuum manages interpolation state makes it much easier to use correctly.

## The Store

Continuum keeps all active interpolations in a single global struct, `CM_STORE` (which defaults to `global.lerp`). Each interpolation is stored as an entry in that struct, identified by a name you provide.

An entry looks like this internally:

```gml
{
    time      : 0,       // current frame count
    duration  : 60,      // total frames to run
    triggered : false    // whether the exception callback has fired
}
```

You never interact with this struct directly. Continuum manages it entirely.

## The Step Loop

Continuum is designed to be called every step. The first time `lerp_cm()` is called with a given name, it creates an entry in the store and returns the starting value. From the second call onwards it processes the interpolation, advances the timer, and returns the interpolated value for that frame.

This means `lerp_cm()` belongs in a Step event, not a Create event. A typical usage looks like this:

```gml
// Step event
x = lerp_cm("move_x", 1.5, x_start, x_target, crvLerp, "trans_cubic_in_out");
```

Every step, `lerp_cm()` checks whether `"move_x"` exists in the store. If it does, it calculates the interpolated value based on how far through the duration the timer is, advances the timer by one frame, and returns the result. If the timer exceeds the duration, it fires the completion callback, removes the entry from the store, and the interpolation is finished.

## Self-Cleaning

When an interpolation completes, its entry is automatically removed from `CM_STORE`. This means you do not need to manually clean up after a lerp finishes. The next time `lerp_cm()` is called with the same name, it will start a fresh interpolation from scratch.

This also means that if you want to restart an interpolation, you just stop calling `lerp_cm()` for one step and call it again. Since the entry was cleaned up on completion, the next call creates a new one.

## Time and Duration

Duration is specified in seconds. Continuum converts this to frames internally using `game_get_speed(gamespeed_fps)`, so it is framerate-aware. A duration of `1.5` will always take 1.5 seconds regardless of whether the game runs at 30, 60, or any other frame rate.

## The Interpolation Curve

Rather than a linear or hardcoded easing function, Continuum uses GameMaker animation curves to shape the interpolation. This gives you complete control over the feel of every lerp. See [Animation Curves](Animation-Curves.md) for details.

---

[Next: Using lerp_cm](Using-lerp-cm.md)
