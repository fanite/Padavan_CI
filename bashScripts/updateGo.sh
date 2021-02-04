#!/bin/bash
#rm -rf /opt/hostedtoolcache/go/1.14.14
#mv /opt/hostedtoolcache/go/1.15.7 /opt/hostedtoolcache/go/1.14.14
goCacheRootDir="/opt/hostedtoolcache/go"
goVersions="/opt/goVersions.txt"
:> $goVersions
chmod 777 $goVersions
dir=$(ls -l "$goCacheRootDir" | sed '{1!G;h;$!d}' | awk '/^d/ {print $NF}')
for i in $dir
do
echo $i
echo $i >> $goVersions
done
new_ver=`sed -n '1p' $goVersions`
old_ver=`sed -n '2p' $goVersions`
echo "rm -rf $goCacheRootDir/$old_ver"
rm -rf $goCacheRootDir/$old_ver
echo "mv $goCacheRootDir/$new_ver $goCacheRootDir/$old_ver"
mv $goCacheRootDir/$new_ver $goCacheRootDir/$old_ver
