//function chooses a type of movement from input, then executes collision and relocation of instance
//argument0 = the type of movement
//argument1 = object to move towards, if applicable (if not, just put -1 or something)
//TODO make this function take a variable amount of variables, so you only put a 2nd variable in when you are chasing an object
// TODO: make each move_type set a temp var to

if (move_timer == false)
{
    switch(argument0)
    {
        case 0: // keyboard controls
            move_key();
            break;
        case 1: // random movement
            move_rand();
            break;
        case 2: // move towards object
            move_dir_object(argument1);
            break;
        case 3:
            move_direction();
        default:
            break;
    }
}
else
{
    stopped_wall = false;
    var timer_on = move_timer_inc();
    if (timer_on == false)
    {
        move_timer = false;
        move_timer_count = 0;
        move_timer_total_init = 0;
        move_stopped();
    }
}
