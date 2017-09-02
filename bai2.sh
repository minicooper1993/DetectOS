#!/bin/bash

# Nhap vao cac thong so

echo "Nhap va dia chi ip can check"

read diachi;

echo "Nhap vao subnet mark"

read subnet;

# Tinh cac host tu subnet mark vua nhap

o1=$(echo $diachi | cut -d '.' -f 1);
o2=$(echo $diachi | cut -d '.' -f 2);
o3=$(echo $diachi | cut -d '.' -f 3);
o4=$(echo $diachi | cut -d '.' -f 4);
sohost=$(echo "2^(32-$subnet)"|bc);
a=0;

while [ $a -lt $sohost ]
do
echo "$o1.$o2.$o3.$o4";
o4=$(echo "$o4+1"|bc);
if [ $o4 -eq 255 ]; then
  o4=0;
  o3=$(echo "$o3+1"|bc);
  elif [ $o3 -eq 255 ]; then
     o3=0;
     o2=$(echo "$o2+1"|bc);
     elif [ $o2 -eq 255 ]; then
       o2=0;
#       let o1=o1+1;
       o1=$(echo "$o1+1"|bc);
fi

let a+=1;

done > host.txt

# Kiem tra cac host xem con song khong

cat host.txt | while read ip
do
ping -W 1 -c 1 $ip > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "$ip";
fi

done > hostsong.txt

# Kiem tra port de xem host do dang su dung OS nao

while read ip;
do
 nc -zv $ip 22 > /dev/null 2>&1
 if [ $? -eq 0 ]; then
    echo "Host $ip is linux"
 else
    nc -zv $ip 3389 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
       echo "Host $ip is windows"
    else
       echo "Host $ip is unknown"
    fi
 fi
done < hostsong.txt

