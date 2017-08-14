///dijkstra_path_find2(start_pos, finish_pos);
//This function must be called from obj_dijkstra_general
//It returns standart GM path.
start_node = argument0;
finish_node = argument1;
for (i = 0; i < number_node; i+=1)
{
    D[i] = I_AM_BIG;
    ipath[i] = ds_list_create();
    test[i] = true;
}
D[start_node] = 0;

while (test[finish_node])
{
    grand = I_AM_BIG;
    now_node = -1;
    for (i = 0; i < number_node; i+=1)
    {                                           
        if (test[i])
        {
            if (D[i] < grand)
            {
                grand = D[i];
                now_node = i;
            }
        }
    }
    for (i = 0; i < number_node; i+=1)  
    {
        if (contact[now_node, i] + D[now_node] < D[i])
        {
        
            ds_list_copy(ipath[i], ipath[now_node]);
            ds_list_add(ipath[i], i);
            //ds_queue_copy(ipath[i], ipath[now_node]);
            //ds_queue_enqueue(ipath[i], i);
            
            D[i] = contact[now_node, i] + D[now_node];
        }
    }
    //a = instance_nearest(node_x[now_node], node_y[now_node], obj_dijkstra_node);
    test[now_node] = false;
    /*with (a)
    {
        sprite_index = s_cross;
    }*/
} 
finish_path = path_add();
path_add_point(finish_path, node_x[start_node], node_y[start_node], 100);

while (ds_list_size(ipath[finish_node]) > 0)
{
    node_add = ds_list_find_value(ipath[finish_node], 0);
    //node_add = ds_list_find_value(ipath[finish_node], ds_list_size(ipath[finish_node] - 2));
    //show_message(node_add);
    ds_list_delete(ipath[finish_node], 0);
    //ds_list_delete(ipath[finish_node], ds_list_size(ipath[finish_node] - 2));
    path_add_point(finish_path, node_x[node_add], node_y[node_add], 100);
}
   
for (i = 0; i < number_node; i+=1)
{
    ds_list_destroy(ipath[i]);
}
return finish_path;
