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
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const createArgumentsQueue = require('createArgumentsQueue');
const copyFromWindow = require('copyFromWindow');
const injectScript = require('injectScript');
const getType = require('getType');

const SDK_URL = 'https://sdk.getlimy.ai/p/limy-analytics.min.js';

if (getType(copyFromWindow('limy')) !== 'function') {
  const limy = createArgumentsQueue('limy', 'limy.q');
  limy('initiate', data.token);
}

injectScript(SDK_URL, data.gtmOnSuccess, data.gtmOnFailure, 'limy_sdk');


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
  code: |-
    const mockData = { token: 'lmy_test' };
    let initiateCalls = 0;
    mock('copyFromWindow', () => () => {});
    mock('createArgumentsQueue', () => { return (cmd) => { if (cmd === 'initiate') initiateCalls++; }; });
    runCode(mockData);
    assertThat(initiateCalls).isEqualTo(0);
    assertApi('injectScript').wasCalled();


___NOTES___

Created on 8/12/2026, 6:40:24 PM
