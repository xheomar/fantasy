:loop

phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1553274.html pr-positive > file.txt

phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1557043.html ymat >> file.txt

phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1559624.html xheo >> file.txt

phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1558719.html busotir >> file.txt

phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1562633.html cron314 >> file.txt

phantomjs.exe getPoints.js http://www.sports.ru/fantasy/football/team/1557039.html PrincipessaMilana >> file.txt

:: sort -r file.txt > result.txt

git add file.txt

git commit -m "Again and again..."

git push -u origin master

goto :loop
