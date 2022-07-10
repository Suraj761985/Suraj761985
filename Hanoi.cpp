//tower of hanoi using recursion

#include <iostream>
using namespace std;

void TOH(int d, char T1, char T2, char T3)
{
if(d==1)
{
cout<<"\nShift top disk from tower"<<T1<<" to tower"<<T2;
return;
}
TOH(d-1,T1,T3,T2);
cout<<"\nShift top disk from tower"<<T1<<" to tower"<<T2;
TOH(d-1,T3,T2,T1);
}
int main()
{
int disk;
cout<<"Enter the number of disks:"; cin>>disk;
if(disk<1)
cout<<"There are no disks to shift";
else
cout<<"There are "<<disk<<"disks in tower 1\n";
TOH(disk, '1','2','3');
cout<<"\n\n"<<disk<<"disks in tower 1 are shifted to tower 2";

return 0;
}
