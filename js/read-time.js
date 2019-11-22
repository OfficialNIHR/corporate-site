      var wordsInPost = wordCount(document.querySelectorAll(".html-document-text"));

      function wordCount(words) {
          var count = 0;
          for (var i = 0; i < words.length; i++) {
              count += words[i].textContent.split(' ').length;

          }
          return count;
      }
      document.getElementById('insert-time').innerHTML = (Math.ceil((wordsInPost) / 200));