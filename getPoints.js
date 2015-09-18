var page = require('webpage').create();
var system = require('system');

// Route "console.log()" calls from within the Page context to the main Phantom context (i.e. current "this")
//page.onConsoleMessage = function(msg) {
//    console.log(msg);
//};

if (system.args.length === 1) 
{
	console.log('Try to pass some args when invoking this script!');
} 
else 
{
	//console.log('Trying to open ' + system.args[1] + '...');
	var siteName = system.args[1];
	var playerName = system.args[2];
}

page.open(siteName, function (status) 
{
	if (status !== 'success') 
	{
		console.log('Network Problem');
	} 
	else 
	{
		var data = page.evaluate(function () 
		{
			var points = 0;
			var players = 0;
			// FORWARDS
			var min_forwards = 1, need_forwards = 0;
			var forward_points = [];
			var forwards = document.querySelectorAll('div.forward-container ins.player.hold.player-base span.pl-descr i.ico.point');
			for (var i = 0; i < forwards.length; i++) {
				if (forwards[i].innerText != "-")
				{
					forward_points.push(forwards[i].innerText);
					points += parseInt(forwards[i].innerText);
					players++;
				}
			}
			console.log("The points of forwards: " + forward_points);
			if (forward_points.length < min_defenders)
			{
				need_forwards = min_forwards - forward_points.length;
				console.log("We need " + need_forwards + " more forwards!");
			}
			
			// HALFBACKS
			var min_halfbacks = 2, need_halfbacks = 0;
			var halfback_points = [];
			var halfbacks = document.querySelectorAll('div.halfback-container ins.player.hold.player-base span.pl-descr i.ico.point');
			for (var i = 0; i < halfbacks.length; i++) {
				if (halfbacks[i].innerText != "-")
				{
					halfback_points.push(halfbacks[i].innerText);
					points += parseInt(halfbacks[i].innerText);
					players++;
				}
			}
			console.log("The points of halfbacks: " + halfback_points);
			if (halfback_points.length < min_halfbacks)
			{
				need_halfbacks = min_halfbacks - halfback_points.length;
				console.log("We need " + need_halfbacks + " more halfbacks!");
			}
			
			// DEFENDERS
			var min_defenders = 3, need_defenders = 0;
			var defender_points = [];
			var defenders = document.querySelectorAll('div.defender-container ins.player.hold.player-base span.pl-descr i.ico.point');
			for (var i = 0; i < defenders.length; i++) {
				if (defenders[i].innerText != "-")
				{
					defender_points.push(defenders[i].innerText);
					points += parseInt(defenders[i].innerText);
					players++;
				}				
			}
			console.log("The points of defenders: " + defender_points);
			if (defender_points.length < min_defenders)
			{
				need_defenders = min_defenders - defender_points.length;
				console.log("We need " + need_defenders + " more defenders!");
			}
			
			// GOALKEEPER
			var min_goalkeepers = 1, need_goalkeepers = 0;
			var goalkeeper_points = [];
			var goalkeepers = document.querySelectorAll('div.goalkeeper-container ins.player.hold.player-base span.pl-descr i.ico.point');
			for (var i = 0; i < goalkeepers.length; i++) {
				if (goalkeepers[i].innerText != "-")
				{
					goalkeeper_points.push(goalkeepers[i].innerText);
					points += parseInt(goalkeepers[i].innerText);
					players++;
				}
			}
			console.log("The points of goalkeepers: " + goalkeeper_points);
			if (goalkeeper_points.length < min_goalkeepers)
			{
				need_goalkeepers = min_goalkeepers - goalkeeper_points.length;
				console.log("We need " + need_goalkeepers + " more goalkeepers!");
			}
			
			// RESERVE
			var reserve_points = [];
			var reserve_position = [];
			var reserve_used = [];
			var reserves_1 = document.querySelectorAll('div.reserve-container ins.player.hold.player-reserve span.pl-descr i.ico.point');
			var reserves_2 = document.querySelectorAll('div.reserve-container ins.player.hold.player-reserve span.role');
			for (var i = 0; i < reserves_1.length; i++) {
				if (reserves_1[i].innerText != "-")
				{
					reserve_points.push(reserves_1[i].innerText);
					reserve_position.push(reserves_2[i].innerText);
					reserve_used.push("false");
				}
			}
			console.log("The points of reserves: " + reserve_points);
			console.log("The positions of reserves: " + reserve_position);
			
			var position = 0;
			for (var g = 0; g < need_goalkeepers; g++) {
				position = reserve_position.indexOf("Вр", position);
				if (position != -1) {
					console.log("We are going to add " + reserve_points[position] + " points for goalkeepers");
					points += parseInt(reserve_points[position]);
					reserve_used[position] = "true";
					position++;
					players++;
				} else {
					console.log("No more goalkeepers were found");
					break;
				}
			}
			
			position = 0;
			for (var d = 0; d < need_defenders; d++) {
				position = reserve_position.indexOf("Защ", position);
				if (position != -1) {
					console.log("We are going to add " + reserve_points[position] + " points for defenders");
					points += parseInt(reserve_points[position]);
					reserve_used[position] = "true";
					position++;
					players++;
				} else {
					console.log("No more defenders were found");
					break;
				}
			}
			
			position = 0;
			for (var h = 0; h < need_halfbacks; h++) {
				position = reserve_position.indexOf("Пз", position);
				if (position != -1) {
					console.log("We are going to add " + reserve_points[position] + " points for halfbacks");
					points += parseInt(reserve_points[position]);
					reserve_used[position] = "true";
					position++;
					players++;
				} else {
					console.log("No more halfbacks were found");
					break;
				}
			}
			
			position = 0;
			for (var f = 0; f < need_forwards; f++) {
				position = reserve_position.indexOf("Нап", position);
				if (position != -1) {
					console.log("We are going to add " + reserve_points[position] + " points for forwards");
					points += parseInt(reserve_points[position]);
					reserve_used[position] = "true";
					position++;
					players++;
				} else {
					console.log("No more forwards were found");
					break;
				}
			}
			
			// The last update 
			var p = 0;
			for (var l = players; l < 11; l++) {
				if (reserve_used[p] != "true")
				{
					console.log("We are going to add " + reserve_points[p] + " points");
					points += parseInt(reserve_points[p]);
					reserve_used[p] = "true";
					p++;
				}					
			}
			
			console.log("The overall points: " + points);
			return points;
			
		});
		console.log(data + "\t" + playerName);
	}
	phantom.exit();
});