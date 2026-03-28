# Using lerp_cm

[Home](../README.md)

---

`lerp_cm()` is the only function you need to call directly. Everything else in Continuum is internal.

## Basic Usage

The minimum required arguments are a name, a duration, a start value, an end value, a curve, and a channel name.

```gml
// Step event
x = lerp_cm("move_x", 1.5, 0, 100, crvLerp, "trans_cubic_in_out");
```

This interpolates `x` from `0` to `100` over 1.5 seconds, shaped by the `"trans_cubic_in_out"` channel of the bundled `crvLerp` curve. See [Animation Curves](Animation-Curves.md) for the full list of bundled channels and how to create your own.

The name `"move_x"` is how Continuum tracks this interpolation in the store. It can be any string you like, as long as it is unique among active interpolations on the same object.

## Where to Call It

`lerp_cm()` must be called in a **Step event**. It needs to run every frame to advance the timer and return the correct interpolated value.

```gml
// Create event -- store starting position
x_start = x;
x_target = 500;

// Step event -- drive the interpolation
x = lerp_cm("move_x", 2.0, x_start, x_target, crvLerp, "trans_cubic_in_out");
```

## The First Frame

On the first call, `lerp_cm()` creates the store entry and returns the start value. This means the object stays at its starting position for one frame before the interpolation begins moving. In practice this is imperceptible, but it is worth knowing.

## Multiple Interpolations

Each interpolation needs a unique name. You can run as many simultaneously as you need.

```gml
// Step event
x            = lerp_cm("move_x",  1.0, x_start, x_target, crvLerp, "trans_cubic_in_out");
y            = lerp_cm("move_y",  1.5, y_start, y_target, crvLerp, "trans_cubic_in_out");
image_alpha  = lerp_cm("fade_in", 0.5, 0, 1,               crvLerp, "trans_sine_in_out");
```

Each one tracks its own timer and completes independently.

## Stopping Early

If you stop calling `lerp_cm()` before it completes, the entry remains in the store but never advances. If you want to cancel an interpolation cleanly, remove it from the store manually:

```gml
variable_struct_remove(CM_STORE, "move_x");
```

## Restarting

Once an interpolation completes it removes itself from the store. Calling `lerp_cm()` again with the same name starts a fresh interpolation from scratch. If you want to restart before completion, remove the entry first and then call `lerp_cm()` again.

## With Callbacks

See [Callbacks](Callbacks.md) for how to fire functions on completion or at a specific point through the interpolation.

---

[Next: Animation Curves](Animation-Curves.md)
