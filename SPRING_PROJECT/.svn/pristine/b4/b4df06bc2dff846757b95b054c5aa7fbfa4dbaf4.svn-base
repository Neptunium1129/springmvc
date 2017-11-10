$(document).ready(function(){
	
	var showPicture = $('#show-picture');
	
	// Set events
	$("#take-picture").bind('change',function (event) {
	    // Get a reference to the taken picture or chosen file
	    var files = event.target.files,
	        file;
	    if (files && files.length > 0) {
	        file = files[0];
	        try {
	            // Get window.URL object
	            var URL = window.URL || window.webkitURL;
	
	            // Create ObjectURL
	            var imgURL = URL.createObjectURL(file);
	            
	            // Set img src to ObjectURL
	            showPicture.attr('src',imgURL);
	
	            // Revoke ObjectURL after imagehas loaded
	            showPicture.load(function() {
	                URL.revokeObjectURL(imgURL);  
	            });
	        }
	        catch (e) {
	            try {
	                // Fallback if createObjectURL is not supported
	                var fileReader = new FileReader();
	                fileReader.onload = function (event) {
	                	showPicture.attr('src',event.target.result);
	                };
	                fileReader.readAsDataURL(file);
	            } catch (e) {
	                // Display error message
	                var error = $("#error");
	                if (error) {
	                    error.html("Neither createObjectURL or FileReader are supported");
	                }
	            }
	        }
	    }
	});
	    
});

