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
