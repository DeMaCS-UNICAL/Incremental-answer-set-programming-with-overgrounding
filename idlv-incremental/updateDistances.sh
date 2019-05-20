for entry in "./pacman/pacmanLog"/*
do
  sed -i "s/number(1..$1)./number(1..$2)./g" $entry  
done
