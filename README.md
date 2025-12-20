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
Step 1: Open the GameMaker project you'd like to import Continuum to.
Step 2: Click the `Tools` option in the toolbar at the top of the window.
Step 3: Click `Import Local Package` from the dropdown.
Step 4: Locate and choose `gm_continuum_VERSION.yymps`. 
Step 5: Click `Add All` in the GameMaker window that opens.
Step 6: Click `Import` at the bottom of the same window.

Once you've followed these steps, you will find everything you need in the `Continuum` folder located in the asset browser.


## Curves
The library includes a number of premade curves. This section lists them.
### Standard Methods
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
