(function() {
  (function($) {
    var now, roundMinMax, typoShadow, uid;
    uid = 0;
    now = (function(isDateHasNow) {
      return function() {
        if (isDateHasNow) {
          return Date.now();
        } else {
          return +(new Date);
        }
      };
    })(!!Date.now);
    typoShadow = function(e) {
      var $typo, center, radius, x, y;
      $typo = this;
      center = $typo.width() * 0.5;
      radius = e.radius;
      x = (roundMinMax(-radius, radius, e.pageX - ($typo.offset().left) - center) / radius).toFixed(3) - 0;
      y = Math.sin(Math.acos(x)).toFixed(3) - 0;
      $typo.css('text-shadow', '0 1px 0 #ccc,' + '0 2px 0 #c9c9c9,' + '0 3px 0 #bbb,' + '0 4px 0 #b9b9b9,' + '0 5px 0 #aaa,' + '0 6px 1px rgba(0,0,0,0.1),' + '0 0 5px rgba(0,0,0,0.1),' + 1 * -x + 'px ' + 1 * y + 'px 3px rgba(0,0,0,0.3),' + 3 * -x + 'px ' + 3 * y + 'px 5px rgba(0,0,0,0.2),' + 5 * -x + 'px ' + 5 * y + 'px 10px rgba(0,0,0,0.25),' + 10 * -x + 'px ' + 10 * y + 'px 10px rgba(0,0,0,0.2),' + 20 * -x + 'px ' + 20 * y + 'px 20px rgba(0,0,0,0.15)');
    };
    roundMinMax = function(min, max, value) {
      if (min > value) {
        value = min;
      }
      if (max < value) {
        value = max;
      }
      return value;
    };
    $.fn.typoShadow = function(options) {
      var $typos;
      $typos = this;
      options = $.extend(true, {
        radius: 800,
        throttle: 33,
        remove: false
      }, options);
      if (options.remove) {
        $typos.each(function() {
          var $typo, tid;
          $typo = $(this);
          tid = $typo.data('typoShadowId');
          if (tid) {
            $typo.removeData('typoShadowId').off('mousemove.' + tid).css('text-shadow', '');
          }
        });
      } else {
        $typos.each(function() {
          var $typo, tid, timer;
          $typo = $(this);
          tid = 'typoShadow' + uid++;
          timer = now();
          if ($typo.data('typoShadowId')) {
            return uid--;
          }
          $typo.data('typoShadowId', tid).on('mousemove.' + tid, function(e) {
            var _now;
            _now = now();
            if (_now - timer < options.throttle) {
              return;
            }
            timer = _now;
            e.radius = options.radius;
            typoShadow.call($typo, e);
          });
          typoShadow.call($typo, {
            pageX: 0,
            radius: options.radius
          });
        });
      }
      return $typos;
    };
  })(jQuery);

}).call(this);

(function() {
  var $aside, $images, duration;

  duration = 300;


  /*
   * BUTTONS1
   */

  $('#buttons1 button:nth-child(-n+4)').on('mouseover', function() {
    return $(this).stop(true).animate({
      backgroundColor: '#ae5e9b',
      color: '#fff'
    }, duration);
  }).on('mouseout', function() {
    return $(this).stop(true).animate({
      backgroundColor: '#fff',
      color: '#ebc000'
    }, duration);
  });

  $('#buttons1 button:nth-child(n+5):nth-child(-n+8)').on('mouseover', function() {
    return $(this).stop(true).animate({
      borderWidth: '12px',
      color: '#ae5e9b'
    }, duration, 'easeOutSine');
  }).on('mouseout', function() {
    return $(this).stop(true).animate({
      borderWidth: '0px',
      color: '#ebc000'
    }, duration, 'easeOutSine');
  });

  $('#buttons1 button:nth-child(n+9)').on('mouseover', function() {
    return $(this).find('> span').stop(true).animate({
      width: '100%'
    }, duration, 'easeOutQuad');
  }).on('mouseout', function() {
    return $(this).find('> span').stop(true).animate({
      width: '0px'
    }, duration, 'easeOutQuad');
  });


  /*
   * BUTTONS2
   */

  $('#buttons2 button').each(function(index) {
    var pos;
    pos = index * 40 - 40;
    return $(this).css('top', pos);
  }).on('mouseover', function() {
    return $(this).stop(true).animate({
      backgroundColor: '#faee00',
      color: '#000'
    }, duration).find('img:first-child').stop(true).animate({
      opacity: 0
    }, duration).end().find('img:nth-child(2)').stop(true).animate({
      opacity: 1
    }, duration);
  }).on('mouseout', function() {
    return $(this).stop(true).animate({
      backgroundColor: '#fff',
      color: '#01b169'
    }, duration).find('img:first-child').stop(true).animate({
      opacity: 1
    }, duration).end().find('img:nth-child(2)').stop(true).animate({
      opacity: 0
    }, duration);
  });


  /*
   * IMAGES
   */

  $images = $('#images p');

  $images.filter(':nth-child(1)').on('mouseover', function() {
    return $(this).find('strong, span').stop(true).animate({
      opacity: 1
    }, duration);
  }).on('mouseout', function() {
    return $(this).find('strong, span').stop(true).animate({
      opacity: 0
    }, duration);
  });

  $images.filter(':nth-child(2)').on('mouseover', function() {
    return $(this).find('strong').stop(true).animate({
      opacity: 1,
      left: '0%'
    }, duration).end().find('span').stop(true).animate({
      opacity: 1
    }, duration);
  }).on('mouseout', function() {
    return $(this).find('strong').stop(true).animate({
      opacity: 0,
      left: '-200%'
    }, duration).end().find('span').stop(true).animate({
      opacity: 0
    }, duration);
  });

  $images.filter(':nth-child(3)').on('mouseover', function() {
    return $(this).find('img').stop(true).animate({
      top: '-20px'
    }, duration * 1.3).end().find('strong').stop(true).animate({
      bottom: '0px'
    }, duration).end().find('span').stop(true).animate({
      opacity: 1
    }, duration);
  }).on('mouseout', function() {
    return $(this).find('img').stop(true).animate({
      top: '0px'
    }, duration).end().find('strong').stop(true).animate({
      bottom: '-80px'
    }, duration).end().find('span').stop(true).animate({
      opacity: 0
    }, duration);
  });


  /*
   * Sidebar
   */

  $aside = $('.page-main > aside');

  $aside.find('button').on('click', function() {
    $aside.toggleClass('open');
    if ($aside.hasClass('open')) {
      $aside.stop(true).animate({
        left: '-70px'
      }, duration, 'easeOutBack');
      return $(this).find('img').attr('src', 'images/btn_close.png');
    } else {
      $aside.stop(true).animate({
        left: '-350px'
      }, duration, 'easeInBack');
      return $(this).find('img').attr('src', 'images/btn_open.png');
    }
  });


  /*
   * TYPO
   */

  $('#typo').typoShadow();

}).call(this);
