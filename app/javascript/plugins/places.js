import places from 'places.js';

export const initAutoCompleteField = (selector) => {  
  var placesAutocomplete = places({
    appId: 'plVEFGQAEIH9',
    apiKey: '9928c38263c2f4b47dca5e9ff29b738a',
    container: document.querySelector('#event_location'),
    routing: true,
    templates: {
      value: function(suggestion) {
        return suggestion;
      }
    }
  });
  // placesAutocomplete.search();
  placesAutocomplete.on('change', e => console.log(e.suggestion));
};