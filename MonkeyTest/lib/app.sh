#!/system/bin/sh

########## ��ʼ���� ##########

#����ȫ�ֱ����ͺ���
source /data/local/tmp/function.sh
#�ӽ��̼��10��ɸ��log
#check_log_error 10 &

########## ������� ##########


########## monkey�����߼� ##########

# ִ��ʵ����
# ��ʽ1 ִ��case.sh��д�õ�case��$1ʱ��?��; $2-������ţ�$3-��������
# monkey_test 60 0 "com.letv.app.appstore"
# monkey_timeout 60 
# ��ʽ2 ������ִ��moneky��䣺$1-ʱ��; $2-���Ʒ�Χ��$3-�¼�����; $4-monkey log�ļ���
# monkey_test 60 "-p com.letv.games" "--pct-touch 20 --pct-trackball 5 --pct-motion 35 --pct-flip 5 --pct-appswitch 30 --pct-anyevent 5" "letv_games"
# monkey_timeout 60 

echo "���Գ�������Сʱ��"
monkey_test 7200 0 "com.jhss.youguu"
##����am������activity�����1S�粻��ʾ����
longam "com.jhss.youguu" 7200 "com.jhss.youguu/.SplashActivity"
monkey_timeout 0

echo "�����������Сʱ��"
monkey_test 7200 0 "com.jhss.youguu"
##����am������activity�����1S�粻��ʾ����
longam "jhss.yhouguu.finance" 7200 "com.jhss.youguu/.ui.DesktopActivity"
monkey_timeout 0

########## monkey�߼����� ##########


########## ���Խ���ȷ���ӽ������˳� ##########
PID=`/system/bin/ps |grep $$|$bb awk -v pid=$$ '{if($2!=pid)print $2}'`
kill $PID
#ֹ֪ͨͣ���
echo "`date +%m-%d" "%H":"%M":"%S` stop monitor scripts." > /data/local/tmp/stop
