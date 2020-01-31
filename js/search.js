window.searchResultsPage = {

    searchAPI: 'https://search.nihr.ac.uk/api/nihr-search',
    searchAllAPI: 'https://search.nihr.ac.uk/api/search',
    //searchAPI: 'http://srv01626.soton.ac.uk:8102/api/nihr-search',
    //searchAllAPI: 'http://srv01626.soton.ac.uk:8102/api/search',
    recordsPerPage: 15,
    showcasePageURL: 'https://www.nihr.ac.uk/explore-nihr/',
    filters: ['doc_type', 'content_type'],


    init: function () {
        searchResultsPage.nihrOnly = true;

    },

    loadData: function (criteria, pushToHistory) {

        if (searchResultsPage.nihrOnly) {
            url = searchResultsPage.searchAPI + '?criteria=' + criteria
        } else {
            url = searchResultsPage.searchAllAPI + '?criteria=' + criteria
        }

        //append any filters clicked
        var filterUrl = "";
        this.filters.forEach(function (filter) {
            var stateKey = "selections_" + filter;
            var selections = searchResultsPage[stateKey];
            if (selections && typeof selections !== 'undefined') {
                selections.forEach(function (label) {
                    filterUrl = filterUrl + "&" + "filter=" + filter + encodeURIComponent(":\"" + label + "\"")
                })
            }
        })

        if (filterUrl) {
            url += filterUrl;
        }


        $.ajax({
            type: "GET",
            url: url,
            data: {},
            contentType: 'application/json',
            cache: false,
            success: function (data) {

                // Put showcase pages at the top of the list

                // check for showcase pages from the bottom of the list up, remove them and insert at front.
                var i = data.documents.length - 1;
                var showcasePageCount = 0;
                while ((i >= 0 && i > showcasePageCount)) {
                    var doc = data.documents[i];
                    if (doc.url.indexOf(searchResultsPage.showcasePageURL) !== -1) {
                        // Remove the showcase page from the results.
                        data.documents.splice(i, 1);
                        // Insert at the front of the list
                        data.documents.unshift(doc);
                        showcasePageCount++;
                    } else {
                        i--;
                    }
                }

                searchResultsPage.results = data;
                searchResultsPage.displayPage(1, pushToHistory);

                // Save the data to browser session storage
                sessionStorage.removeItem('nihr_search_data');
                try {
                    sessionStorage.setItem('nihr_search_data', JSON.stringify(data));
                } catch (e) {
                    console.log("Local Storage is full, Please empty data");
                    sessionStorage.clear();
                }

            },

            error: function (xhr, ajaxOptions, thrownError) {
                console.log("Error ", xhr);

            }


        });

    },

    loadAllData: function (criteria) {
        searchResultsPage.nihrOnly = false;
        searchResultsPage.loadData(criteria);
    },

    displayPage: function (pageNum, pushToHistory) {

        // Set pushToHistory default to true if not passed in as an argument
        if (typeof pushToHistory === 'undefined') {
            pushToHistory = true;
        }

        var numFound = searchResultsPage.results.documents.length;
        var numPages = Math.ceil(numFound / this.recordsPerPage);
        var startRecord = (pageNum - 1) * this.recordsPerPage;
        var endRecord = (pageNum * this.recordsPerPage);
        if ((pageNum == numPages) && (endRecord < numFound)) {
            endRecord = numFound;
        }

        // Get the data for this page		
        var pageData = [];
        var i;
        for (i = startRecord; i < endRecord; i++) {
            var doc = searchResultsPage.results.documents[i];
            if (doc) {
                pageData.push(doc);
            }
        }

        this.clearResults();
        this.renderResults(pageData, searchResultsPage.results.numFound, pageNum, numPages);

        // Save the page number and page click to the browser history.
        if (pushToHistory) {
            // Save to browser history
            var stateObj = {
                page: pageNum,
                criteria: searchResultsPage.criteria
            };

            history.pushState(stateObj, "page ", null);
        }

    },

    renderResults: function (documents, actualNumFound, pageNum, numPages) {
        var message = 'Your search returned ' + actualNumFound + ' records';
        if (actualNumFound === 0) {
            message = 'Your search found no matching records';
        }

        var html = '<h2>' +
            message + '</h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
        if (this.nihrOnly) {
            html += '<p class="federated-search">You can use the \'type of document\' and \'type of content\' filters to refine your results. If you want to extend your query to search all websites on the NIHR domain, click the button below.</p>';
            html += '<p class="federated-search"><a href="#" class="btn" onclick="searchResultsPage.loadAllData(\'' + searchResultsPage.criteria + '\');return false;";>search all NIHR websites</a></p>';
        }


        documents.forEach(function (document) {

            // Work out the font awesome icon for the document type.
            var font = ""
            switch (document.doc_type) {
                case 'pdf':
                    font = 'far fa-file-pdf'
                    break;
                case 'image':
                    font = 'far fa-file-image'
                    break;
                case 'document':
                    font = 'far fa-file-word'
                    break;
                case 'spreadsheet':
                    font = 'far fa-file-excel'
                    break;
                case 'web page':
                    font = 'fas fa-globe'
                    break;
                case 'sound':
                    font = 'far fa-file-audio'
                    break;
                case 'video':
                    font = 'far fa-file-video'
                    break;
                case 'powerpoint':
                    font = 'far fa-file-powerpoint'
                    break;
                default:
                    font = ""
            }

            var icon = font.length > 0 ? '<span class="' + font + '"></span>' : "";

            var showcaseStyle = '';
            if (document.url.indexOf(searchResultsPage.showcasePageURL) !== -1) {
                showcaseStyle = ' showcase';
            }

            var snippets = document.highlighting.split('...');
            var snippetStr = document.highlighting;
            if (snippets.length > 1) {
                snippetStr = '';
                for (var i = 0; i < snippets.length; i++) {
                    if (i > 0) {
                        snippetStr += "...<br>";
                    }
                    snippetStr += snippets[i];
                }
            }



            // Build up the individual result output string
            html = html +
                '<div class="result-row' + showcaseStyle + '" >' +
                '<div class="result-title" ><a class="std-link" href="' + document.url + '">' + document.title + '</a>' +
                '<span class="link-type-icon">' + icon + '</span>' +
                '</div>' +
                '<div class="result-url" >' +
                '<a class="std-link" href="' + document.url + '">' + smartTrim(document.url, 100) + '</a>' +
                '</div>'
                //+ '<div class="result-snippet">' + document.highlighting + '</div>'	
                +
                '<div class="result-snippet">' + snippetStr + '</div>' +
                '</div>';

        });

        $("#search-results").append(html);
        $('.showcase:gt(0)').wrap('<div class="tab-content aos-init aos-animate" data-aos="fade-up"></div>');
        $('.tab-content').wrapAll('<div class="tab" data-aos="fade-up"></div>');
        $('.tab').prepend('<input id="tab-1" name="tabs" type="checkbox" aria-checked="false" /><label for="tab-1" class="accordion-body-tab"><h3 class="btn">More NIHR services...</h3></label>');
        $('.result-row').not('.showcase').first().prepend('<h2 class="mb1 mt1 search-heading">Your results</h2>');
        $('.showcase').first().before('<h2 class="mt1">NIHR services</h2><p>The NIHR offers the funding, people, facilities, and technology that you need. Explore NIHR to find out how we can help you.</p>');

        // Do the page numbers
        this.pagination(pageNum, numPages);

        this.renderFilters(searchResultsPage.results.facets, searchResultsPage.results.numFound);

        // Scroll back to the top of the window.
        var element = document.getElementById("searchInputForm");
        element.scrollIntoView({
            behavior: "smooth",
            block: "end",
            inline: "nearest"
        });




    },

    renderFilters: function (facets, actualNumFound) {

        if (actualNumFound === 0) {
            // draw empty filter containers
            $("#filter-container").text('');
            return;
        }

        this.renderFilter(facets, 'doc_type', 'Type of document');
        this.renderFilter(facets, 'content_type', 'Type of content');

    },

    renderFilter: function (facets, facet_type, title) {
        var html = "<div>";
        html += '<h2 class="rounded-header rounded-header-style1 rounded-header-rhs width100">' + title + '</h2>';
        facets.forEach(function (facet) {
            if (facet.field === facet_type) {
                // Got the facet type, list the individual items as checkboxes.
                html += '<ul class="filter-list">';
                facet.tags.forEach(function (tag, index) {
                    if (tag.display) {

                        html += '<li>';
                        html += '<input type="checkbox" class="filter-checkbox" id="filtercb-' + facet_type + index + '" ';

                        html += 'onchange="searchResultsPage.handleFilterClicked(\'' + facet_type + '\', \'' +
                            tag.display + '\', \'' + tag.value + '\' );return false;"';

                        if (searchResultsPage.filterIsChecked(facet_type, tag.display)) {
                            // this tag is selected
                            html += ' checked';
                        }

                        html += '>';

                        html += '<label class="checkbox-label" for="filtercb-' + facet_type + index + '"><span class="filter-label">' +
                            tag.display;

                        html += '&nbsp;(' + tag.value + ')';
                        html += '</span></label></li>';
                    }
                });
            }
        });

        html += "</ul></div>";
        $("#filter-container").append(html);

    },

    handleFilterClicked: function (filterType, filterName, filterCount) {
        // Don't do anything if it's got a count of 0.
        if (filterCount === 0) {
            return
        }

        var stateKey = "selections_" + filterType;
        var selections = searchResultsPage[stateKey];
        if (selections === null || typeof selections === 'undefined') {
            selections = [];
            searchResultsPage[stateKey] = selections;
        }

        if (selections.indexOf(filterName) >= 0) {
            var index = selections.indexOf(filterName);
            selections.splice(index, 1);
        } else {
            selections.push(filterName);
        }
        searchResultsPage[stateKey] = selections;

        //this.requestSearchUpdate();
        this.loadData(searchResultsPage.criteria);


    },

    filterIsChecked: function (filterType, filterName) {
        var stateKey = "selections_" + filterType;
        var selections = searchResultsPage[stateKey];
        if (selections === null || typeof selections === 'undefined') {
            return
        }

        if (selections.indexOf(filterName) >= 0) {
            return true;
        }
        return false;

    },

    resetFilters: function () {
        this.filters.forEach(function (filter) {
            var stateKey = "selections_" + filter;
            searchResultsPage[stateKey] = [];
        })

    },

    pagination: function (pageNum, numPages) {
        var currPage = parseInt(pageNum, 10);
        var totPages = parseInt(numPages, 10);
        if (isNaN(currPage)) {
            return
        }
        if (isNaN(totPages)) {
            return
        }

        // Do the Pages links.
        var html = '<div class="pagination">';
        // Handle the Previous
        if (currPage > 1) {
            var previousPage = currPage - 1;
            html += '<a aria-label="previous-page" onclick="searchResultsPage.displayPage(\'' + previousPage + '\');return false;";>&laquo;</a>';
        }

        if (currPage <= 4) {
            for (var i = 1;
                (i <= totPages && i <= 5); i++) {
                var pageHtmlStr = i;
                if (i == currPage) {
                    // Current page is Strong format
                    html += '<a href="#" aria-label="current-page" class="active">' + i + '</a>';
                } else {
                    html += '<a href="#" aria-label="page-' + i + '" onclick="searchResultsPage.displayPage(\'' + i + '\');return false;";>' + i + '</a>';
                }
            }
        } else {
            html += '<a href="#" aria-label="first-page" onclick="searchResultsPage.displayPage(\'' + 1 + '\');return false;";>1</a>';
            html += '<a href="#" aria-label="page-' + (currPage - 1) + '" onclick="searchResultsPage.displayPage(\'' + (currPage - 1) + '\');return false;";>' + (currPage - 1) + '</a>';
            html += '<a href="#" aria-label="current-page" class="active">' + currPage + '</a>';
            if (currPage < totPages) {
                html += '<a href="#" aria-label="page-' + (currPage + 1) + '" onclick="searchResultsPage.displayPage(\'' + (currPage + 1) + '\');return false;";>' + (currPage + 1) + '</a>';
            }
        }

        if (currPage < totPages) {
            var nextPage = currPage + 1;
            html += '<a aria-label="next-page" onclick="searchResultsPage.displayPage(\'' + nextPage + '\');return false;";>&raquo;</a>';
        }

        html += '</div>';

        $('#search-results').append(html);


    },

    clearResults: function () {
        $("#search-results").text("");
        $("#filter-container").text("");
    }

};

function smartTrim(string, maxLength) {
    if (!string) return string;
    if (maxLength < 1) return string;
    if (string.length <= maxLength) return string;
    if (maxLength == 1) return string.substring(0, 1) + '...';

    var midpoint = Math.ceil(string.length / 2);
    var toremove = string.length - maxLength;
    var lstrip = Math.ceil(toremove / 2);
    var rstrip = toremove - lstrip;
    return string.substring(0, midpoint - lstrip) + '...' +
        string.substring(midpoint + rstrip);
}


function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
};

window.onload = function () {
    // Set up a jQuery event handler for the search for submit.
    /*
    
    Left this code in in case you want to re-establish the local submit handler rather than rely 
    on the page reload done by the default form submission. 
    Submitting the form and reloading the page was done so that url would have search parameters that could be tracked by Google.
    
    $( "#searchInputForm" ).submit(function( event ) {
      event.preventDefault();
      var criteria = $( "input:first" ).val();
      if ( criteria != 'undefined') {
    	searchResultsPage.nihrOnly = true;
    	searchResultsPage.resetFilters();
    	searchResultsPage.criteria = encodeURIComponent(criteria);
    	searchResultsPage.loadData(searchResultsPage.criteria);
      }
    });
    */


    /*
    See if there's a search parameter on the end of the URL. If so try and perform a search using that string.
    This is to cater for when search is entered on all the other pages.
    */
    // Get the current value from the search input field
    var searchInputValue = $("#searchInputForm").val();
    // Get the search criteria from the URL
    var searchParam = getUrlParameter('search');
    // If the parameter 'search' has been defined and the search input field doesn't have anything in it then search for the data automatically.
    if ((typeof searchParam !== 'undefined' && searchParam.length !== 0) && (typeof searchInputValue === 'undefined' || searchInputValue.length == 0)) {
        //set the field value
        $("#searchInputForm").val(searchParam);
        // load the data
        searchResultsPage.nihrOnly = true;
        searchResultsPage.criteria = searchParam;
        searchResultsPage.loadData(searchResultsPage.criteria, false);

        // Save to browser history
        var stateObj = {
            page: 1,
            criteria: searchResultsPage.criteria
        };

        history.replaceState(stateObj, "", null);



    } else {
        // If there's a value in the search field then assume we've just pressed the back button in the browser.
        var criteria = $("#searchInputForm").val();
        if (typeof criteria !== 'undefined' && criteria.length > 0) {

            /* 
            Going to check whether the page has been loaded via the browser back button.
            To do this I am going to see if the browser has remembered the search criteria in the input field on the search form,
            and compare this to the value I've saved in the history state object. If they match I'm assuming the back button
            has been used to come from another page and load up the search data from sessionStorage.	
            */
            var currentState = history.state;
            if (currentState) {
                var page = currentState.page;
                var prevCriteria = currentState.criteria;
                criteria = encodeURIComponent(criteria);
                if (prevCriteria === criteria) {
                    // criterias match the one displayed in the input field populated via the back button
                    // so go on and display the page in history.
                    // load data from session storage
                    var persistState = sessionStorage.getItem('nihr_search_data');
                    if (persistState) {
                        try {
                            searchResultsPage.results = JSON.parse(persistState);
                            searchResultsPage.displayPage(page, false);
                        } catch (e) {
                            console.log("caught error " + e)
                            // is not json
                        }
                    }
                }
            }
        }
    }

};

window.onpopstate = function (event) {
    if (event.state == null || typeof event.state === 'undefined' || typeof event.state.page === 'undefined') {
        return;
    }

    searchResultsPage.displayPage(event.state.page, false);

};