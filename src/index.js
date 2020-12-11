import EditorAdapter from './EditorAdapter';

console.log('hello from index.js');

const editorElement = document.getElementById('editor');

if (editorElement) {
  new EditorAdapter();
}


