:loop

:again_1
sleep 5s
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1553274.html pr-positive > temp.txt
grep "ads.adfox.ru" ./temp.txt && goto :again_1 || tail -n 50 temp.txt > result.txt

:again_2
sleep 5s
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1557043.html ymat > temp.txt
grep "ads.adfox.ru" ./temp.txt && goto :again_2 || tail -n 50 temp.txt >> result.txt

:again_3
sleep 5s
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1559624.html xheo > temp.txt
grep "ads.adfox.ru" ./temp.txt && goto :again_3 || tail -n 50 temp.txt >> result.txt

:again_4
sleep 5s
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1558719.html busotir > temp.txt
grep "ads.adfox.ru" ./temp.txt && goto :again_4 || tail -n 50 temp.txt >> result.txt

:again_5
sleep 5s
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1562633.html cron314 > temp.txt
grep "ads.adfox.ru" ./temp.txt && goto :again_5 || tail -n 50 temp.txt >> result.txt

:again_6
sleep 5s
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1557039.html PrincipessaMilana > temp.txt
grep "ads.adfox.ru" ./temp.txt && goto :again_6 || tail -n 50 temp.txt >> result.txt

find -type f -name result.txt -exec sed -i -r 's/Фелипе\ Ан\.\.\./Фелипе\ Андерсон/g' {} \;
find -type f -name result.txt -exec sed -i -r 's/Бонавенту\.\.\./Бонавентура/g' {} \;
find -type f -name result.txt -exec sed -i -r 's/А\.\ Масьел\.\.\./А\.\ Масьелло/g' {} \;

git add result.txt
git commit -m "Again and again..."
git push -u origin master
goto :loop
