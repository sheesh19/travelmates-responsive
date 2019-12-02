import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import "../plugins/file-input";

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import "../plugins/date-picker";

import { initAutoCompleteField } from '../plugins/places';

initAutoCompleteField('#event_location');

import { selectize } from '../plugins/select';

selectize('#event_activity_id');

// import "../plugins/multi-step-form";

import { initMultiStep } from '../plugins/multi-step-form'

initMultiStep('.step-content');




