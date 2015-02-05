console.log('Main.js loaded!')

window.onload = function(){
	$('#getredditposts').on('click', function(event){ //when you click the button
		 $.ajax({	//ajax request to reddit api to get top space posts from today
			url: 'http://www.reddit.com/r/space/top.json?t=day',
			type: 'GET',
			dataType: 'json'
		}).done(function(results){
			
			pending_arrary = []

			results['data']['children'].forEach(function(post) {	//runs through each result returned 
   			if (post['data']['domain'] == 'i.imgur.com'){ //checks if the post is that of an image
   				// console.log(post['data']['title'])
   				article = {title: post['data']['title'], img_url: post['data']['url']}

   				$.ajax({	//ajax post to add pending articles to the database...
						url: '/pending/create',
						type: 'POST',
						data: article
					})
		
   			}
		  });

		})//close .done
	})//close on click function
}//close on load function 

