/*!
 * Client Side Validations Simple Form JS (Bootstrap 4) - v0.1.1 (https://github.com/DavyJonesLocker/client_side_validations-simple_form)
 * Copyright (c) 2020 Geremia Taglialatela, Brian Cardarella
 * Licensed under MIT (https://opensource.org/licenses/mit-license.php)
 */

(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('jquery'), require('@client-side-validations/client-side-validations')) :
  typeof define === 'function' && define.amd ? define(['jquery', '@client-side-validations/client-side-validations'], factory) :
  (global = global || self, factory(global.$, global.ClientSideValidations));
}(this, (function ($, ClientSideValidations) { 'use strict';

  $ = $ && $.hasOwnProperty('default') ? $['default'] : $;
  ClientSideValidations = ClientSideValidations && ClientSideValidations.hasOwnProperty('default') ? ClientSideValidations['default'] : ClientSideValidations;

  ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] = {
    add: function add(element, settings, message) {
      this.wrapper(settings.wrapper).add.call(this, element, settings, message);
    },
    remove: function remove(element, settings) {
      this.wrapper(settings.wrapper).remove.call(this, element, settings);
    },
    wrapper: function wrapper(name) {
      return this.wrappers[name] || this.wrappers["default"];
    },
    wrappers: {
      "default": {
        add: function add(element, settings, message) {
          var wrapperElement = element.parent();
          var errorElement = wrapperElement.find(settings.error_tag + '.invalid-feedback');

          if (!errorElement.length) {
            errorElement = $('<' + settings.error_tag + '/>', {
              "class": 'invalid-feedback',
              text: message
            });
            wrapperElement.append(errorElement);
          }

          wrapperElement.addClass(settings.wrapper_error_class);
          element.addClass('is-invalid');
          errorElement.text(message);
        },
        remove: function remove(element, settings) {
          var wrapperElement = element.parent();
          var errorElement = wrapperElement.find(settings.error_tag + '.invalid-feedback');
          wrapperElement.removeClass(settings.wrapper_error_class);
          element.removeClass('is-invalid');
          errorElement.remove();
        }
      }
    }
  };

})));
