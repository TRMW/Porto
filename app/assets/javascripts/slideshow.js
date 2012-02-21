PortoSlideshow = function() {
  this.index = $('article').data('current-index');
  this.originalIndex = this.index;
  this.getPosition = function(){
    return this.index + 1;
  },
  this.images = $('.project-image');
  this.nextLink = $('#next-link');
  this.prevLink = $('#previous-link');
  this.projectSlug = $('article').data('project-slug');
  this.baseUrl = window.location.protocol + '//' + window.location.host;
  this.triggered = false;
  this.slideshow = this;
  this.initEvents();
}
  
PortoSlideshow.prototype.initEvents = function(){
  var slideshow = this.slideshow;
  
  slideshow.nextLink.add(slideshow.images).click(function(){
    // If we're not on the last image...
    if ( slideshow.getPosition() !== slideshow.images.length ) {
      slideshow.showNext();
      slideshow.pushState();
    }
    // If this IS the last image, and a photo was clicked, reset the slideshow
    else if ( $(this).hasClass('project-image') ) {
      slideshow.resetSlideshow();
      slideshow.pushState();
    }
    return false;
  });
  
  slideshow.prevLink.click(function(){
    // if we're not on the first image
    if ( slideshow.getPosition() !== 1 ) {
      slideshow.showPrev();
      slideshow.pushState();
    }
    return false;
  });
  
  // Show next or previous photos on browser history button click
  window.onpopstate = function(event){
    slideshow.popState(event);
  };
}
  
PortoSlideshow.prototype.showNext = function(){
  $(this.images[this.index + 1]).show();
  $(this.images[this.index]).hide();
  this.index++;
  this.resetButtons();
}
  
PortoSlideshow.prototype.showPrev = function(){
  $(this.images[this.index - 1]).show();
  $(this.images[this.index]).hide();
  this.index--;
  this.resetButtons();
}

PortoSlideshow.prototype.showSlide = function(index){
  $(this.images[index]).show();
  $(this.images[this.index]).hide();
  this.index = index;
  this.resetButtons();
}

PortoSlideshow.prototype.resetSlideshow = function(){
  $(this.images[0]).show();
  $(this.images[this.index]).hide();
  this.nextLink.removeClass( 'inactive' ).addClass( 'active' );
  this.prevLink.addClass( 'inactive' ).removeClass( 'active' );
  this.index = 0;
}

PortoSlideshow.prototype.resetButtons = function(){
  // hide next button if we've just shown the last image
  if ( this.getPosition() === this.images.length ) {
    this.nextLink.addClass( 'inactive' ).removeClass( 'active' );
  }
  else {
    this.nextLink.removeClass( 'inactive' ).addClass( 'active' );
  }
  
  // hide prev button if we've just shown the first image
  if ( this.getPosition() === 1 ) {
    this.prevLink.addClass( 'inactive' ).removeClass( 'active' );
  }
  else {
    this.prevLink.removeClass( 'inactive' ).addClass( 'active' );
  }
}
  
PortoSlideshow.prototype.pushState = function() {
  var stateObj = { index: this.index }, // can be retreived via event.state
    url = this.baseUrl + '/projects/' +  this.projectSlug;
  
  // only append image to URL if we're not on the first one
  if ( this.index > 0 ) {
    url += '/images/' + this.getPosition();
  }
  
  history.pushState(stateObj, null, url);
  
  // set this so we can detect the initial popstate event correctly later on
  this.triggered = true;
}

PortoSlideshow.prototype.popState = function(event) {
  // Manually show the correct photos to imititate standard browser navigation
  if ( event.state ) {
    this.showSlide(event.state.index);
  }
  
  /* If a popstate event is fired but there's no stored index AND a next/prev action has been triggered,
     then it's the original history event from the browser, so show the starting photo */
  else if ( this.triggered ) {
    this.showSlide(this.originalIndex);
  }
}