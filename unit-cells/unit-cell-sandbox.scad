r = 5; // sphere radius
sq = 1; // compression factor to allow for bonding
re = 1.05 * r; // expanded radius. Opposite of above to see if it makes code easier to read/write.
$fn=25;


simple_coords = [[1,1,-1],[1,1,1],[1,-1,-1],[1,-1,1],[-1,-1,1],[-1,-1,-1],[-1,1,-1],[-1,1,1]];
bcc_coords = [[1,1,-1],[1,1,1],[1,-1,-1],[1,-1,1],[-1,-1,1],[-1,-1,-1],[-1,1,-1],[-1,1,1],[0,0,0]];
fcc_coords = [[1,1,-1],[1,1,1],[1,-1,-1],[1,-1,1],[-1,-1,1],[-1,-1,-1],[-1,1,-1],[-1,1,1],[1,0,0],[-1,0,0],[0,1,0],[0,-1,0],[0,0,1],[0,0,-1]];
simple_l = 2;
bcc_l = 4/sqrt(3);
fcc_l = 2*sqrt(2);

// ONLY WORKS FOR CUBIC STRUCTURES
module unitcell(coord, l, uc = false, support=true) {
    intersection(){
        for (i = coord){
            translate(sq*l/2*r*i){
                sphere(r);
                rotate(180,[1,0,0])cylinder(d=support?1.8:0,h=sq*l*r,center=false);
            }
        }
        cube((uc?sq*l*r:sq*l*r+10*r)*[1,1,1],center=true);
    }
}
module pedestal(r,h){
    translate([0,0,1.51])cylinder(r = sqrt(2)*r/2, h=h);
    cylinder(r = r,h=1.5);
}


module hexlayer(r,n=6,support=true, support_l = 4*sqrt(2/3)){
    union(){
        sphere(re);
        rotate(180,[1,0,0])cylinder(d=support?1.8:0,h=support_l*r,center=false);
        for(i = [1:n]){
            rotate(60*(i-1),[0,0,1])
            translate([0,2*r,0]){
                sphere(re);
                rotate(180,[1,0,0])cylinder(d=support?1.8:0,h=support_l*r,center=false);}
        }
    }
}

*translate([-sqrt(3)*r/3,-r,2*sqrt(2/3)*r])hexlayer(r,1);
// HCP is still a work in progress
union(){
    union(){
        hexlayer(r,6);
    translate([r/1.75,-r,2*sqrt(2/3)*r])hexlayer(r,2);
    translate([0,0,4*sqrt(2/3)*r])hexlayer(r,6);
    }
color("red",0.5)
linear_extrude(4*sqrt(2/3)*r)
polygon([[0,0],[0,2*r],[sqrt(3)*r,r],[sqrt(3)*r,-r]]);
}



// fcc set REMOVE * from next line to make this set
*union(){
translate([0,0,-1.3])pedestal(fcc_l*r,0);
translate([0,0,sq*fcc_l*r/2+r])unitcell(fcc_coords,fcc_l,uc=false);
translate([30,0,sq*fcc_l*r/2+r])unitcell(fcc_coords,fcc_l,uc=true);
translate([30,0,-1.3])pedestal(fcc_l*r,fcc_l*r/4+1.3);
}

//bcc set REMOVE * from next line to make this set
*union(){
translate([0,30,-1.3])pedestal(bcc_l*r,0);
translate([0,30,sq*bcc_l*r/2+r])unitcell(bcc_coords,bcc_l,uc=false);
translate([30,30,sq*bcc_l*r/2+r])unitcell(bcc_coords,bcc_l,uc=true);
translate([30,30,-1.3])pedestal(bcc_l*r,bcc_l*r/4+2);
}

//simple set REMOVE * from next line to make this set
*union(){
translate([0,60,-1.3])pedestal(simple_l*r,0);
translate([0,60,sq*simple_l*r/2+r])unitcell(simple_coords,simple_l,uc=false);
translate([30,60,sq*simple_l*r/2+r])unitcell(simple_coords,simple_l,uc=true);
translate([30,60,-1.3])pedestal(simple_l*r,simple_l*r/4+2.3);
}



