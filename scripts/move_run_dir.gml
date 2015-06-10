if (key_arrows_check() == true)
{
    var x_pos = x, y_pos = y;
    
    if keyboard_check(vk_left)
    {
        x_pos -= move_distance;
    }
    else if keyboard_check(vk_right)
    {
        x_pos += move_distance;
    }
    if keyboard_check(vk_up)
    {
        y_pos -= move_distance;
    }
    else if keyboard_check(vk_down)
    {
        y_pos += move_distance;
    }
    
    move_timer_start(move_timer_max, move_timer_mult);
    
    if move_timer_mult > 1
    {
        move_timer_mult -= 1;
    }
    
    var cell_next = move_collision(x_pos, y_pos);
    var cant_move = cell_next.solid;
    
    if (cant_move == false)
    {
        if step_count < 5
        {
            step_count += 1;
        }
        audio_sound_pitch(sndBloop, step_count);
        audio_play_sound(sndBloop, 1, false);
    }
    else
    {
        if (step_count > 4)
        {
            var cell_hit = oGame.map_update[x_pos, y_pos]
            oGame.map[x_pos, y_pos] = instance_create(x_pos, y_pos, cell_hit.dead);
            oGame.map_update[x_pos, y_pos] = oGame.map[x_pos, y_pos]; // TODO: this code makes the game crash when you kill yourself for some reason?
            audio_play_sound(cell_hit.dead_sound, 1, false);
            with (cell_hit)
            {
                instance_destroy();
            }
        }
        move_stop_wall(step_count+1);   // + 1i s minor hack to stop running into adjacent walls constantly
    }
}
else
{
    move_stop();
}
