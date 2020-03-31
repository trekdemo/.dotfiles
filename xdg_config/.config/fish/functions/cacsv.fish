function cacsv
  perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$argv" | column -t -s, | less  -F -S -X -K
end
