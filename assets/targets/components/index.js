// Dep
var Shims = require("../../shared/shims");
new Shims();

// Global scoped search for a class or attr up the DOM tree
var FindUp = require("../../shared/findup");
new FindUp();

// Global scoped smooth inner scroll
var SmoothScroll = require("../../shared/smoothscroll");
new SmoothScroll();

// Also need one to find non-text nodes in a list of children

// Async load fonts from google
var WebFont = require("webfontloader");
WebFont.load({
  google: { families: [ 'Roboto:400,300,100,700,100italic,300italic,400italic,700italic:latin' ] }
});

// replace with viewloader eventually
window.UOMloadComponents = function() {
  "use strict";

  var recs, i, g, Accordion, Modal, Tabs, SidebarTabs, InpageNavigation, JumpNav, ListFilter, imagesloaded, ImageGallery, slingshot, script;

  recs = document.querySelectorAll('.accordion__title');
  if (recs.length > 0) {
    Accordion = require("./accordion");
    for (i=recs.length - 1; i >= 0; i--)
      new Accordion(recs[i], {});
  }

  recs = document.querySelectorAll('[data-modal-target]');
  if (recs.length > 0) {
    Modal = require("./modal");
    for (i=recs.length - 1; i >= 0; i--)
      new Modal(recs[i], {});
  }

  recs = document.querySelectorAll('[data-tabbed]');
  if (recs.length > 0) {
    Tabs = require("./tabs");
    for (i=recs.length - 1; i >= 0; i--)
      new Tabs(recs[i], {});
  }

  recs = document.querySelectorAll('.sidebar-tab-nav');
  if (recs.length > 0) {
    SidebarTabs = require("./tabs/sidebartabs");
    for (i=recs.length - 1; i >= 0; i--)
      new SidebarTabs(recs[i], {'selector': '.sidebar-tab'});
  }

  // Should combine with above
  recs = document.querySelectorAll('.inner-nav-tab');
  if (recs.length > 0) {
    SidebarTabs = require("./tabs/sidebartabs");
    for (i=recs.length - 1; i >= 0; i--)
      new SidebarTabs(recs[i], {'selector': '.inner-nav-page'});
  }

  recs = document.querySelectorAll('a[href^="#"]');
  if (recs.length > 0) {
    InpageNavigation = require("./inpage-navigation");
    for (i=recs.length - 1; i >= 0; i--)
      new InpageNavigation(recs[i], {});
  }

  if (document.countSelector('h2[id]') > 0 && document.countSelector('.jumpnav, .indexnav') == 1) {
    JumpNav = require("./inpage-navigation/jumpnav");
    new JumpNav({});
  }

  // window.UOMExtraLabel();
  // window.UOMFancySelect();
  // window.UOMValid();
  // window.UOMTableLabels();
  // Checklist?

  recs = document.querySelectorAll('form.filtered-listing-select');
  if (recs.length > 0) {
    ListFilter = require("./filtered-listings");
    for (i=recs.length - 1; i >= 0; i--)
      new ListFilter(recs[i], {});
  }

  recs = document.querySelectorAll('ul.image-gallery');
  if (recs.length > 0) {
    imagesLoaded = require('imagesloaded');
    ImageGallery = require("./gallery");

    slingshot = function() {
      new ImageGallery(g, {});
    };

    for (i=recs.length - 1; i >= 0; i--) {
      g = recs[i];
      imagesLoaded(g, slingshot);
    }
  }

  // GMaps will load via callback
  if (document.countSelector('[data-latlng],[data-address]') > 0) {
    script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "https://maps.googleapis.com/maps/api/js?callback=maps_loaded_go";
    document.body.appendChild(script);
  }

  // window.UOMLeafletMap();
};

// GMaps callback
window.maps_loaded_go = function() {
  var GMaps = require("./maps/gmaps");
  for (var recs = document.querySelectorAll('[data-latlng],[data-address]'), i=recs.length - 1; i >= 0; i--)
    new GMaps(recs[i], {});
};

// Execute when ready
if (window.attachEvent) {
  window.attachEvent('onload', window.UOMloadComponents);
} else {
  document.addEventListener('DOMContentLoaded', window.UOMloadComponents, false);
  document.addEventListener('page:change', function() {
    window.UOMloadComponents();
  }, false);
}
