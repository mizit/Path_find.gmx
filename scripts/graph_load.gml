///graph_load(filename);
var file = file_text_open_read(argument0);
var nn = file_text_read_real(file);
var node_list = ds_list_create();
for (var i = 0; i < nn; i++)
{
    var nx, ny;
    nx = file_text_read_real(file);
    ny = file_text_read_real(file);
    ds_list_add(node_list, instance_create(nx, ny, obj_graph_node));
}
for (var i = 0; i < nn; i++)
{
    for (var j = 0; j < nn; j++)
    {
        var cn = file_text_read_real(file);
        if (cn == 1)
        {
            var tmp_connect = instance_create(node_list[| i].x, 
            node_list[| i].y, obj_graph_connect);
            tmp_connect.f_x = node_list[| j].x;
            tmp_connect.f_y = node_list[| j].y;
        }
    }
}
ds_list_destroy(node_list);
