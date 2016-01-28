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
