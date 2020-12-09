(function() {
  console.log('script loaded');

  var observe;
  if (window.attachEvent) {
    observe = function (element, event, handler) {
      element.attachEvent('on'+event, handler);
    };
  }
  else {
    observe = function (element, event, handler) {
      element.addEventListener(event, handler, false);
    };
  }

  function init () {
    var text = document.getElementById('edit-post-body');
    if (!text) return;

    console.log('text', text);

    function resize () {
      text.style.height = 'auto';
      text.style.height = text.scrollHeight+'px';
    }
    /* 0-timeout to get the already changed text */
    function delayedResize () {
      window.setTimeout(resize, 0);
    }
    observe(text, 'change',  resize);
    observe(text, 'cut',     delayedResize);
    observe(text, 'paste',   delayedResize);
    observe(text, 'drop',    delayedResize);
    observe(text, 'keydown', delayedResize);

    text.focus();
    text.select();
    resize();
  }

  function previewPostBody () {
    var edit = document.getElementById('edit-post-body');
    var preview = document.getElementById('preview-post-body');

    preview.appendChild(document.createTextNode(edit.innerHTML))
    edit.style.display = 'none';
    preview.style.display = 'block';
  }

  function editPostBody () {
    var edit = document.getElementById('edit-post-body');
    var preview = document.getElementById('preview-post-body');

    console.log('editPostBoy')
    edit.style.display = 'block';
    preview.style.display = 'none';
  }

  var editButton = document.getElementById('edit-post-body-button')
  editButton.addEventListener('click', editPostBody)

  var previewButton = document.getElementById('preview-post-body-button')
  previewButton.addEventListener('click', previewPostBody)

  init();
})()
