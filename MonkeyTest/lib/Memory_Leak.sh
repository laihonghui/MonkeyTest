#!/system/bin/sh

########## ��ʼ���� ##########

#����ȫ�ֱ����ͺ���
source /data/local/tmp/function.sh
#�ӽ��̼��10��ɸ��log
check_log_error 10 &

########## ������� ##########


########## monkey�����߼� ##########

# ִ��ʵ����
# ��ʽ1 ִ��case.sh��д�õ�case��$1ʱ��?��; $2-������ţ�$3-��������
# monkey_test 60 0 "com.letv.app.appstore"
# monkey_timeout 60 
# ��ʽ2 ������ִ��moneky��䣺$1-ʱ��; $2-���Ʒ�Χ��$3-�¼�����; $4-monkey log�ļ���
# monkey_test 60 "-p com.letv.games" "--pct-touch 20 --pct-trackball 5 --pct-motion 35 --pct-flip 5 --pct-appswitch 30 --pct-anyevent 5" "letv_games"
# monkey_timeout 60 

#ϵͳ���� Memory Leak
#��Ʋ��� 2Сʱ��
monkey_test 7200 0 "jhss.youguu.finance"
monkey_timeout 7200
#���ɲ���2Сʱ��
monkey_test 7200 0 "com.jhss.youguu"
monkey_timeout 7200
#store���Ժ󣬻����Ѱ�װһЩapp�����¼������Ը��ص�app��1Сʱ
#monkey_test 3600 0 "com.letv.games"
#monkey_timeout 3600
#monkey_test 3600 0 "com.android.launcher3"
#monkey_timeout 3600
#monkey_test 3600 0 "com.letv.android.quicksearchbox"
##��������ҳ����Ӧ�����޸�Ϊ�����������������ʾ���������򳤰�����
#longpress 3 "com.letv.android.quicksearchbox" 3600
#Monkey���Ժ�����10����
monkey_timeout 0
monkey_test 3600 0 "com.jhss.youguu"
##���������ؼ���Ӧ�����޸�Ϊ�������������ʾ�����򳤰�����
#longpress 4 "com.letv.android.voiceassistant" 3600
#Monkey���Ժ�����10����
monkey_timeout 0
monkey_test 3600 0 "jhss.youguu.finance"
monkey_timeout 3600
monkey_test 3600 0 "com.jhss.youguu"
monkey_timeout 3600
monkey_test 3600 0 "jhss.youguu.finance"
##����am������activity�����1S�粻��ʾ�������ڡ�dumpsys activity ��������ȡ��������activity����
#longam "com.letv.lesophoneclient" 3600 "com.letv.lesophoneclient/.ui.MainActivity"
#monkey_timeout 0
#monkey_test 3600 0 "com.android.music"
#monkey_timeout 3600
#monkey_test 3600 0 "com.lesports.glivesports"
#monkey_timeout 3600
#onkey_test 3600 0 "com.letv.android.wallpaperonline"
#monkey_timeout 3600
#monkey_test 3600 0 "com.letv.letvshop"
#monkey_timeout 3600
#monkey_test 3600 0 "com.letv.bbs"
#monkey_timeout 3600
#monkey_test 3600 0 "com.android.gallery3d"
#monkey_timeout 3600
#monkey_test 3600 0 "com.android.browser"
#monkey_timeout 3600
#monkey_test 3600 0 "com.letv.android.filemanager"
#monkey_timeout 3600
#monkey_test 3600 0 "com.android.calendar"
#onkey_timeout 3600
#monkey_test 3600 0 "sina.mobile.tianqitongletv"
#monkey_timeout 3600
#monkey_test 3600 0 "com.letv.android.note"
#monkey_timeout 3600
#monkey_test 3600 0 "com.android.deskclock"
#monkey_timeout 3600
#monkey_test 3600 0 "com.baidu.BaiduMap"
#monkey_timeout 3600
##�л��ٶ����뷨
#ime disable com.sohu.inputmethod.sogou.leshi/.SogouIME
#ime enable com.baidu.input_letv/.ImeService
##ǿ��app���л�����70%��5Сʱ
All_package="com.android.launcher3|com.letv.android.quicksearchbox|com.letv.android.voiceassistant|com.letv.lesophoneclient|com.letv.android.client|com.letv.android.letvlive|com.letv.games|com.android.music|com.lesports.glivesports|com.letv.android.wallpaperonline|com.letv.letvshop|com.letv.bbs|com.android.gallery3d|com.android.browser|com.letv.android.filemanager|com.android.calendar|sina.mobile.tianqitongletv|com.letv.android.note|com.android.deskclock|com.baidu.BaiduMap"
monkey_test 18000 1 "$All_package"
#������ҳ����Ӧ�����������������ؼ���Ӧ���������10�룬����5Сʱ�����滽��
#longkey "com.letv.android.quicksearchbox" "com.letv.android.voiceassistant" 10 18000
monkey_timeout 0

########## monkey�߼����� ##########


########## ���Խ���ȷ���ӽ������˳� ##########
PID=`/system/bin/ps |grep $$|$bb awk -v pid=$$ '{if($2!=pid)print $2}'`
kill $PID
#ֹ֪ͨͣ���
echo "`date +%m-%d" "%H":"%M":"%S` stop monitor scripts." > /data/local/tmp/stop
