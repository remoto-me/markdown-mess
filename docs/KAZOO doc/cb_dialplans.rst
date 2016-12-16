To use system level dial plans add them to this document: http://10.8.66.1:5984/\_utils/document.html?system\_config/dialplans The format for adding them is:

::

    "^(\\d{7})$": {
        "name": "Dial Plan Name",
        "description": "Dial Plan Description",
        "prefix": "+627",
        "suffix": "2001"
    }

The regex is the key. Prefix and suffix are optional.

In order to enable an account/user/device to use the system level dialplan patch them with this data:

::

    {
        "data": {
            "dial_plan":{"system":["Dial Plan Name"]}
        }
    }

Multiple system level dial plans can be added with the "[]". Dial plans can also be explicitly added to an account/user/device using the same format as the system level.
