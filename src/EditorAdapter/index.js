//import Quill from 'quill';
//import ImageResize from "quill-image-resize-module--fix-imports-error";

class EditorAdapter {
  constructor() {
    //this.toolbarOptions = [
      //[{ 'header': 1 }, { 'header': 2 }],
      //['bold', 'italic', 'strike'],
      //['link', 'image'],
      //[{ 'indent': '-1'}, { 'indent': '+1' }],
      //[{ 'align': 'start'}, { 'align': 'center' }],
      ////[{ 'align': '' }, { 'align': 'center' }, { 'align': 'right' }, { 'align': 'justify' }]
      //['clean'],
    //];

    //Quill.register("modules/imageResize", ImageResize);

    //this.editor = new Quill('#editor', {
      //theme: 'snow',
      //modules: {
        //toolbar: this.toolbarOptions,
        //imageResize: {},
      //},
    //});

    const editor = document.getElementById('richTextEditor');
    const hiddenInput = document.getElementById('hidden-post-body-input');
    const postForm = document.getElementById('post-form');

    postForm.addEventListener("submit", e => {
      const quillValue = editor.firstChild.innerHTML;
      hiddenInput.value = quillValue;
    });
  }
}

export default EditorAdapter;
