export FIND='fkg.iust.ac.ir'
export REPLACE='farsbase.net'
ruby -p -i -e "gsub(ENV['FIND'], ENV['REPLACE'])" recom.sql
