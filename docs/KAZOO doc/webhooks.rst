Webhooks
~~~~~~~~

About Webhooks
^^^^^^^^^^^^^^

Webhooks allow Kazoo to send HTTP requests to a third-party webserver,
alerting that server of events occuring within Kazoo. Typically, events
would be fired for new calls, when a call is answered, and when a call
is finished, though other events will be added in the future.

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``cu | These        | ``obj |          | ``false`` |
| stom | properties   | ect`` |          |           |
| _dat | will be      |       |          |           |
| a``  | added to the |       |          |           |
|      | event and    |       |          |           |
|      | will         |       |          |           |
|      | overwrite    |       |          |           |
|      | existing     |       |          |           |
|      | values.      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``en | Is the       | ``boo | ``true`` | ``false`` |
| able | webhook      | lean` |          |           |
| d``  | enabled and  | `     |          |           |
|      | running      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ho | The trigger  | ``str |          | ``true``  |
| ok`` | event for a  | ing`` |          |           |
|      | request      |       |          |           |
|      | being made   |       |          |           |
|      | to           |       |          |           |
|      | 'callback\_u |       |          |           |
|      | ri'.         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ht | What HTTP    | ``str | ``post`` | ``false`` |
| tp_v | method to    | ing(' |          |           |
| erb` | use when     | get', |          |           |
| `    | contacting   |  'pos |          |           |
|      | the server   | t')`` |          |           |
+------+--------------+-------+----------+-----------+
| ``in | Should the   | ``boo |          | ``false`` |
| clud | webhook be   | lean` |          |           |
| e_su | fired for    | `     |          |           |
| bacc | subaccount   |       |          |           |
| ount | events.      |       |          |           |
| s``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``na | A friendly   | ``str |          | ``true``  |
| me`` | name for the | ing`` |          |           |
|      | webhook      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | Retry the    | ``int | ``2``    | ``false`` |
| trie | request this | eger` |          |           |
| s``  | many times   | `     |          |           |
|      | (if it       |       |          |           |
|      | fails)       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ur | The 3rd      | ``str |          | ``true``  |
| i``  | party URI to | ing`` |          |           |
|      | call out to  |       |          |           |
|      | an event     |       |          |           |
+------+--------------+-------+----------+-----------+

List Installed Webhooks
^^^^^^^^^^^^^^^^^^^^^^^

Webhooks are installed by the system administrator. You can query
Crossbar to see which are installed.

Some webhooks will also include a ``modifiers`` object; these are
parameters specific to that webhook that can be used to modify the
behaviour of the webhook.

    GET /v2/webhooks

.. code:: shell

    curl -v -X GET \
        -H "Content-Type:application/json" \
        -H "X-Auth-Token: {AUTH_TOKEN} \
        http://{SERVER}:8000/v2/webhooks

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "description": "Events when calls end",
                "id": "channel_destroy",
                "name": "channel_destroy"
            },
            {
                "description": "Events when new calls start",
                "id": "channel_create",
                "name": "channel_create"
            },
            {
                "description": "Events for when the channel is answered by the endpoint",
                "id": "channel_answer",
                "name": "channel_answer"
            },
            {
               "description": "Receive notifications when objects in Kazoo are changed",
               "id": "object",
               "modifiers": {
                   "action": {
                       "description": "A list of object actions to handle",
                       "items": [
                           "doc_created",
                           "doc_edited",
                           "doc_deleted"
                       ],
                       "type": "array"
                   },
                   "type": {
                       "description": "A list of object types to handle",
                       "items": [
                           "account",
                           "callflow",
                           "device",
                           "faxbox",
                           "media",
                           "user",
                           "vmbox"
                       ],
                       "type": "array"
                   },
                   "types": {
                       "description": "A list of object types to handle",
                       "items": {
                           "type": "string"
                       },
                       "type": "array"
                   }
               },
               "name": "object"
           }
       ],
       "page_size": 4,
       "request_id": "{REQUEST_ID}",
       "revision": "{REVISION}",
       "status": "success"
    }

List webhooks
^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/webhooks

Any webhooks with *disable\_reason* in the summary has been
auto-disabled.

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks

Create webhook
^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/webhooks

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data": {
            "name": "New Calls",
            "uri": "http://my.{SERVER}/calls/new.php",
            "http_verb": "post",
            "hook": "channel_create",
            "retries":3
        }}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks

Get details of the webhook
^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/webhooks/{WEBHOOK\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks/{WEBHOOK_ID}

Edit webhook
^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/webhooks/{WEBHOOK\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data": {
            "name": "New Calls",
            "uri": "http://my.{SERVER}/calls/new_calls.php",
            "http_verb": "post",
            "hook": "channel_create",
            "retries": 3
        }}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks/{WEBHOOK_ID}

Patch webhook
^^^^^^^^^^^^^

    PATCH /v2/accounts/{ACCOUNT\_ID}/webhooks/{WEBHOOK\_ID}

You can also patch an existing webhook:

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"enabled":true}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks/{WEBHOOK_ID}

Delete a webhook
^^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/webhooks/{WEBHOOK\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks/{WEBHOOK_ID}

List Webhook Attempts
^^^^^^^^^^^^^^^^^^^^^

Webhooks tracks attempts to send the hook payloads to your URIs. You can
get a listing of the more recent attempts to help debug what went wrong.

    GET /v2/accounts/{ACCOUNT\_ID}/webhooks/attempts

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks/attempts

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "client_error": "nxdomain",
                "hook_id": "{HOOK_ID}",
                "reason": "kazoo http client error",
                "result": "failure",
                "retries left": 2,
                "timestamp": 63590996563
            },
            {
                "hook_id": "{HOOK_ID}",
                "result": "success",
                "timestamp": 63590996562
            }
        ],
        "page_size": 2,
        "request_id": "{REQUEST_ID}",
        "status": "success"
        }

List attempts for a specific attempt

    GET /v2/accounts/{ACCOUNT\_ID}/webhooks/{WEBHOOK\_ID}/attempts

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks/{WEBHOOK_ID}/attempts

Re-enable auto-disabled hooks in bulk
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Webhooks will auto-disable failing hooks (if Kazoo can't reach your
server, or you take too long to respond with ``200 OK``, for instance).
Especially if you're a reseller with webhooks in your client accounts,
it can be tedious to have to iterate through all your accounts and
re-enable each hook. Fortunately, you can perform this bulk-enable
action against an account or an account and its descendants.

Enable an account's hooks

    PATCH /v2/accounts/{ACCOUNT\_ID}/webhooks

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{"re-enable":true}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/webhooks

Enable an account's and descendant accounts' hooks

    PATCH /v2/accounts/{ACCOUNT\_ID}/descendants/webhooks

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{"re-enable":true}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/descendants/webhooks

Hook Payload
^^^^^^^^^^^^

Here's what you can expect to receive when a webhook fires to your
server:

**Base Payload**

-  hook\_event: The type of hook being fired
-  call\_direction: "inbound" or "outbound", relative to Kazoo
-  timestamp: gregorian timestamp of the event
-  account\_id: ID of the account generating the event
-  request: SIP Request
-  to: SIP To
-  from: SIP From
-  call\_id: SIP Call ID
-  other\_leg\_call\_id: If bridged, the Call ID of the other leg
-  caller\_id\_name: Caller ID Name
-  caller\_id\_number: Caller ID Number
-  callee\_id\_name: Callee Name
-  callee\_id\_number: Callee Number

Most of these fields should be present on all payloads.

**Hook Specific**

-  channel\_create

   -  hook\_event: channel\_create

-  channel\_answer

   -  hook\_event: channel\_answer

-  channel\_destroy

   -  hook\_event: channel\_destroy
   -  hangup\_cause: SIP Hangup Cause (NORMAL\_CLEARING,
      ORIGINATOR\_CANCEL, etc)
   -  hangup\_code: SIP Hangup Code (404, 503, etc)

-  doc

   -  hook\_event: doc
   -  action: doc\_created, doc\_updated, doc\_deleted
   -  type: user, vmbox, callflow, account, device, faxbox, media

Hook Specific Custom Data
^^^^^^^^^^^^^^^^^^^^^^^^^

To restrict the kind of document or the action or both. You can set the
custom data to:

.. code:: json

    {
       "type": "user",
       "action": "doc_edited"
    }
