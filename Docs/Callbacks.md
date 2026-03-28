# Callbacks

[Home](../README.md)

---

`lerp_cm()` supports two optional callbacks -- one that fires when the interpolation completes, and one that fires at a specified point partway through.

## Completion Callback

The completion callback fires once, on the frame the interpolation finishes. Pass it as the seventh argument.

```gml
// Step event
x = lerp_cm(
    "move_x",
    1.5,
    x_start, x_target,
    crvLerp, "trans_cubic",
    function() { show_debug_message("move_x complete"); }
);
```

The callback is a function with no arguments. It fires before the store entry is removed, so the interpolation is still technically active when it runs.

A common use case is triggering the next animation or changing state once a lerp finishes:

```gml
x = lerp_cm(
    "enter_anim",
    0.5,
    -200, 0,
    crvLerp, "trans_cubic",
    function() { state = STATE.IDLE; }
);
```

## Exception Callback

The exception callback fires once when the interpolation reaches a specified percentage of its duration. It requires two additional arguments -- the percentage as a number between 0 and 100, and the function to call.

```gml
x = lerp_cm(
    "move_x",
    2.0,
    x_start, x_target,
    crvLerp, "trans_cubic",
    function() { show_debug_message("finished"); }, // completion
    50,                                              // exception percent
    function() { show_debug_message("halfway"); }   // exception callback
);
```

This fires the exception callback when the interpolation is 50% complete, and the completion callback when it finishes.

The exception callback only fires once. Once triggered it will not fire again for the same interpolation.

## Using Only the Exception Callback

If you want an exception callback but no completion callback, pass `undefined` for the completion callback. Continuum checks whether the argument is a method before calling it, so passing `undefined` is safe.

```gml
x = lerp_cm(
    "move_x",
    2.0,
    x_start, x_target,
    crvLerp, "trans_cubic",
    undefined,
    75,
    function() { show_debug_message("three quarters through"); }
);
```

## Callback Scope

Callbacks are methods, so they capture the scope of wherever they are defined. If you define a callback inline in a Step event, `self` inside the callback refers to the object the Step event belongs to. This means you can modify instance variables directly inside a callback without any extra work.

```gml
x = lerp_cm(
    "move_x",
    1.0,
    x_start, x_target,
    crvLerp, "trans_cubic",
    function() {
        active = false;  // refers to this object's active variable
        instance_destroy();
    }
);
```

---

[Next: API Reference](API-Reference.md)
