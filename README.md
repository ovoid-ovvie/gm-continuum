[Download Continuum](downloads/gm_continuum_v1_0_0.yymps)

Continuum is released under the MIT License. See [LICENSE.md](LICENSE.md) for details. In short, Continuum is free to use and modify, including commercially.

## Overview
Continuum is an interpolation library for GameMaker Studio 2.3 and later. It uses animation curves and custom-built functions to process interpolation with more options and less issues than the engine's inbuilt options.

## Description
GameMaker's interpolation features are very limited. You can only use linear interpolation and can never reach your target value without external interference.

Continuum fixes this by relying on animation curves and customisable timers which scale naturally with duration, requiring no speed configuration from the user. The library also uses functions to automatically process interpolation with minimal effort.

You can also set optional custom behaviour for when interpolation is complete as well as when it reaches a certain level of progress.

While Continuum supports any animation curve, it also comes with a curated pack of animation curves to get you started.

## Compatibility
Continuum requires **GameMaker Studio 2.3 or later**, as it relies on:
- Animation curve assets (`Asset.GMAnimCurve`)
- Structs and dynamic property access (`{}` and `$`)
- Default function arguments and first-class functions

## Installation
Step 1: Open the GameMaker project you'd like to import Continuum to.\
Step 2: Click the `Tools` option in the toolbar at the top of the window.\
Step 3: Click `Import Local Package` from the dropdown.\
Step 4: Locate and choose `gm_continuum_VERSION.yymps`. \
Step 5: Click `Add All` in the GameMaker window that opens.\
Step 6: Click `Import` at the bottom of the same window.

Once you've followed these steps, you will find everything you need in the `Continuum` folder located in the asset browser.

## Quickstart
To process an instance of interpolation, run `lerpAuto` in the desired object's code. You must call the function as part of setting a variable since it returns the interpolation result. For example:

```
result = lerpAuto(
  global.lerp,
  "menuFadeIn",
  1, 0, 1,
  crvLerp, "trans_sine"
)
```

This code would interpolate `0` to `1` over the course of one second.

It is recommended to rely on a boolean set to true once interpolation is complete to avoid infinite loops.

```
Create event:
fadeConsume = false

Step event:
if ( !fadeConsume ) {
  result = lerpAuto(
    global.lerp,
    "menuFadeIn",
    1, 0, 1,
    crvLerp, "trans_sine",
    function() {
      fadeConsume = true
    }
)
```

This code would also interpolate `0` to `1` over the course of one second, but it would only run once unless you set the consume back to false elsewhere.

If you wanted to trigger something once the interpolation reaches a certain level of progress:

```
result = lerpAuto(
  global.lerp,
  "menuFadeIn",
  1, 0, 1,
  crvLerp, "trans_sine",
  funcComplete,
  75,
  function() {
    // custom behaviour here
  }
)
```

This code would process interpolation as usual, but run custom behaviour when reaching 75% of its duration. Continuum automatically ensures this custom behaviour will only be triggered once per lerp.\
Replace `funcComplete` with a function if you want custom behaviour in completion or `undefined` if you only want custom behaviour partway through interpolation.

## Reference
This section contains documentation on each of the aspects of Continuum. Note that only `lerpAuto` is required to use the library, and all other aspects are in support of it.
### global.lerp
This struct is the default library for storing interpolation entries. This struct can be modified or removed as desired, but some kind of struct is required to use Continuum.
### continuumGetGameSpeed() / G_FPS
These act as a method of checking the game's current speed. Used in `lerpAuto` to convert duration in seconds to duration in frames.
### continuumDecimal()
Converts a percentage into a decimal and clamps it between 0 and 100. Used in `lerpAuto` to convert the percentage used in custom behaviour into a value compatible with the system.
### lerpStart()
Initialises an interpolation entry.
#### Parameter 1: struct
The struct to store the entry in.
#### Parameter 2: name
The name of the entry as a string.
#### Parameter 3: maxTime
The entry's duration in frames.
### lerpExists()
Checks whether or not an interpolation entry already exists.
#### Parameter 1: struct
The struct to check.
#### Parameter 2: name
The name of the entry to check as a string.
### lerpProcess()
Evaluates an animation curve and returns an interpolated value.
#### Parameter 1: a
Must be the start value.
#### Parameter 2: b
Must be the end value.
#### Parameter 3: t
Must be the entry's `time` divided by its `duration`.
#### Parameter 4: curve
Target animation curve.
#### Parameter 5: channel
Target channel within the animation curve.
### lerpAuto()
Automatically processes interpolation from start to finish and optionally runs custom behaviour on completion and/or at a certain level of progress.



## Curves
The library includes a number of premade curves. This section lists them.
### Standard Methods
These methods are established interpolation types within game development.
- linear
- sine
- quint
- quad
- quint
- expo
- elastic
- cubic
- circ
- back
- bounce
- back
### Custom Methods
These methods are not established like the standard methods, but are helpful nonetheless.
- bounce return
- tri pulse
- tri pulse partial
- quint pulse
- quint pulse partial
- ease out
### Linear Variations
These curves only begin interpolating once reaching a certian percentage of the total duration.
- delayed (10%)
- delayed (20%)
- delayed (25%)
- delayed (33%)
- delayed (50%)
- delayed (66%)
- delayed (75%)
- delayed (80%)
- delayed (90%)
