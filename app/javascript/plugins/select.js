import 'selectize/dist/js/selectize.min.js';
import 'selectize/dist/css/selectize.css';

export const selectize = (selector) => {
  $(selector).selectize({
    create: true,
    sortField: 'text'
  });
}