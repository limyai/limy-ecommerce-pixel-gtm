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
    "type": "TEXT",
    "name": "eventName",
    "displayName": "Event Name",
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
    "name": "lmy_name",
    "displayName": "Product Name",
    "simpleValueType": true,
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

// Trigger custom events based on user selection
if (data.eventType === 'track' && data.eventName) {
  
  let lmy_name = data.lmy_name;
  let lmy_price = data.lmy_price;
  let lmy_product_id = data.lmy_product_id;
  let lmy_quantity = data.lmy_quantity;

  // Auto-Parsing: Check the Data Layer for standard GA4 ecommerce data
  const ecomm = copyFromDataLayer('ecommerce');
  
  if (ecomm && ecomm.items && getType(ecomm.items) === 'array' && ecomm.items.length > 0) {
    const firstItem = ecomm.items[0]; 
    if (!lmy_name) lmy_name = firstItem.item_name || firstItem.name;
    if (!lmy_price) lmy_price = firstItem.price;
    if (!lmy_product_id) lmy_product_id = firstItem.item_id || firstItem.id;
    if (!lmy_quantity) lmy_quantity = firstItem.quantity;
  }

  // Send the finalized payload to Limy
  limy('track', data.eventName, {
    lmy_name: lmy_name,
    lmy_price: lmy_price,
    lmy_product_id: lmy_product_id,
    lmy_quantity: lmy_quantity
  });
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
            "string": "specific"
          }
        },
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ecommerce"
              },
              {
                "type": 1,
                "string": "ecommerce.*"
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
- name: fires track method with manual parameters
  code: "const mockData = { \n  token: 'lmy_test', \n  eventType: 'track', \n  eventName:\
    \ 'lmy_purchase', \n  lmy_name: 'Manual Shirt', \n  lmy_price: '29.99', \n  lmy_product_id:\
    \ 'MANUAL123', \n  lmy_quantity: '2' \n};\nlet trackedEventName = null;\nlet eventProps\
    \ = null;\nmock('copyFromWindow', () => undefined);\nmock('copyFromDataLayer',\
    \ () => undefined);\nmock('createArgumentsQueue', (fnKey, arrKey) => {\n  return\
    \ (cmd, arg1, arg2) => { \n    if (cmd === 'track') { trackedEventName = arg1;\
    \ eventProps = arg2; } \n  };\n});\nrunCode(mockData);\nassertThat(trackedEventName).isEqualTo('lmy_purchase');\n\
    assertThat(eventProps.lmy_name).isEqualTo('Manual Shirt');\nassertThat(eventProps.lmy_product_id).isEqualTo('MANUAL123');\n\
    assertApi('injectScript').wasCalled();"
- name: fires track method with auto-parsed ecommerce data layer
  code: "const mockData = { \n  token: 'lmy_test', \n  eventType: 'track', \n  eventName:\
    \ 'lmy_purchase' \n};\nlet autoEventName = null;\nlet autoProps = null;\nmock('copyFromWindow',\
    \ () => undefined);\nmock('copyFromDataLayer', (key) => {\n  if (key === 'ecommerce')\
    \ {\n    return { items: [ { item_name: 'Auto Shirt', price: '19.99', item_id:\
    \ 'AUTO123', quantity: 1 } ] };\n  }\n  return undefined;\n});\nmock('createArgumentsQueue',\
    \ (fnKey, arrKey) => {\n  return (cmd, arg1, arg2) => { \n    if (cmd === 'track')\
    \ { autoEventName = arg1; autoProps = arg2; } \n  };\n});\nrunCode(mockData);\n\
    assertThat(autoEventName).isEqualTo('lmy_purchase');\nassertThat(autoProps.lmy_name).isEqualTo('Auto\
    \ Shirt');\nassertThat(autoProps.lmy_product_id).isEqualTo('AUTO123');\nassertApi('injectScript').wasCalled();"


___NOTES___

Created on 8/12/2026, 6:40:24 PM


