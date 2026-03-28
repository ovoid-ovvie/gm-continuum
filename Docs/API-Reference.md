# API Reference

[Home](../README.md)

---

Continuum has one public function. Internal functions are prefixed with `__cm_` and are not intended to be called directly.

---

## [lerp_cm(name, dur, start, finish, curve, channel, [complete_func], [exception_percent], [exception_func])](../Continuum/__CMLerp/__CMLerp.gml)

Interpolates between two values over a given duration, shaped by an animation curve. Must be called every step to drive the interpolation.

| Parameter | Type | Description |
|---|---|---|
| name | String | Unique name for this interpolation. Used to track it in the store |
| dur | Real | Duration in seconds |
| start | Real | Starting value |
| finish | Real | Ending value |
| curve | Asset.GMAnimCurve | Animation curve to use for shaping the interpolation |
| channel | String | Name of the channel on the animation curve to use |
| complete_func | Function | Optional. Called once when the interpolation completes |
| exception_percent | Real | Optional. A number between 0 and 100 representing how far through the interpolation the exception callback should fire |
| exception_func | Function | Optional. Called once when the interpolation reaches `exception_percent` |

**Returns:** Real

```gml
// Basic usage
x = lerp_cm("move_x", 1.5, 0, 100, crvLerp, "trans_cubic");

// With completion callback
x = lerp_cm("move_x", 1.5, 0, 100, crvLerp, "trans_cubic",
    function() { state = STATE.IDLE; }
);

// With both callbacks
x = lerp_cm("move_x", 2.0, 0, 100, crvLerp, "trans_cubic",
    function() { state = STATE.IDLE; },
    50,
    function() { show_debug_message("halfway"); }
);
```

On the first call with a given name, the entry is created in the store and the start value is returned. On subsequent calls the interpolated value is returned and the timer advances. When the timer exceeds the duration, the completion callback fires, the entry is removed from the store, and the interpolation is finished.

See [How It Works](How-It-Works.md) and [Using lerp_cm](Using-lerp-cm.md) for full usage details.

---

## Configuration

### [CMConfig](../Continuum/CMConfig/CMConfig.gml)

```gml
#macro CM_STORE global.lerp

CM_STORE = {};
```

`CM_STORE` defines where Continuum stores its interpolation data. Change the variable name if it conflicts with something in your project. It must remain a global variable.

---

## Store Structure

Each active interpolation is stored as an entry in `CM_STORE` keyed by the name passed to `lerp_cm()`. Entries are managed entirely by Continuum and should not be modified directly.

```gml
CM_STORE[$ "move_x"] = {
    time      : 0,      // current frame
    duration  : 90,     // total frames
    triggered : false   // whether the exception callback has fired
}
```

Entries are removed automatically when the interpolation completes.

---

## Internal Functions

These are not intended to be called directly.

| Function | Script | Description |
|---|---|---|
| `__cm_lerp_exists(name)` | [__CMLerpExists](../Continuum/__CMLerpExists/__CMLerpExists.gml) | Checks if an interpolation entry exists in the store |
| `__cm_lerp_start(name, max_time)` | [__CMLerpStart](../Continuum/__CMLerpStart/__CMLerpStart.gml) | Creates a new interpolation entry in the store |
| `__cm_lerp_process(a, b, t, curve, channel)` | [__CMProcess](../Continuum/__CMProcess/__CMProcess.gml) | Evaluates the curve and returns the interpolated value |
| `__cm_decimal(value)` | [__CMDecimal](../Continuum/__CMDecimal/__CMDecimal.gml) | Converts a 0-100 percentage to a 0-1 decimal |
| `__cm_noop()` | [__CMNoOp](../Continuum/__CMNoOp/__CMNoOp.gml) | Empty function used as a default callback placeholder |
