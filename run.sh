#!/bin/bash

while [ 1 ]
do
		while [ 1 ] 
		do 
			./phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1553274.html pr-positive > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			if [ ${NUM} -ne 0 ]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt > result.txt

		while [ 1 ] 
		do 
			./phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1557043.html ymat > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			if [ ${NUM} -ne 0 ]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt

		while [ 1 ] 
		do 
			./phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1559624.html xheo > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			if [ ${NUM} -ne 0 ]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt

		while [ 1 ] 
		do 
			./phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1558719.html busotir > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			if [ ${NUM} -ne 0 ]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt

		while [ 1 ] 
		do 
			./phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1562633.html cron314 > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			if [ ${NUM} -ne 0 ]
				then continue;
				else break;
			fi
		done 
		tail -n 50 temp.txt >> result.txt

		while [ 1 ] 
		do 
			./phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1557039.html PrincipessaMilana > temp.txt
			NUM=`grep -c "ads.adfox.ru" ./temp.txt` 
			if [ ${NUM} -ne 0 ]
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