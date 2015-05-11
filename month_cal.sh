cal_head=`cal | head -1`; cal_tail=`cal | tail -7`; today=`date "+%e"`; echo "$cal_head"; echo "${cal_tail/${today}/\033[1;33m${today}\033[0m}";
