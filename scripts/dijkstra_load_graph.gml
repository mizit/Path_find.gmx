///dijkstra_load_graph(filename);
//This function must be called from obj_dijkstra_general

var fid = file_text_open_read(argument0);
number_node = file_text_read_real(fid); 
file_text_readln(fid);
count = 0;
for (i = 0; i < (number_node); i+=1)    
{
    node_x[i] = file_text_read_real(fid);
    node_y[i] = file_text_read_real(fid);
    file_text_readln(fid);
    //Next two string can be deleted if you don't need my way of displaying.
    nd = instance_create(node_x[i], node_y[i], obj_dijkstra_node);
    nd.myid = i;
}
for (i = 0; i < number_node; i+=1)      
{
    for (j = 0; j < number_node; j+=1)
    {
        contact[i,j] = file_text_read_real(fid);
        if (contact[i,j] == -1)
        {
            contact[i,j] = I_AM_BIG;
        }
    }
    file_text_readln(fid);
}
file_text_close(fid);
