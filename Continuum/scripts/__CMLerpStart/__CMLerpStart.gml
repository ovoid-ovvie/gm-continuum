/// @ignore
function __cm_lerp_start(name, max_time)
{
    if ( !__cm_lerp_exists(name) )
    {
        CM_STORE[$ name] =
        {
            time      : 0,
            duration  : max_time,
            triggered : false
        }
    }
}