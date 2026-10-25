___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Limy Ecommerce Pixel",
  "categories": [
    "ANALYTICS",
    "MARKETING"
  ],
  "brand": {
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAYAAADgKtSgAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAOdEVYdFNvZnR3YXJlAEZpZ21hnrGWYwAAAZ5JREFUeAGtVMtxgzAQFR/PcOSYo3LLkRIogQ5MB7YrCD7mlBLiVJB0gFOB4wpwB3FuGYZP3jKrGSEDNuA3s8ar1T7tTxLCgOM4qW3bNcuB9fVisQjEXBjkpmSwxyO4nBhOAUTi/wPWQoiEbLD2Utf10bKsP+hPEB8SQSefX9i+B9n7osRBH67rhtpWnwPJ1B7YX/nAq+QHyM8tpcBaots9z5OD5FwKvebmYS0SarCWRdaZQR85RytpUvRSQJ41d6ls5DeWXCfZaf14M2wqw2QKudq77jqAG92st+o/hpxAE6Qi5WkRhl86mdyMlLLRDm3W1G22xQSUZbnDZ8sqNdgvimKPy7VnezSZnFBVVcJkdLlUed75u5xFTgB5Ez2egZgaiYg/2SRJZpHrpcjznGp/hjTvDbIJZpETVPSCSwEc6QfZSLfPCcYVTl+KK8A+9Zdqn0JX777vDvgFmuNNwP5Q1y/I0ZQNZtYXI4DJodFbgfwL0Se0hn6cLi7RFIAwUi+p6IqcZ/UspsE3vg0sjvpeOKFEj0qhyLfifmhl/g86kcf5SCWKWQAAAABJRU5ErkJggg\u003d\u003d",
    "id": "brand_dummy",
    "displayName": "Limy.ai"
  },
  "description": "Use the Limy Ecommerce Pixel template to track AI-referred website visits by automatically detecting and measuring traffic from ChatGPT, Perplexity, Gemini, and other AI platforms.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "token",
    "displayName": "Limy Token",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^(\\{\\{.+\\}\\}|lmy_.+)$"
        ],
        "errorMessage": "Token must start with lmy_ (or be a GTM variable)."
      }
    ],
    "help": "Your Limy token (starts with \u003ccode\u003elmy_\u003c/code\u003e)."
  },
  {
    "type": "SELECT",
    "name": "eventType",
    "displayName": "Event Type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "initiate",
        "displayValue": "Initiate (Default)"
      },
      {
        "value": "track",
        "displayValue": "Track Event"
      }
    ],
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "initiate"
  },
  {
    "type": "SELECT",
    "name": "eventName",
    "displayName": "Event Name",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "lmy_purchase",
        "displayValue": "Purchase"
      },
      {
        "value": "lmy_add_to_cart",
        "displayValue": "Add to Cart"
      },
      {
        "value": "lmy_begin_checkout",
        "displayValue": "Begin Checkout"
      }
    ],
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "lmy_purchase",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "equals": "track",
        "type": "EQUALS",
        "paramValue": "track"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "items",
    "displayName": "Items",
    "simpleValueType": true,
    "defaultValue": "ecommerce.items",
    "help": "Your name for the products list in the data layer, for example <code>ecommerce.items</code>.",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "equals": "track",
        "type": "EQUALS",
        "paramValue": "track"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "lmy_name",
    "displayName": "Product Name",
    "simpleValueType": true,
    "defaultValue": "item_name",
    "help": "Your name for the product name inside one product, for example <code>item_name</code>.",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "equals": "track",
        "type": "EQUALS",
        "paramValue": "track"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "lmy_price",
    "displayName": "Price",
    "simpleValueType": true,
    "defaultValue": "price",
    "help": "Your name for the price of one unit inside one product, for example <code>price</code>.",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "equals": "track",
        "type": "EQUALS",
        "paramValue": "track"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "lmy_product_id",
    "displayName": "Product ID",
    "simpleValueType": true,
    "defaultValue": "item_id",
    "help": "Your name for the product ID inside one product, for example <code>item_id</code>.",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "equals": "track",
        "type": "EQUALS",
        "paramValue": "track"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "lmy_quantity",
    "displayName": "Quantity",
    "simpleValueType": true,
    "defaultValue": "quantity",
    "help": "Your name for the quantity inside one product, for example <code>quantity</code>.",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "equals": "track",
        "type": "EQUALS",
        "paramValue": "track"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const createArgumentsQueue = require('createArgumentsQueue');
const copyFromWindow = require('copyFromWindow');
const injectScript = require('injectScript');
const getType = require('getType');
const copyFromDataLayer = require('copyFromDataLayer');

const SDK_URL = 'https://sdk.getlimy.ai/p/limy-analytics.min.js';
// Capture load state BEFORE createArgumentsQueue defines window.limy
const isSdkLoaded = getType(copyFromWindow('limy')) === 'function';
const limy = createArgumentsQueue('limy', 'limy.q');

// Initialize if the SDK isn't already loaded
if (!isSdkLoaded && data.token) {
  limy('initiate', data.token);
}

const toProducts = function(value) {
  if (getType(value) === 'array') return value;
  if (getType(value) === 'object') return [value];
  return [];
};

const readField = function(product, fieldName) {
  return fieldName.split('.').reduce(function(value, key) {
    return value ? value[key] : undefined;
  }, product);
};

// Trigger custom events based on user selection
if (data.eventType === 'track' && data.eventName) {
  const products = toProducts(copyFromDataLayer(data.items || 'ecommerce.items'));
  const items = products.map(function(product) {
    return {
      lmy_name: readField(product, data.lmy_name || 'item_name'),
      lmy_price: readField(product, data.lmy_price || 'price'),
      lmy_product_id: readField(product, data.lmy_product_id || 'item_id'),
      lmy_quantity: readField(product, data.lmy_quantity || 'quantity')
    };
  });

  limy('track', data.eventName, { items: items });
}

// Fallbacks prevent sandbox crashes during manual testing
const onSuccess = data.gtmOnSuccess || function() {};
const onFailure = data.gtmOnFailure || function() {};

injectScript(SDK_URL, onSuccess, onFailure, 'limy_sdk');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "limy"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "limy.q"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://sdk.getlimy.ai/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: initiates and loads the SDK on a fresh page
  code: |-
    const mockData = { token: 'lmy_test' };
    let initiated = null;
    mock('copyFromWindow', () => undefined);
    mock('createArgumentsQueue', (fnKey, arrKey) => {
      return (cmd, a) => { if (cmd === 'initiate') initiated = a; };
    });

    runCode(mockData);
    assertThat(initiated).isEqualTo('lmy_test');
    assertApi('injectScript').wasCalled();
- name: does not re-initiate when the SDK is already loaded
  code: "const mockData = { token: 'lmy_test' };\nlet initiateCalls = 0;\nmock('copyFromWindow',\
    \ () => () => {});\nmock('createArgumentsQueue', () => { \n  return (cmd) => {\
    \ if (cmd === 'initiate') initiateCalls++; }; \n});\nrunCode(mockData);\nassertThat(initiateCalls).isEqualTo(0);\n\
    assertApi('injectScript').wasCalled();"
- name: maps products from the customer's own list and field names
  code: |-
    const mockData = {
      token: 'lmy_test',
      eventType: 'track',
      eventName: 'lmy_purchase',
      items: 'avocodo',
      lmy_name: 'title',
      lmy_price: 'cost.amount',
      lmy_product_id: 'sku',
      lmy_quantity: 'qty'
    };
    let trackedEventName = null;
    let eventProps = null;
    mock('copyFromWindow', () => undefined);
    mock('copyFromDataLayer', (key) => {
      if (key === 'avocodo') {
        return [
          { sku: 'AVO1', title: 'Avocado', cost: { amount: 5 }, qty: 2 },
          { sku: 'AVO2', title: 'Big Avocado', cost: { amount: 7 }, qty: 1 }
        ];
      }
      return undefined;
    });
    mock('createArgumentsQueue', (fnKey, arrKey) => {
      return (cmd, arg1, arg2) => {
        if (cmd === 'track') { trackedEventName = arg1; eventProps = arg2; }
      };
    });
    runCode(mockData);
    assertThat(trackedEventName).isEqualTo('lmy_purchase');
    assertThat(eventProps.items).isEqualTo([
      { lmy_name: 'Avocado', lmy_price: 5, lmy_product_id: 'AVO1', lmy_quantity: 2 },
      { lmy_name: 'Big Avocado', lmy_price: 7, lmy_product_id: 'AVO2', lmy_quantity: 1 }
    ]);
    assertApi('injectScript').wasCalled();
- name: sends a single product as one item
  code: |-
    const mockData = {
      token: 'lmy_test',
      eventType: 'track',
      eventName: 'lmy_add_to_cart',
      items: 'shopify.cartLine',
      lmy_name: 'merchandise.product.title',
      lmy_price: 'merchandise.price.amount',
      lmy_product_id: 'merchandise.product.id',
      lmy_quantity: 'quantity'
    };
    let eventProps = null;
    mock('copyFromWindow', () => undefined);
    mock('copyFromDataLayer', (key) => {
      if (key === 'shopify.cartLine') {
        return { quantity: 2, merchandise: { price: { amount: 349 }, product: { id: '111', title: 'Roof box' } } };
      }
      return undefined;
    });
    mock('createArgumentsQueue', (fnKey, arrKey) => {
      return (cmd, arg1, arg2) => {
        if (cmd === 'track') { eventProps = arg2; }
      };
    });
    runCode(mockData);
    assertThat(eventProps.items).isEqualTo([
      { lmy_name: 'Roof box', lmy_price: 349, lmy_product_id: '111', lmy_quantity: 2 }
    ]);
    assertApi('injectScript').wasCalled();
- name: fires track method with auto-parsed ecommerce data layer
  code: "const mockData = { \n  token: 'lmy_test', \n  eventType: 'track', \n  eventName:\
    \ 'lmy_purchase' \n};\nlet autoEventName = null;\nlet autoProps = null;\nmock('copyFromWindow',\
    \ () => undefined);\nmock('copyFromDataLayer', (key) => {\n  if (key === 'ecommerce.items')\
    \ {\n    return [ { item_name: 'Auto Shirt', price: '19.99', item_id:\
    \ 'AUTO123', quantity: 1 } ];\n  }\n  return undefined;\n});\nmock('createArgumentsQueue',\
    \ (fnKey, arrKey) => {\n  return (cmd, arg1, arg2) => { \n    if (cmd === 'track')\
    \ { autoEventName = arg1; autoProps = arg2; } \n  };\n});\nrunCode(mockData);\n\
    assertThat(autoEventName).isEqualTo('lmy_purchase');\nassertThat(autoProps.items[0].lmy_name).isEqualTo('Auto\
    \ Shirt');\nassertThat(autoProps.items[0].lmy_product_id).isEqualTo('AUTO123');\nassertApi('injectScript').wasCalled();"
- name: sends every ecommerce item for the selected event
  code: |-
    const mockData = { token: 'lmy_test', eventType: 'track', eventName: 'lmy_add_to_cart' };
    let trackedEventName = null;
    let eventProps = null;
    mock('copyFromWindow', () => undefined);
    mock('copyFromDataLayer', (key) => {
      if (key === 'ecommerce.items') {
        return [
          { item_name: 'First Shirt', price: 10, item_id: 'FIRST1', quantity: 1 },
          { item_name: 'Second Shirt', price: 20, item_id: 'SECOND2', quantity: 3 }
        ];
      }
      return undefined;
    });
    mock('createArgumentsQueue', (fnKey, arrKey) => {
      return (cmd, arg1, arg2) => {
        if (cmd === 'track') { trackedEventName = arg1; eventProps = arg2; }
      };
    });
    runCode(mockData);
    assertThat(trackedEventName).isEqualTo('lmy_add_to_cart');
    assertThat(eventProps.items).isEqualTo([
      { lmy_name: 'First Shirt', lmy_price: 10, lmy_product_id: 'FIRST1', lmy_quantity: 1 },
      { lmy_name: 'Second Shirt', lmy_price: 20, lmy_product_id: 'SECOND2', lmy_quantity: 3 }
    ]);
    assertApi('injectScript').wasCalled();


___NOTES___

Created on 8/12/2026, 6:40:24 PM

