class EditorAdapter {
  constructor() {
    const editor = document.getElementById('richTextEditor');
    const hiddenInput = document.getElementById('hidden-post-body-input');
    const postForm = document.getElementById('post-form');

    postForm.addEventListener("submit", e => {
      const content = editor.contentWindow.document.body.innerHTML;
      hiddenInput.value = content;
    });
  }
}

export default EditorAdapter;
