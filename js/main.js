(function(window, document, $){
    "use strict";

    window.requestAnimationFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function(callback){window.setTimeout(callback, 16);};
	
  	$('.slider').slippry();
  
  	$(".news-items li a").readMore({
		numberOfLines: 2,
  		endingTag : '&hellip;'
  	});
  
    Function.prototype.debounce = function(threshold, execAsap){
        var func = this, timeout;

        return function debounced(){
            var obj = this, args = arguments;
            function delayed(){
                if(!execAsap)
                    func.apply(obj, args);
                timeout = null;
            };

            if(timeout)
                clearTimeout(timeout);
            else if (execAsap)
                func.apply(obj, args);

            timeout = setTimeout(delayed, threshold || 100);
        };
    };

    $.fn.maxHeight = function (minHeight) {
        minHeight = minHeight || true;
        var heights = [],
                that = this;
        if (that.length < 2) {
            return that;
        }
        that.each(function () {
            var $this = $(this);
            $this.height('');
            if(document.body.style.minHeight !== "undefined"){
                $this.css('min-height', '');
            }
            heights.push($this.height() + parseFloat($this.css('padding-top') || 0) + parseFloat($this.css('padding-bottom') || 0) + parseFloat($this.css('border-top') || 0) + parseFloat($this.css('border-bottom') || 0));
        }).each(function () {
            var $this = $(this);
            requestAnimationFrame(function(){
                $this.css((document.body.style.minHeight === "undefined" || !minHeight) ? 'height' : 'min-height', Math.max.apply(0, heights) - ($this.css('box-sizing') === 'border-box' ? 0 : parseFloat($this.css('padding-top') || 0) - parseFloat($this.css('padding-bottom') || 0) - parseFloat($this.css('border-top') || 0) - parseFloat($this.css('border-bottom') || 0)) + 'px');
            });
        });
        return that;
    };


    var OBG = function(){
        return;
    };
     OBG.utils = function(){
        return;
    };
    OBG.status = function(){
        return;
    };
    OBG.status.mqs = function(){
        return;
    };
    OBG.status.functions = function(){
        return;
    };


    OBG.utils.testAttribute = function(element, attribute) {
        var test = document.createElement(element);
        if (attribute in test)
            return true;
        else
            return false;
    };
    OBG.utils.placeholderPollyfill = function(){
        $('input[placeholder], textbox[placeholder]').each(function() {
            var $this = $(this),
                $form = $this.closest('form');

            if ($this.val() === ''){
                $this.val($this.attr('placeholder'));
            }
            $form.on('submit', function(event) {
                if ($this.val() == $this.attr('placeholder')){
                    $this.val('');
                }
            });
        }).on('focus', function() {
            var $this = $(this);
            if ($this.val() == $this.attr('placeholder')){
                $this.val('');
            }
        });
    };
    OBG.utils.rowFix = function($containers, columns) {
        var thumbLength = $containers.length,
            start = 0;
        while (start < thumbLength) {
            $containers.slice(start, start + columns).maxHeight();
            start = start + columns;
        }
    };

    OBG.status.functions.extraSmall = function(mq) {
        if(mq.matches){
            OBG.navigationPlus.onResize();

            if(OBG.$banners.length){
                OBG.$banners.each(function(index){
                    var $banner = $(this);
                    if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) !== 'object'){
                        OBG.banner($banner, false);
                    }else if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) === 'object'){
                        $banner.cycle('pause').trigger('cycle-resize');
                    }
                });
            }
        }
    };
    OBG.status.functions.small = function(mq) {
        if(mq.matches){
            OBG.navigationPlus.onResize();

            if(OBG.$banners.length){
                OBG.$banners.each(function(index){
                    var $banner = $(this);
                    if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) !== 'object'){
                        OBG.banner($banner, false);
                    }else if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) === 'object'){
                        $banner.cycle('pause').trigger('cycle-resize');
                    }
                });
            }
        }
    };
    OBG.status.functions.medium = function(mq) {
        if(mq.matches){
            OBG.navigationPlus.onResize();

            if(OBG.$banners.length){
                OBG.$banners.each(function(index){
                    var $banner = $(this);
                    if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) !== 'object'){
                        OBG.banner($banner, !index);
                    }else if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) === 'object'){
                        $banner.trigger('cycle-resize');
                        if(!$banner.data('paused')){
                            $banner.cycle('resume');
                        }
                    }
                });
            }
        }
    };
    OBG.status.functions.large = function(mq) {
        if(mq.matches){
            OBG.navigationPlus.onResize();

            if(OBG.$banners.length){
                OBG.$banners.each(function(index){
                    var $banner = $(this);
                    if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) !== 'object'){
                        OBG.banner($banner, !index);
                    }else if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) === 'object'){
                        $banner.trigger('cycle-resize');
                        if(!$banner.data('paused')){
                            $banner.cycle('resume');
                        }
                    }
                });
            }
        }
    };
    OBG.status.functions.xl = function(mq) {
        if(mq.matches){
            OBG.navigationPlus.onResize();

            if(OBG.$banners.length){
                OBG.$banners.each(function(index){
                    var $banner = $(this);
                    if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) !== 'object'){
                        OBG.banner($banner, !index);
                    }else if($banner.find('.slide').length > 1 && typeof($banner.data('cycle.opts')) === 'object'){
                        $banner.trigger('cycle-resize');
                        if(!$banner.data('paused')){
                            $banner.cycle('resume');
                        }
                    }
                });
            }
        }
    };

    OBG.init = function(){
        OBG.load = [];
        OBG.$horizNav = $('.horiz-nav');
        OBG.$navControlContainer = $('.nav-control-container');
        OBG.$banners = $('.banner');

        OBG.navigationPlus();

        if (typeof(matchMedia) === 'function' && matchMedia('screen').addListener) {
            OBG.status.mqs.extraSmall = matchMedia("(max-width: 400px)");
            OBG.status.mqs.small = matchMedia("(min-width: 400px) and (max-width: 700px)");
            OBG.status.mqs.medium = matchMedia("(min-width: 700px) and (max-width: 1000px)");
            OBG.status.mqs.large = matchMedia("(min-width: 1000px) and (max-width: 1200px)");
            OBG.status.mqs.xl = matchMedia("(min-width: 1200px)");

            OBG.status.mqs.extraSmall.addListener(OBG.status.functions.extraSmall);

            OBG.status.mqs.small.addListener(OBG.status.functions.small);

            OBG.status.mqs.medium.addListener(OBG.status.functions.medium);

            OBG.status.mqs.large.addListener(OBG.status.functions.large);

            OBG.status.mqs.xl.addListener(OBG.status.functions.xl);
        } else {
            OBG.status.mqs.xl = {matches: true};
            OBG.status.mqs.large = {matches: false};
            OBG.status.mqs.medium = {matches: false};
            OBG.status.mqs.small = {matches: false};
            OBG.status.mqs.extraSmall = {matches: false};
        }
        for(var index in OBG.status.mqs) {
            if (OBG.status.mqs.hasOwnProperty(index)) {
                if(true === OBG.status.mqs[index].matches){
                    OBG.status.functions[index](OBG.status.mqs[index]);
                }
            }
        }

        OBG.pageWidth = window.innerWidth || window.screen.width;

        $(window).load(function(){
            for (var i = OBG.load.length - 1; i >= 0; i--) {
                OBG.load[i]();
            };
        });
    };

    OBG.navigationPlus = function(){
        if('array' !== typeof(OBG.navigationPlus.horizNavItems)){
            OBG.navigationPlus.init();
            OBG.navigationPlus.horizNavWidth = OBG.$horizNav.width();
            $(window).on('resize', OBG.navigationPlus.onResize.debounce(50));
            requestAnimationFrame(OBG.navigationPlus.resize);
        }
    };
    OBG.navigationPlus.onResize = function(){
        if((window.innerWidth || window.screen.width) !== OBG.pageWidth){
            if(OBG.$horizNav.width() !== OBG.navigationPlus.horizNavWidth){
                OBG.navigationPlus.horizNavWidth = Math.floor(OBG.$navControlContainer.width());
            }
            OBG.pageWidth = window.innerWidth || window.screen.width;
        }
        requestAnimationFrame(OBG.navigationPlus.resize);
    };
    OBG.navigationPlus.resize = function(){
        var usedWidth = 0,
            itemsHidden = false,
            hiddenItems = [];


        OBG.navigationPlus.$overflowNav.detach().empty();

        function showItem(item){
            item.element.css('display', '');
            item.state = 1;
            delete(hiddenItems[item.index]);
            //console.log('unhidden item %d', item.index);
        };
        function hideItem(item, prevItem, updateWidth){
            if('boolean' === typeof(prevItem)){
                updateWidth = prevItem;
                prevItem = item;
            }
            prevItem = prevItem || item;
            updateWidth = updateWidth || false;
            if(item.active){
                if(1 === prevItem.state){
                    prevItem.element.css('display', 'none');
                    prevItem.state = 0;
                    hiddenItems[prevItem.index] = prevItem;
                    //console.log('hidden item %d by %d', prevItem.index, item.index);
                    usedWidth = usedWidth - prevItem.width + item.width;
                    if(0 === item.state){
                        showItem(item);
                    };
                }else{
                    //console.log('item %d active and item %d already hidden. hope loopback fixes things', item.index, prevItem.index);
                    usedWidth += item.width;
                };
            } else {
                item.element.css('display', 'none');
                item.state = 0;
                hiddenItems[item.index] = item;
                //console.log('hidden item %d', item.index);
                if(updateWidth){
                    usedWidth -= item.width;
                }
            };
            itemsHidden = true;
        };
        //console.groupCollapsed('ajusting navigation+');
        //console.log('nav container size: %d', OBG.navigationPlus.horizNavWidth);
        for(var i = 0, j = OBG.navigationPlus.horizNavItems.length; i < j; i++){
            var tempItemsHidden = itemsHidden;
            if(usedWidth + OBG.navigationPlus.horizNavItems[i].width > OBG.navigationPlus.horizNavWidth){
                hideItem(OBG.navigationPlus.horizNavItems[i], OBG.navigationPlus.horizNavItems[i - 1]);

                if(tempItemsHidden !== itemsHidden){
                    usedWidth += OBG.navigationPlus.overflowWidth;
                };

                if(!tempItemsHidden && i > 0 && usedWidth > OBG.navigationPlus.horizNavWidth){
                    if(i > 1){
                        hideItem(OBG.navigationPlus.horizNavItems[i - 1], OBG.navigationPlus.horizNavItems[i - 2], true);
                    }else{
                        hideItem(OBG.navigationPlus.horizNavItems[i - 1], true);
                    }
                };

                while(usedWidth > OBG.navigationPlus.horizNavWidth){
                    //console.group('loop back');
                    for (var k = i; k >= 0; k--) {
                        //console.log(k);
                        if(1 === OBG.navigationPlus.horizNavItems[k].state){
                            if(!OBG.navigationPlus.horizNavItems[k].active){
                                hideItem(OBG.navigationPlus.horizNavItems[k], true);
                                    break;
                            }
                            if(0 === k){
                                hideItem(OBG.navigationPlus.horizNavItems[i], true);
                            }
                        }
                    };
                    //console.groupEnd();
                };
            }else{
                if(0 === OBG.navigationPlus.horizNavItems[i].state){
                    showItem(OBG.navigationPlus.horizNavItems[i]);
                };
                usedWidth += OBG.navigationPlus.horizNavItems[i].width;
            };
        };
        if(itemsHidden){
            OBG.navigationPlus.$overflow.css('display', '');
            //console.log('more shown');

            for (var i = OBG.navigationPlus.horizNavItems.length - 1; i >= 0; i--) {
                if(hiddenItems[i]){
                    OBG.navigationPlus.$overflowNav.prepend($('<li></li>').prepend(hiddenItems[i].element.clone().css('display', '')));
                }
            };
            OBG.navigationPlus.$overflow.append(OBG.navigationPlus.$overflowNav);
        } else {
            OBG.navigationPlus.$overflow.css('display', 'none');
            //console.log('more hidden');
            OBG.navigationPlus.$overflowToggle.prop('checked', false);
        };
        //console.log('%O', hiddenItems);
        //console.groupEnd();
    };
    OBG.navigationPlus.init = function(){
        OBG.navigationPlus.horizNavItems = [];
        OBG.navigationPlus.$overflow = $('<div class="nav-overflow"><label for="overflowToggle">More</label></div>').prepend(OBG.navigationPlus.$overflowToggle = $('<input type="checkbox" id="overflowToggle" />')).insertAfter(OBG.$horizNav);
        OBG.navigationPlus.$overflowNav = $('<ul></ul>');
        OBG.navigationPlus.overflowWidth = function(){
            var width;

            OBG.navigationPlus.$overflow.css('display', '');
            width = OBG.navigationPlus.$overflow.width() + parseInt(OBG.navigationPlus.$overflow.css('padding-left')) + parseInt(OBG.navigationPlus.$overflow.css('padding-right')) + parseInt(OBG.navigationPlus.$overflow.css('border-left-width')) + parseInt(OBG.navigationPlus.$overflow.css('border-right-width'));
            OBG.navigationPlus.$overflow.css('display', 'none');
            return width+1;
        }();

        OBG.$horizNav.find('li a').each(function(index){
            var $this = $(this);

            OBG.navigationPlus.horizNavItems.push({'element': $this, 'width': $this.width() + parseInt($this.css('padding-left')) + parseInt($this.css('padding-right')), 'state': 1, 'active': $this.closest('li').hasClass('SKNavActive') || $this.closest('li').hasClass('SKNavCurrent'), 'index': index});
        });
    };

    OBG.banner = function($banner, autoPlay){
        var autoPlay = ('boolean' === typeof(autoPlay) ? autoPlay : true),
            bannerPauseClass = 'banner-pause',
            bannerPlayClass = 'banner-play',
            $bannerControls = $('<div class="banner-controls"><div class="banner-pager"></div></div>'),
            $stateControl = $('<span class="state-control ' + (autoPlay ? bannerPauseClass : bannerPlayClass) + '"><span>' + (autoPlay ? 'pause' : 'play') + '</span></span>').appendTo($bannerControls),
            $progressionControls = $('<a class="cycle-prev">previous</a><a class="cycle-next">next</a>').appendTo($bannerControls);

        function updateControls($img, $comment){
            var transform = 'transform',
                top = 'top',
                stateControlHeight = $stateControl.outerHeight(),
                imgHeight,
                commentHeight,
                controlsPosition,
                progressionPostion;

            if($img.length && $comment.length){
                imgHeight = $img.height();
                if(window.Modernizr && Modernizr.csstransforms){
                    $bannerControls.css({transform: 'translateY(' + imgHeight + 'px)'});
                    $progressionControls.css({'display': '', transform: 'translateY(' + (-imgHeight / 2) + 'px)'});
                }else{
                    $bannerControls.css({top: imgHeight + 'px'});
                    $progressionControls.css({'display': '', top: (-imgHeight / 2) + 'px'});
                }
                $stateControl.css({'height': ($comment.height() - 18)});
            }else if($img.length){
                imgHeight = $img.height(),
                controlsPosition = imgHeight - stateControlHeight,
                progressionPostion = (-imgHeight / 2) + stateControlHeight;

                progressionPostion = (progressionPostion > (-stateControlHeight - 10))? (OBG.status.mqs.extraSmall.matches)?-57:-67 : progressionPostion;

                if(window.Modernizr && Modernizr.csstransforms){
                    $bannerControls.css({transform: 'translateY(' + controlsPosition + 'px)'});
                    $progressionControls.css({'display': '', transform: 'translateY(' + progressionPostion + 'px)'});
                }else{
                    $bannerControls.css({top: controlsPosition + 'px'});
                    $progressionControls.css({'display': '', 'top': progressionPostion + 'px'});
                }
                $stateControl.css({'height': ''});
            }else if($comment.length){
                commentHeight = $comment.height()
                if(window.Modernizr && Modernizr.csstransforms){
                    $bannerControls.css({transform: 'translateY(35px)'});
                }else{
                    $bannerControls.css({top: '35px'});
                }
                $progressionControls.css({'display': 'none'});
                $stateControl.css({'height': (commentHeight - 53)});
            }
        };

        OBG.load.push(function(){
            $banner.append($bannerControls).cycle({
                'fx': 'scrollHorz',
                'slides': '> .slide',
                'pauseOnHover': true,
                'swipe': true,
                'paused': !autoPlay,
                'log': false,
                'autoHeight': 'calc', //'container'
                'speed': 1000,
                'timeout': 5000,
                'pager': '> * .banner-pager',
                'prev': '> * .cycle-prev',
                'next': '> * .cycle-next'
            }).data('paused', !autoPlay);
        });

        $banner.on('cycle-initialized', function cycleSetup(){
            var $firstSlide = $(this).find('.cycle-slide-active');

            updateControls($firstSlide.find('img'), $firstSlide.find('.banner-comment'));
        }).on('cycle-resize', function resize(){
            var $this = $(this),
                bannerData = $this.data('cycle.opts'),
                $currentSlide = $(bannerData.slides[bannerData.currSlide]);

            updateControls($currentSlide.find('img'), $currentSlide.find('.banner-comment'));
        }).on('cycle-before', function cycleBefore(event, optionHash, outgoingSlideEl, incomingSlideEl, forwardFlag){
            var $newSlide = $(incomingSlideEl);

            updateControls($newSlide.find('img'), $newSlide.find('.banner-comment'));
        }.debounce(5)).on('click', '.state-control',  function(event){
            var $this= $(this);

            if($this.hasClass(bannerPauseClass)){
                $banner.cycle('pause').data('paused', $banner.is( '.cycle-paused' ));
                $this.removeClass(bannerPauseClass).addClass(bannerPlayClass).html('<span>play</span>');
            }else{
                $banner.cycle('resume').data('paused', $banner.is( '.cycle-paused' ));
                $this.removeClass(bannerPlayClass).addClass(bannerPauseClass).html('<span>pause</span>');
            }

            event.preventDefault();
        });
    };

    OBG.init();
})(window, document, jQuery);

