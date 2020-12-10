(function() {
  console.log('script loaded');

  var editor = document.getElementById('editor');

  if (editor) {
    var postToolbarOptions = [
      ['bold', 'italic', 'strike'],
      [{ 'header': 1 }, { 'header': 2 }],
      ['link', 'image'],
      [{ 'indent': '-1'}, { 'indent': '+1' }],
      ['clean'],
    ];

    var postQuill = new Quill('#editor', {
      theme: 'snow',
      modules: {
        toolbar: postToolbarOptions,
      },
    });

    var hiddenInput = document.getElementById('hidden-post-body-input');
    var postForm = document.getElementById('post-form');

    postForm.addEventListener("submit", e => {
      var quillValue = editor.firstChild.innerHTML;
      hiddenInput.value = quillValue;
    });
  }
})()
