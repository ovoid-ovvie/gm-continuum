/// @desc This function interpolates between two values according to an animation curve, with options for functions partway through and on completion.
/// @param {String} name The name of the interpolation process, to be stored in the global struct.
/// @param {Real} dur The duration of the interpolation process in seconds.
/// @param {Real} start The starting value (i.e. lower bound) of the interpolation process.
/// @param {Real} finish The ending value (i.e. upper bound) of the interpolation process.
/// @param {Asset.GMAnimCurve} curve The animation curve to use for interpolation.
/// @param {String} channel The name of the animation curve channel to use for interpolation.
/// @param {Function} [complete_func] A function to call upon completion of the interpolation process.
/// @param {Real} [exception_percent] A number between 0 and 100 representing a portion of the way through the interpolation process. Used in deciding when to call `exception_func`.
/// @param {Function} [exception_func] A function to call upon partial completion of the interpolation process, as specified by `exception_percent`.
/// @returns {Real}
function lerp_cm
(
    name,
    dur, start, finish,
    curve, channel,
    complete_func = undefined,
    exception_percent = 100,
    exception_func = undefined
)
{
	complete_func ??= __cm_noop;
	exception_func ??= __cm_noop;
	
    if ( !__cm_lerp_exists(name) )
    {
        __cm_lerp_start(name, dur * game_get_speed(gamespeed_fps));
    }
    else
    {
        var a = CM_STORE[$ name];
        var t = a.time / a.duration;
        
        var result = __cm_lerp_process(
            start,
            finish,
            t,
            curve,
            channel
        );
        
        a.time++;
        if ( a.time > a.duration )
        {
            complete_func();
            variable_struct_remove(CM_STORE, name);
        }
        else if ( !a.triggered )
        {
            var exception_time = a.duration * __cm_decimal(exception_percent);
            if ( a.time >= exception_time )
            {
                exception_func();
                a.triggered = true;
            }
        }
        
        return result;
    }

    return start;
}