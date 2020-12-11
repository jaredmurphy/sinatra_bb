import Quill from 'quill';

class EditorAdapter {
  constructor() {
    this.toolbarOptions = [
      ['bold', 'italic', 'strike'],
      [{ 'header': 1 }, { 'header': 2 }],
      ['link', 'image'],
      [{ 'indent': '-1'}, { 'indent': '+1' }],
      ['clean'],
    ];

    this.editor = new Quill('#editor', {
      theme: 'snow',
      modules: {
        toolbar: this.toolbarOptions,
      },
    });

    const hiddenInput = document.getElementById('hidden-post-body-input');
    const postForm = document.getElementById('post-form');

    postForm.addEventListener("submit", e => {
      const quillValue = editor.firstChild.innerHTML;
      hiddenInput.value = quillValue;
    });
  }
}

export default EditorAdapter;
