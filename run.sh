#!/bin/bash

while [ 1 ]
do
		echo `date` > result.txt
		echo " " >> result.txt
		echo PR-POSITIVE
		while [ 1 ] 
		do 
			phantomjs getPoints.js http://www.sports.ru/fantasy/football/team/1553274.html pr-positive > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			MUN=`grep -c "gstatic.com"  ./temp.txt`
			if [[ ${NUM} -ne 0 || ${MUN} -ne 0 ]]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt
		
		echo YMAT
		while [ 1 ] 
		do 
			phantomjs getPoints.js http://www.sports.ru/fantasy/football/team/1557043.html ymat > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			MUN=`grep -c "gstatic.com"  ./temp.txt`
			if [[ ${NUM} -ne 0 || ${MUN} -ne 0 ]]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt
		
		echo XHEO
		while [ 1 ] 
		do 
			phantomjs getPoints.js http://www.sports.ru/fantasy/football/team/1559624.html xheo > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			MUN=`grep -c "gstatic.com"  ./temp.txt`
			if [[ ${NUM} -ne 0 || ${MUN} -ne 0 ]]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt

		echo BUSOTIR
		while [ 1 ] 
		do 
			phantomjs getPoints.js http://www.sports.ru/fantasy/football/team/1558719.html busotir > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			MUN=`grep -c "gstatic.com"  ./temp.txt`
			if [[ ${NUM} -ne 0 || ${MUN} -ne 0 ]]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt

		echo CRON314
		while [ 1 ] 
		do 
			phantomjs getPoints.js http://www.sports.ru/fantasy/football/team/1562633.html cron314 > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			MUN=`grep -c "gstatic.com"  ./temp.txt`
			if [[ ${NUM} -ne 0 || ${MUN} -ne 0 ]]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt

		echo MILANA
		while [ 1 ] 
		do 
			phantomjs getPoints.js http://www.sports.ru/fantasy/football/team/1557039.html PrincipessaMilana > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			MUN=`grep -c "gstatic.com"  ./temp.txt`
			if [[ ${NUM} -ne 0 || ${MUN} -ne 0 ]]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt

		find -type f -name result.txt -exec sed -i -r 's/Фелипе\ Ан\.\.\./Фелипе\ Андерсон/g' {} \;
		find -type f -name result.txt -exec sed -i -r 's/Бонавенту\.\.\./Бонавентура/g' {} \;
		find -type f -name result.txt -exec sed -i -r 's/А\.\ Масьел\.\.\./А\.\ Масьелло/g' {} \;

		git add result.txt
		git commit -m "Again and again..."
		git push -u origin master
done
