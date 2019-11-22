//Polyfill for toISOString
if (!Date.prototype.toISOString) {
    (function () {

        function pad(number) {
            if (number < 10) {
                return '0' + number;
            }
            return number;
        }

        Date.prototype.toISOString = function () {
            return this.getUTCFullYear() +
                '-' + pad(this.getUTCMonth() + 1) +
                '-' + pad(this.getUTCDate()) +
                'T' + pad(this.getUTCHours()) +
                ':' + pad(this.getUTCMinutes()) +
                ':' + pad(this.getUTCSeconds()) +
                '.' + (this.getUTCMilliseconds() / 1000).toFixed(3).slice(2, 5) +
                'Z';
        };

    }());
}

(function ($) {

    $(document).ready(function () {

        var anchor = null;
        var feeds = [];

        var $feedFilter = $('<div class="SKCalendarFeedFilter"></div>');

        if (fullCalendarEventSources.length > 1) {
            var $ul = $('<ul></ul>');
            $ul.appendTo($feedFilter);

            $.each(fullCalendarEventSources, function (i, feed) {
                $ul.append('<li><input id="feeds' + i + '" type="checkbox" name="feeds" value="' + feed.postTypeID + '"><label for="feeds' + i + '">' + feed.name + '</label></li>')
                feeds.push(feed.postTypeID.toString());
            });

            $feedFilter
                .insertBefore('.SKCalendar')
                .on('change', 'input[name="feeds"]', function () {
                    feeds = [];
                    $.each($('input[name="feeds"]:checked'), function (i, value) {
                        feeds.push($(this).val());
                    });
                    var url = window.location.href.split('#')[0] + anchor + '!' + feeds.join();
                    window.location.href = url;
                    window.location.reload();
                });
        } else if (fullCalendarEventSources.length == 1) {
            feeds.push(fullCalendarEventSources[0].postTypeID.toString());
        }

        var defaultView;
        var defaultDate;

        //Recover current view and date period from URL/browser history.
        if (window.location.href.indexOf('#') > 0) {
            var anchor = window.location.href.split('#')[1];
            var parts = anchor.split('!');
            if (parts[0] == 'view') {
                defaultView = parts[1];
                var d = new Date();
                d.setTime(parts[2]);
                defaultDate = d.toISOString();
                var feedsCSV = parts[3].split(',');
                feeds = [];
                $.each(feedsCSV, function (i, value) {
                    feeds.push(value);
                });
            }
        }

        var sources = [];

        $.each(fullCalendarEventSources, function (i, feed) {
            if ($.inArray(feed.postTypeID.toString(), feeds) > -1) {
                sources.push(feed);
                $feedFilter.find('input[name="feeds"][value="' + feed.postTypeID + '"]').prop('checked', true);
            };
        });

        var fullCalendarOpts = {
            firstDay: 1, //Sunday
            timeFormat: 'H:mm',
            eventSources: sources,
            defaultView: defaultView,
            defaultDate: defaultDate,
            eventRender: function (event, element) {
                var oHref = element.attr('href');
                console.log(event.PostID + ": " + event.url);

                /*
                if(oHref!=undefined){
                	var oHrefSpl = oHref.split('/');
                	var oHrefSplP = oHrefSpl.pop();
                	element.attr('href','/events/event-details/?field_PostID='+oHrefSplP);
                } else {
                	$(event.CustomFields).each(function(key, value){
                		if(value.Name=='ParentEvent' && value.Values.length > 0 && value.Values[0].Item.length > 0){
                			element.attr('href',"/events/event-details/?field_PostID="+value.Values[0].Item);
                		}
                	});
                }
                */

                if (event.Category && event.Category.indexOf(',') > 0) {
                    var cL = event.Category.substring(0, event.Category.indexOf(','));
                    cL = cL.replace(/\s+/g, '');
                    element.addClass(cL);
                } else if (event.Category) {
                    var cL = event.Category;
                    cL = cL.replace(/\s+/g, '');
                    element.addClass(cL);
                }
                $(event.RelatedItems).each(function (key, value) {
                    if (value.PostType == 'Event Sessions') {
                        element.addClass("parentEvent");
                    }
                });
            },
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            viewRender: function (view, element) {
                if (history.pushState) {
                    anchor = '#view!' + view.name + '!' + view.intervalStart;
                    var url = window.location.href.split('#')[0] + anchor + '!' + feeds.join();
                    history.pushState(null, null, url);
                }
            },
            columnFormat: {
                month: 'dddd', // Monday, Wednesday, etc
                week: 'dddd, MMM D', // Monday 9/7
                day: 'dddd, MMM D' // Monday 9/7
            },
            eventLimit: 6,
            dayPopoverFormat: "dddd, Do MMMM",
            businessHours: {
                dow: [1, 2, 3, 4, 5]
            }
        };

        $('.SKCalendar').empty().fullCalendar(fullCalendarOpts);

    });

})(jQuery);