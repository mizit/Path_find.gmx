///dijkstra_set_start_data();
//This function must be called from obj_dijkstra_general

for (i = 0; i < number_node; i+=1) 
{
    D[i] = I_AM_BIG;
    for (j = 0; j < number_node; j+=1)
    {
        if ((contact[i,j] > 0) && (contact[i,j] < I_AM_BIG))
        contact[i, j] = sqrt(sqr(node_x[i] - node_x[j]) + sqr(node_y[i] - node_y[j]));
    }
}
