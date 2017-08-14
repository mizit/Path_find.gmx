///graph_save(filename);
var fileid;
fileid = file_text_open_write(argument0);
nn = instance_number(obj_graph_node);
file_text_write_real(fileid, nn); //Save number of nodes
file_text_writeln(fileid);
var node_list;
var i;
i = 0;

with (obj_graph_node)                   //Save coordinates of nodes
{
    node_list[i] = id;
    file_text_write_real(fileid, x);    
    file_text_write_real(fileid, y);
    file_text_writeln(fileid);
    i+=1;
} 

for (i = 0; i < nn; i+=1)         //Creating adjacency matrix
{
    var myx, myy, otx, oty, iex;
    myx = node_list[i].x;         
    myy = node_list[i].y;
    iex = false;
    for (j = 0; j < nn; j+=1)
    {
        otx = node_list[j].x;     
        oty = node_list[j].y;
        with (obj_graph_connect)        //Check if a connection exists
        {
            if (((s_x == myx) && (s_y == myy) && (f_x == otx) && (f_y == oty)) || 
            ((f_x == myx) && (f_y == myy) && (s_x == otx) && (s_y == oty)))
            {
                iex = true;
            }
        }
        if (iex)
        {
            iex = false;
            matrix [i, j] = " " + string(1) + " ";
        }
        else
        {
            matrix [i, j] = string(-1) + " ";
        }
    }
}

for (i = 0; i < nn; i+=1)       //Save adjacency matrix
{
    file_text_write_string(fileid, " ");
    for (j = 0; j < nn; j+=1)
    {
        file_text_write_string(fileid, matrix[i,j]);
    }
    file_text_writeln(fileid); 
}
file_text_close(fileid);
