import EditorAdapter from './EditorAdapter';

console.log('hello from index.js');

const editorElement = document.getElementById('richTextEditor');

if (editorElement) {
  new EditorAdapter();
}


