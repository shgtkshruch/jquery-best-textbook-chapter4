duration = 300

###
# BUTTONS1
###

# 1行目
$ '#buttons1 button:nth-child(-n+4)'
  .on 'mouseover', ->
    $(@)
      .stop true
      .animate
        backgroundColor: '#ae5e9b'
        color: '#fff'
      , duration
  .on 'mouseout', ->
    $(@)
      .stop true
      .animate
        backgroundColor: '#fff'
        color: '#ebc000'
      , duration

# 2行目
$ '#buttons1 button:nth-child(n+5):nth-child(-n+8)'
  .on 'mouseover', ->
    $(@)
      .stop true
      .animate
        borderWidth: '12px'
        color: '#ae5e9b'
      , duration, 'easeOutSine'
  .on 'mouseout', ->
    $(@)
      .stop true
      .animate
        borderWidth: '0px'
        color: '#ebc000'
      , duration, 'easeOutSine'

# 3行目
$ '#buttons1 button:nth-child(n+9)'
  .on 'mouseover', ->
    $(@)
      .find '> span'
      .stop true
      .animate
        width: '100%'
      , duration, 'easeOutQuad'
  .on 'mouseout', ->
    $(@)
      .find '> span'
      .stop true
      .animate
        width: '0px'
      , duration, 'easeOutQuad'

###
# BUTTONS2
###

$ '#buttons2 button'
  .each (index) ->
    pos = index * 40 - 40
    $(@).css 'top', pos
  .on 'mouseover', ->
    $(@)
      .stop true
      .animate
        backgroundColor: '#faee00'
        color: '#000'
      , duration
      .find 'img:first-child'
      .stop true
      .animate
        opacity: 0
      , duration
      .end()
      .find 'img:nth-child(2)'
      .stop true
      .animate
        opacity: 1
      , duration
  .on 'mouseout', ->
    $(@)
      .stop true
      .animate
        backgroundColor: '#fff'
        color: '#01b169'
      , duration
      .find 'img:first-child'
      .stop true
      .animate
        opacity: 1
      , duration
      .end()
      .find 'img:nth-child(2)'
      .stop true
      .animate
        opacity: 0
      , duration

###
# IMAGES
###

$images = $ '#images p'

# 1枚目
$images
  .filter ':nth-child(1)'
  .on 'mouseover', ->
    $(@)
      .find 'strong, span'
      .stop true
      .animate
        opacity: 1
      , duration
  .on 'mouseout', ->
    $(@)
      .find 'strong, span'
      .stop true
      .animate
        opacity: 0
      , duration

# 2枚目
$images
  .filter ':nth-child(2)'
  .on 'mouseover', ->
    $(@)
      .find 'strong'
        .stop true
        .animate
          opacity: 1
          left: '0%'
        , duration
      .end()
      .find 'span'
        .stop true
        .animate
          opacity: 1
        , duration
  .on 'mouseout', ->
    $(@)
      .find 'strong'
        .stop true
        .animate
          opacity: 0
          left: '-200%'
        , duration
      .end()
      .find 'span'
        .stop true
        .animate
          opacity: 0
        , duration

# 3枚目
$images
  .filter ':nth-child(3)'
  .on 'mouseover', ->
    $(@)
      .find 'img'
      .stop true
      .animate
        top: '-20px'
      , duration * 1.3
      .end()
      .find 'strong'
      .stop true
      .animate
        bottom: '0px'
      , duration
      .end()
      .find 'span'
      .stop true
      .animate
        opacity: 1
      , duration
  .on 'mouseout', ->
    $(@)
      .find 'img'
      .stop true
      .animate
        top: '0px'
      , duration
      .end()
      .find 'strong'
      .stop true
      .animate
        bottom: '-80px'
      , duration
      .end()
      .find 'span'
      .stop true
      .animate
        opacity: 0
      , duration

###
# Sidebar
###

$aside = $ '.page-main > aside'
$aside
  .find 'button'
  .on 'click', ->
    $aside.toggleClass 'open'

    if $aside.hasClass 'open'
      $aside
        .stop true
        .animate
          left: '-70px'
        , duration, 'easeOutBack'
      $(@)
        .find 'img'
        .attr 'src', 'images/btn_close.png'
    else
      $aside
        .stop true
        .animate
          left: '-350px'
        , duration, 'easeInBack'
      $(@)
        .find 'img'
        .attr 'src', 'images/btn_open.png'

###
# TYPO
###

$ '#typo'
  .typoShadow()
