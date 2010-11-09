(function($){

	$(document).ready(function(){

		// This value can be true, false or a function to be used as a callback when the closer is clciked
    // $.jGrowl.defaults.closer = function() {
    //  console.log("Closing everything!", this);
    // };
		
		// A callback for logging notifications.
    // $.jGrowl.defaults.log = function(e,m,o) {
    //  $('#logs').append("<div><strong>#" + $(e).attr('id') + "</strong> <em>" + (new Date()).getTime() + "</em>: " + m + " (" + o.theme + ")</div>")
    // }        
		
    // $.jGrowl("Hello world!");
    // $.jGrowl("This notification will live a little longer.", { life: 1000 });
    // $.jGrowl("Sticky notification with a header", { header: 'A Header', sticky: true });
    // $.jGrowl("Custom theme, and a whole bunch of callbacks...", { 
    //  theme:  'manilla',
    //  speed:  'slow',
    //  beforeOpen: function(e,m,o) {
    //    console.log("I am going to be opened!", this);
    //  },
    //  open: function(e,m,o) {
    //    console.log("I have been opened!", this);
    //  },
    //  beforeClose: function(e,m,o) {
    //    console.log("I am going to be closed!", this);
    //  },
    //  close: function(e,m,o) {
    //    console.log("I have been closed!", this);
    //  }
    // });
    // 
    // $.jGrowl("Custom animation test...", { 
    //  theme: 'manilla',
    //  speed: 'slow',
    //  animateOpen: { 
    //    height: "show"
    //  },
    //  animateClose: { 
    //    height: "hide"
    //  }
    // });
    // 
    // $.jGrowl("Looks like the iPhone.", { 
    //  header: 'iPhone',
    //  theme: 'iphone'
    // });
    // 
    // 
    // $.jGrowl("This message will not open because we have a callback that returns false.", {
    //  beforeOpen: function() {
    //    console.log("Going to open a notification, but not really...");
    //  },
    //  open: function() {
    //    return false;
    //  }
    // });
    // 
    // $.jGrowl("This message will not close because we have a callback that returns false.", {
    //  beforeClose: function() {
    //    return false;
    //  }
    // });
    // 
    // $.jGrowl.defaults.closerTemplate = '<div>hide all notifications</div>';
    // 
    // $('#test1').jGrowl("Testing a custom container (this one is sticky, and will also be prepended).", {
    //  closer: false,
    //  sticky: true, 
    //  glue: 'before',
    //  speed: 2000,
    //  easing: 'easeInOutElastic',
    //  animateOpen: { 
    //    height: "show",
    //    width: "show"
    //  },
    //  animateClose: { 
    //    height: "hide",
    //    width: "show"
    //  }
    // });
    // 
    // $('#test1').jGrowl("Another custom container test.", { 
    //  glue: 'before',
    //  speed: 2000,
    //  easing: 'easeInOutExpo',
    //  animateOpen: { 
    //    height: "show",
    //    width: "show"
    //  },
    //  animateClose: { 
    //    height: "hide",
    //    width: "show"
    //  }
    // });
    // 
    // $('#test2').jGrowl("Trying a background image.", { 
    //  theme: 'smoke',
    //  closer: false
    // });
    // 
    // $('#test2').jGrowl("This demo notification uses images from the UI flora theme to create similar styled notifications.", { 
    //  theme: 'flora',
    //  header: "Flora makes Fauna",
    //  closer: false
    // });
    
	});
})(jQuery);

function slideup_and_remove(dom){
  $(dom).slideUp(1000, function() { $(dom).remove(); });
}