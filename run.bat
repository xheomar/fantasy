:loop
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1553274.html pr-positive > result.txt
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1557043.html ymat >> result.txt
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1559624.html xheo >> result.txt
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1558719.html busotir >> result.txt
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1562633.html cron314 >> result.txt
phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1557039.html PrincipessaMilana >> result.txt
git add result.txt
git commit -m "Again and again..."
git push -u origin master
goto :loop
