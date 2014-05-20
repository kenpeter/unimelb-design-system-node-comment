class NavState
  constructor: ->
    @page = document.querySelector('.page-inner')
    @sitemap = document.querySelector('div[role="sitemap"]')
    t = this

    if 1 #t.page.offsetWidth > 768
      if Array.prototype.slice.call(document.querySelectorAll('div[role="navigation"]')).length==1
        @localnav = document.querySelector('div[role="navigation"]')
        document.querySelector('.page-header-tools a[title="Menu"]').addEventListener 'click', (e) ->
          e.preventDefault()
          t.page.removeClass('evolve')
          t.localnav.removeClass('evolve')
          t.sitemap.removeClass('active')
          t.page.toggleClass('active')
          t.localnav.toggleClass('active')

        @localnav.querySelector('h2:first-child').addEventListener 'click', (e) ->
          e.preventDefault()
          if t.page.hasClass "evolve"
            t.page.toggleClass('evolve')
            t.localnav.toggleClass('evolve')
            t.sitemap.toggleClass('active')
          else
            t.page.removeClass('evolve')
            t.localnav.removeClass('evolve')
            t.sitemap.removeClass('active')
            t.page.toggleClass('active')
            t.localnav.toggleClass('active')

        @localnav.querySelector('.sitemap-label').addEventListener 'click', (e) ->
          e.preventDefault()
          t.page.toggleClass('evolve')
          t.localnav.toggleClass('evolve')
          t.sitemap.toggleClass('active')

        @sitemap.querySelector('.close-button').addEventListener 'click', (e) ->
          e.preventDefault()
          t.page.toggleClass('evolve')
          t.localnav.toggleClass('evolve')
          t.sitemap.toggleClass('active')

      else
        document.querySelector('.page-header-tools a[title="Menu"]').addEventListener 'click', (e) ->
          e.preventDefault()
          t.page.toggleClass('evolve')
          t.sitemap.toggleClass('active')

        @sitemap.querySelector('.close-button').addEventListener 'click', (e) ->
          e.preventDefault()
          t.page.toggleClass('evolve')
          t.sitemap.toggleClass('active')

# Create header and move local breadcrumb
if Array.prototype.slice.call(document.querySelectorAll('div[role="main"].skip-header')).length==0
  block = document.createElement('div')
  block.addClass('page-header')
  if Array.prototype.slice.call(document.querySelectorAll('article.vca')).length==1
    logo = "/assets/images/vca/logo-vca"
    menu = "/assets/images/injection/menu-b"
    classes = ' class="vca"'
  else
    logo = "/assets/images/injection/header-logo"
    menu = "/assets/images/injection/menu"
    classes = ""

  block.innerHTML = """
  <header#{classes}>
    <a class="page-header-logo" href="http://www.unimelb.edu.au">
    <!--[if lt IE 9]>
      <img alt="UoM Logo" src="#{logo}.png" /><![endif]-->
    <!--[if gte IE 9]><!--><img alt="UoM Logo" src="#{logo}.svg"><!--<![endif]-->
    </a>
    </a>
    <div class="page-header-navigation">
      <a href="https://unimelb.edu.au" title="The University of Melbourne">The University of Melbourne</a>
    </div>
    <div class="page-header-tools">
      <a class="page-header-icon menu" href="#sitemap" title="Menu">
      <!--[if lt IE 9]>
        <img alt="" src="#{menu}.png" />
      <![endif]-->
      <!--[if gte IE 9]><!-->
        <img alt="" src="#{menu}.svg">
      <!--<![endif]-->Menu
      </a>
    </div>
  </header>
  """

  parent = document.querySelector('.page-inner')
  parent.insertBefore(block, parent.firstChild)

  if Array.prototype.slice.call(document.querySelectorAll('.page-local-history')).length==1
    local = document.querySelector('.page-local-history')
    local.parentNode.removeChild(local)

    parent = document.querySelector('.page-header-navigation')
    sep = document.createElement "span"
    sep.innerHTML = "/"
    parent.appendChild(sep)
    parent.appendChild(local)

# Move local nav outside page container
if Array.prototype.slice.call(document.querySelectorAll('div[role="navigation"]')).length==1
  localnav = document.querySelector('div[role="navigation"]')
  localnav.removeClass('no-js')
  document.body.appendChild(localnav)

  trigger = document.createElement('div')
  trigger.addClass('sitemap-label')
  trigger.innerHTML = "University Sitemap"
  localnav.appendChild(trigger)

# Create global nav
nav = document.createElement('div')
nav.setAttribute('role', 'sitemap')
nav.innerHTML = """
  <a class="close-button" href="">Close</a>
  <h2>University of Melbourne</h2>
  <form>
    <fieldset>
      <div class="inline">
        <input data-required placeholder="Search" name="f[search]" type="search" title="Please enter a keyword." />
        <input type="image" src="/assets/images/injection/search-w.png">
      </div>
    </fieldset>
  </form>
  <div data-single-focus>
    <div class="col-2">
      <div>
        <h2 class="accordion__title">Study at Melbourne</h2>
        <ul class="accordion__hidden">
          <li><a href="#">Undergraduate</a></li>
          <li><a href="#">Graduate coursework</a></li>
          <li><a href="#">PhD &amp; research programs</a></li>
          <li><a href="#">International</a></li>
          <li><a href="#">Professional, executive &amp; community education</a></li>
          <li><a href="#">Schools &amp; parents</a></li>
          <li><a href="#">Student life @ Melbourne</a></li>
          <li><a href="#">Campus &amp; facilities</a></li>
        </ul>
      </div>
      <div>
        <h2 class="accordion__title">About us</h2>
        <ul class="accordion__hidden">
          <li><a href="#">International connections</a></li>
          <li><a href="#">Governance &amp; leadership</a></li>
          <li><a href="#">Strategy &amp; vision</a></li>
          <li><a href="#">Profile &amp; achievements</a></li>
          <li><a href="#">Faculties &amp; graduate schools</a></li>
          <li><a href="#">Policy &amp; publications</a></li>
          <li><a href="#">News</a></li>
          <li><a href="#">Events</a></li>
        </ul>
      </div>
      <div>
        <h2 class="accordion__title">Research</h2>
        <ul class="accordion__hidden">
          <li><a href="#">About research at Melbourne</a></li>
          <li><a href="#">Working at Melbourne</a></li>
          <li><a href="#">Research centres, institutes &amp; offices</a></li>
          <li><a href="#">Current research programs &amp; projects</a></li>
          <li><a href="#">Scholarships &amp; support</a></li>
          <li><a href="#">PhD &amp; research programs</a></li>
          <li><a href="#">Commercial research</a></li>
          <li><a href="#">Research services &amp; collaboration</a></li>
        </ul>
      </div>
    </div>
    <div class="col-2">
      <div>
        <h2 class="accordion__title">Engagement</h2>
        <ul class="accordion__hidden">
          <li><a href="#">Outreach programs</a></li>
          <li><a href="#">The arts &amp; culture</a></li>
          <li><a href="#">About engagement</a></li>
          <li><a href="#">Partnerships</a></li>
          <li><a href="#">Media</a></li>
          <li><a href="#">Why Melbourne?</a></li>
        </ul>
      </div>
      <div>
        <h2 class="accordion__title">Alumni &amp; friends</h2>
        <ul class="accordion__hidden">
          <li><a href="#">Benefits</a></li>
          <li><a href="#">Giving</a></li>
          <li><a href="#">Your faculty</a></li>
          <li><a href="#">Get involved</a></li>
          <li><a href="#">Global alumni network</a></li>
          <li><a href="#">Career Centre</a></li>
          <li><a href="#">Future study</a></li>
        </ul>
      </div>
      <div>
        <h2 class="accordion__title">Business &amp; organisations</h2>
        <ul class="accordion__hidden">
          <li><a href="#">Find an expert</a></li>
          <li><a href="#">Areas of expertise</a></li>
          <li><a href="#">Consultancy</a></li>
          <li><a href="#">Services</a></li>
          <li><a href="#">Professional development &amp; custom programs</a></li>
          <li><a href="#">Technology commercialisation</a></li>
          <li><a href="#">Facilities &amp; technology for hire</a></li>
        </ul>
      </div>
    </div>
  </div>
"""
document.querySelector('body').appendChild(nav)

# Add link state behaviour
navstate = new NavState()


class InjAccordion
  constructor: (@el) ->
    @el.addEventListener 'click', (e) ->
      e.preventDefault()
      t = e.target || e.srcElement
      s.removeClass('accordion__visible') for s in t.parentNode.parentNode.parentNode.querySelectorAll('.accordion__visible')
      t.parentNode.addClass('accordion__visible')

if (supportedmodernbrowser)
  new InjAccordion(el) for el in document.querySelectorAll('.accordion__title')
