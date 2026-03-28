# Animation Curves

[Home](../README.md)

---

Continuum uses GameMaker animation curves to shape interpolations rather than hardcoded easing functions. This means the feel of every lerp is entirely up to you.

## What Is an Animation Curve?

An animation curve is a GameMaker asset that defines how a value changes over a normalised time range from 0 to 1. A curve can have multiple named channels, each with its own shape.

Continuum evaluates the curve at the current progress through the interpolation (0 at the start, 1 at the end) and uses the result to scale between the start and end values.

## Bundled Curves

Continuum ships with two animation curves you can use immediately without creating anything yourself.

### crvLerp

A comprehensive set of easing channels covering the most common interpolation styles. Each of the seven core easing types comes in three variants -- ease in, ease out, and ease in-out.

| Channel pattern | Description |
|---|---|
| `trans_*_in` | Starts slow and accelerates |
| `trans_*_out` | Starts fast and decelerates |
| `trans_*_in_out` | Slow at both ends, faster through the middle |

The available easing types are `sine`, `quad`, `cubic`, `quart`, `quint`, `expo`, and `circ`, giving you 21 channels in total. The strength of the curve increases from sine (gentlest) through to expo and circ (most dramatic).

There are also a handful of additional channels for special cases:

| Channel | Description |
|---|---|
| `trans_linear` | Constant rate of change, no easing |
| `trans_elastic` | Spring-like overshoot and oscillation |
| `trans_bounce` | Oscillates with diminishing waves before settling at the end value |
| `trans_bounce_return` | Rises with oscillation, peaks, then returns back to the start value |
| `dip_back` | Dips below the start value before sweeping up past the end value and settling |
| `triple_pulse` | Rises to peak and falls back to start, three times |
| `triple_pulse_partial` | Same as `triple_pulse` but does not return fully reach the peak |
| `five_pulse` | Rises to peak and falls back to start, five times |
| `five_pulse_partial` | Same as `five_pulse` but does not return fully reach the peak |

```gml
x = lerp_cm("move_x", 1.5, 0, 100, crvLerp, "trans_cubic_in_out");
image_alpha = lerp_cm("fade", 0.3, 0, 1, crvLerp, "triple_pulse");
```

### crvLinearVariations

A set of linear interpolation channels that each start at a different percentage of the way through the duration. Useful when you want something to hold for a moment before moving.

| Channel | Description |
|---|---|
| `linear_10` | Starts moving at 10% through |
| `linear_20` | Starts moving at 20% through |
| `linear_25` | Starts moving at 25% through |
| `linear_33` | Starts moving at 33% through |
| `linear_50` | Starts moving at 50% through |
| `linear_66` | Starts moving at 66% through |
| `linear_75` | Starts moving at 75% through |
| `linear_80` | Starts moving at 80% through |
| `linear_90` | Starts moving at 90% through |

```gml
// Holds for half the duration then moves linearly to the target
x = lerp_cm("move_x", 2.0, 0, 100, crvLinearVariations, "linear_50");
```

## Creating Your Own Curves

In the GameMaker IDE, go to `Create > Animation Curve`. Give it a name and add at least one channel. The channel name is what you pass to `lerp_cm()`.

A simple ease-in-out curve would look like an S-shape from bottom-left to top-right. A bounce curve would overshoot the top and come back down. The shape is completely up to you.

## Passing a Curve to lerp_cm

```gml
x = lerp_cm("move_x", 1.5, 0, 100, acv_my_curve, "default");
```

The fifth argument is the animation curve asset and the sixth is the channel name as a string. The channel must exist on the curve or GameMaker will throw an error.

## Curve Shape and Output Range

Continuum maps the curve output directly to the interpolation range. A curve that goes from 0 to 1 produces a standard interpolation. A curve that overshoots above 1 will cause the value to exceed the end value before settling, useful for bouncy or springy effects. A curve that dips below 0 will cause the value to go below the start value.

This means you can achieve virtually any easing behaviour just by designing the curve, without any changes to your code.

## Reusing Curves

The same curve can be used for multiple simultaneous interpolations. Each `lerp_cm()` call evaluates the curve independently based on its own timer, so there is no conflict.

## Tips

- The bundled `crvLerp` and `crvLinearVariations` curves cover most common cases -- reach for them first before creating your own
- Use `trans_*_in_out` variants for most UI movement, `trans_*_out` for things that need to feel snappy, and `trans_*_in` for things building up momentum
- Overshoot curves like `dip_back` and `trans_elastic` work well for UI elements that need to feel responsive and physical
- The pulse channels are useful for effects that need to rise and fall, like a flash or a pulsing glow

---

[Next: Callbacks](Callbacks.md)
