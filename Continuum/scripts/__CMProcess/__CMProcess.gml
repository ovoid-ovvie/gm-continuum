/// @ignore
function __cm_lerp_process(a, b, t, curve, channel)
{
    t = clamp(t, 0, 1);
    var ch = animcurve_get_channel(curve, channel);
    var c = animcurve_channel_evaluate(ch, t);
    return ( a + (b - a) * c );
}