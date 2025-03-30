//(c) Inne Lemstra 21-10-2024
//GNU GENERAL PUBLIC LICENSE
//Version 3, 29 June 2007

//Code at:
//https://github.com/Inne-Lemstra/flags_on_fabric
//Project description:
//https://hackaday.io/project/202753-flags-on-fabric


dim_flag = [140,150];

dim_end_cap = [10,4];

num_layers = 6;
layer_heigth = 0.2;
heigth = num_layers * layer_heigth;

#flag(dim_flag);
linear_extrude(0.2)
flag_fiducials();
linear_extrude(heigth){
    example1();
    //example2();
    end_cap();
    
}


module flag(flag = dim_flag){
    polygon([[0,0],[-0.5*flag.x,flag.y],[0.5*flag.x,flag.y]]);
}

module end_cap(){
    offset(0)
    difference(){
        flag(dim_flag);
        translate([-0.5 * dim_flag.x,dim_end_cap.x,0])
        square([dim_flag.x, dim_flag.y]);
        translate([0,dim_end_cap.y,0])
        flag([dim_flag.x - dim_end_cap.y, dim_flag.y - dim_end_cap.y]);
    }
}




module flag_fiducials(){
    
difference(){
    offset(2.8)flag(dim_flag);
    offset(1)flag(dim_flag);
    translate([-dim_flag.x,4,0])
    square([dim_flag.x * 2, dim_flag.y - 8]);
    translate([-0.5* (dim_flag.x - 8),25,0])
    square([dim_flag.x - 8, dim_flag.y * dim_flag.y]);
}
}

module example1(){
    translate([-60 / 2,dim_flag.y / 2 -5,0])
    import("./pics/open_hardware.svg", 4); //w60, h40
}

module example2(){
    translate([-60 / 2,dim_flag.y / 2 -5,0])
    import("./pics/Hackaday.svg", 3); //w60, h40
}




