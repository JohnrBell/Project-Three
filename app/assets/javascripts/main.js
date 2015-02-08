console.log('Main.js loaded!')

window.onload = function(){

	$('#getredditposts').on('click', function(event){ //when you click the get reddit posts button
		$.ajax({	//ajax request to reddit api to get top space posts from today
			url: 'http://www.reddit.com/r/space/top.json?t=day',
			type: 'GET',
			dataType: 'json'
		}).done(function(results){
			results['data']['children'].forEach(function(post) {	//runs through each result returned 
   			if (post['data']['domain'] == 'i.imgur.com'){ //checks if the post is that of an image
   				article = {title: post['data']['title'], img_url: post['data']['url']}
   				$.ajax({	//ajax post to add pending articles to the database...
						url: '/pending/create',
						type: 'POST',
						data: article
					})//close ajax call
   			}//close if 
		  })//close .for each
		  location.reload();
		})//close .done
	})//close on click function


	$('body').on('click', '#yes' ,function(event){ //when you click the yes, keep this pending button
		idtokill = {id: this.getAttribute("data-pic-id")}
		title = this.parentElement.children[3].getAttribute('value')
		img_url = this.parentElement.children[4].getAttribute('value')
		whattopost = {title: title, img_url: img_url}	
		
		this.parentElement.remove()
		$.ajax({	//ajax post to add pending article to the article database...
			url: 'articles/create',
			type: 'POST',
			data: whattopost
		})//close ajax call

		$.ajax({	//ajax post to remove accepted article from pending...
			url: 'pending/destroy',
			type: 'POST',
			data: idtokill
		})//close ajax call
		location.reload();

	})//close on click function 


	$('body').on('click', '#kill' ,function(event){ //when you click the kill button
		idtokill = {id: this.getAttribute("data-pic-id")}
		this.parentElement.remove()

		$.ajax({	//ajax post to add pending articles to the database...
			url: 'pending/destroy',
			type: 'POST',
			data: idtokill
		})//close ajax call
	})//close on click function


	$('body').on('click', '#killDuplicate' ,function(event){ //when you click the kill button
		idtokill = {id: this.getAttribute("data-pic-id")}
		this.parentElement.remove()

		$.ajax({	//ajax post to add pending articles to the database...
			url: 'articles/destroy',
			type: 'POST',
			data: idtokill
		})//close ajax call
	})//close on click function  



	$('body').on('click', '#showsub' ,function(event){ //when you click the show subcomment form button
		toggle_visibility(this.parentElement.children[1])
	})

  function toggle_visibility(id) {
     var e = (id);
     if(e.style.display == 'block')
        e.style.display = 'none';
     else
        e.style.display = 'block';
  }
}//close on load function 





