Faxes
-----

Fax Subsystem Overview
~~~~~~~~~~~~~~~~~~~~~~

The Faxes API exposes lots of ways to send, receive, track and manage faxes.

As a general concept, faxes are either considered inbound or outbound faxes. In addition: \* API calls with the term "incoming" are used for tracking faxes currently in the process of being received \* API calls with the term "inbox" are used for managing faxes which have already been received \* API calls with the term "outgoing" are used for tracking faxes currently in the process of being sent \* API calls with the term "outbox" are used for managing faxes which have already been sent

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``at | The number   | ``int | ``0``    | ``false`` |
| temp | of attempts  | eger` |          |           |
| ts`` | made, this   | `     |          |           |
|      | will be set  |       |          |           |
|      | by the       |       |          |           |
|      | system and   |       |          |           |
|      | reset        |       |          |           |
|      | automaticly  |       |          |           |
|      | on put/post  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do | Parameters   | ``obj |          | ``false`` |
| cume | related to   | ect`` |          |           |
| nt`` | the storage  |       |          |           |
|      | of a fax     |       |          |           |
|      | document     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do | The content  | ``str |          | ``false`` |
| cume | provided in  | ing(0 |          |           |
| nt.c | the body     | ..256 |          |           |
| onte | when         | )``   |          |           |
| nt`` | fetching for |       |          |           |
|      | transmission |       |          |           |
|      | as a post    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do | The content  | ``str |          | ``false`` |
| cume | type header  | ing`` |          |           |
| nt.c | to be used   |       |          |           |
| onte | when         |       |          |           |
| nt_t | fetching for |       |          |           |
| ype` | transmission |       |          |           |
| `    | as a post    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do | The host     | ``str |          | ``false`` |
| cume | header to be | ing`` |          |           |
| nt.h | used when    |       |          |           |
| ost` | fetching for |       |          |           |
| `    | transmission |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do | The method   | ``str | ``get``  | ``false`` |
| cume | that should  | ing(' |          |           |
| nt.m | be used to   | get', |          |           |
| etho | reteive the  |  'pos |          |           |
| d``  | document     | t')`` |          |           |
+------+--------------+-------+----------+-----------+
| ``do | The referer  | ``str |          | ``false`` |
| cume | header to be | ing`` |          |           |
| nt.r | used when    |       |          |           |
| efer | fetching for |       |          |           |
| er`` | transmission |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do | The url of   | ``str |          | ``true``  |
| cume | the fax      | ing`` |          |           |
| nt.u | document     |       |          |           |
| rl`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fr | The sender   | ``str |          | ``false`` |
| om_n | name for the | ing`` |          |           |
| ame` | fax          |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fr | The sender   | ``str |          | ``true``  |
| om_n | number for   | ing`` |          |           |
| umbe | the fax      |       |          |           |
| r``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``no | Status       | ``obj |          | ``false`` |
| tifi | notification | ect`` |          |           |
| cati | s            |       |          |           |
| ons` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``no | Email        | ``obj |          | ``false`` |
| tifi | notification | ect`` |          |           |
| cati | s            |       |          |           |
| ons. |              |       |          |           |
| emai |              |       |          |           |
| l``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``no | A list or    | ``str |          | ``false`` |
| tifi | string of    | ing,  |          |           |
| cati | email        | array |          |           |
| ons. | recipent(s)  | (stri |          |           |
| emai |              | ng)`` |          |           |
| l.se |              |       |          |           |
| nd_t |              |       |          |           |
| o``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``no | SMS          | ``obj |          | ``false`` |
| tifi | notification | ect`` |          |           |
| cati | s            |       |          |           |
| ons. |              |       |          |           |
| sms` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``no | A list or    | ``str |          | ``false`` |
| tifi | string of    | ing,  |          |           |
| cati | sms          | array |          |           |
| ons. | recipent(s)  | (stri |          |           |
| sms. |              | ng)`` |          |           |
| send |              |       |          |           |
| _to` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | The number   | ``int | ``1``    | ``false`` |
| trie | of times to  | eger` |          |           |
| s``  | retry        | `     |          |           |
+------+--------------+-------+----------+-----------+
| ``to | The          | ``str |          | ``false`` |
| _nam | recipient    | ing`` |          |           |
| e``  | name for the |       |          |           |
|      | fax          |       |          |           |
+------+--------------+-------+----------+-----------+
| ``to | The          | ``str |          | ``true``  |
| _num | recipient    | ing`` |          |           |
| ber` | number for   |       |          |           |
| `    | the fax      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | The result   | ``obj |          | ``false`` |
| _res | of a         | ect`` |          |           |
| ult` | transmission |       |          |           |
| `    | attempt      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | A            | ``str | ""       | ``false`` |
| _res | description  | ing`` |          |           |
| ult. | of any error |       |          |           |
| erro | that occured |       |          |           |
| r_me |              |       |          |           |
| ssag |              |       |          |           |
| e``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | The number   | ``int | ``0``    | ``false`` |
| _res | of bad rows  | eger` |          |           |
| ult. |              | `     |          |           |
| fax_ |              |       |          |           |
| bad_ |              |       |          |           |
| rows |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | True if fax  | ``boo | ``false` | ``false`` |
| _res | error        | lean` | `        |           |
| ult. | correction   | `     |          |           |
| fax_ | was used     |       |          |           |
| erro |              |       |          |           |
| r_co |              |       |          |           |
| rrec |              |       |          |           |
| tion |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | The receiver | ``str | ""       | ``false`` |
| _res | id reported  | ing`` |          |           |
| ult. | by the       |       |          |           |
| fax_ | remote fax   |       |          |           |
| rece | device       |       |          |           |
| iver |              |       |          |           |
| _id` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | The speed    | ``int | ``0``    | ``false`` |
| _res | achieved     | eger` |          |           |
| ult. | during       | `     |          |           |
| fax_ | transmission |       |          |           |
| spee |              |       |          |           |
| d``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | The number   | ``int | ``0``    | ``false`` |
| _res | of pages     | eger` |          |           |
| ult. | transmitted  | `     |          |           |
| page |              |       |          |           |
| s_se |              |       |          |           |
| nt`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | True if the  | ``boo | ``false` | ``false`` |
| _res | fax          | lean` | `        |           |
| ult. | transmission | `     |          |           |
| succ | was          |       |          |           |
| ess` | successful   |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tx | The amount   | ``int | ``0``    | ``false`` |
| _res | of time from | eger` |          |           |
| ult. | submition to | `     |          |           |
| time | completion   |       |          |           |
| _ela |              |       |          |           |
| psed |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+

Processing States
^^^^^^^^^^^^^^^^^

+--------+--------------+
| State  | Description  |
+========+==============+
| ``atta | A fax job    |
| ching_ | was          |
| files` | submitted    |
| `      | via the api  |
|        | (with a      |
|        | multipart/re |
|        | lated        |
|        | content      |
|        | type) or     |
|        | smtp and we  |
|        | are in the   |
|        | process of   |
|        | attaching    |
|        | the files to |
|        | the fax job. |
+--------+--------------+
| ``pend | Fax waiting  |
| ing``  | to be picked |
|        | up by the    |
|        | fax sending  |
|        | job          |
+--------+--------------+
| ``fail | If we can't  |
| ed``   | retrieve the |
|        | fax document |
|        | via a        |
|        | requests     |
|        | URL, the     |
|        | state will   |
|        | be "failed"  |
|        | and the      |
|        | error text   |
|        | will contain |
|        | "could not   |
|        | retrieve     |
|        | file, http   |
|        | response "   |
+--------+--------------+
| ``proc | Faxes that   |
| essing | are actively |
| ``     | picked up by |
|        | the fax      |
|        | worker and   |
|        | are being    |
|        | processed    |
+--------+--------------+
| ``comp | Faxes that   |
| leted` | are finished |
| `      | sending      |
+--------+--------------+
| ``fail | Faxes that   |
| ed``   | did not      |
|        | successfully |
|        | send after   |
|        | all allotted |
|        | retries are  |
|        | in state     |
|        | "failed". We |
|        | pass-thru    |
|        | the          |
|        | FreeSWITCH   |
|        | error code   |
|        | in this      |
|        | case.        |
+--------+--------------+

Sending Outbound Faxes
~~~~~~~~~~~~~~~~~~~~~~

This section details APIs for manipulating job processing of outgoing faxes.

Create an outgoing fax
^^^^^^^^^^^^^^^^^^^^^^

There are two methods for creating an outgoing fax - they differ in how you attach the fax file for processing.

In the first method, you can create a fax document that includes a URL which contains the fax document to send. The fax document is fetched by the ``fax_jobs`` worker and distributed to ``fax_worker`` processes. You can fetch the status of the created job using the ``faxes/outgoing/{FAX_ID}`` API.

    PUT /v2/accounts/{ACCOUNT\_ID}/faxes

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{"document":{"url":"http://myserver.com/fax.pdf","method":"get"},"retries":3,"from_name":"Test Fax","from_number":"18884732963","to_name":"To Name","to_number":"18884732963"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes

.. code:: json

    {
        "data":{
            "document":{
                "url":"http://myserver.com/fax.pdf",
                "method":"get"
            },
            "retries":3,
            "from_name":"Test Fax",
            "from_number":"18884732963",
            "to_name":"To Name",
            "to_number":"18884732963",
            "attempts":0,
            "tx_result":{
                "error_message":"",
                "fax_bad_rows":0,
                "fax_error_correction":false,
                "fax_receiver_id":""
                ,"fax_speed":0,
                "pages_sent":0,
                "success":false,
                "time_elapsed":0
            },
            "fax_timezone":"undefined",
            "id":"{FAX_JOB_ID}"
        },
        "revision":"{REVISION}",
        "request_id":"{REQUEST_ID}",
        "status":"success",
        "auth_token":"{AUTH_TOKEN}"
    }

In the second method, you can use a single PUT request and send a multipart content-type to attach both the JSON metadata about the fax transmission and the document itself, in a single request. This avoids needing to have an external storage location for storing fax attachments prior to processing. This is a good solution for portals that upload documents.

.. code:: shell

    curl -v -X PUT \
         -H "Content-Type: multipart/mixed" \
         -F "content=@fax.json; type=application/json" \
         -F "content=@fax.pdf; type=application/pdf" \
         -H 'X-Auth-Token: {AUTH_TOKEN}' \
         http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes

Create an outgoing fax (Alias)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is identical to the ``PUT /faxes`` above.

    PUT /v2/accounts/{ACCOUNT\_ID}/faxes/outgoing

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outgoing

Fetch outgoing faxes and their statuses
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This API retrieves a listing of all outgoing faxes. Use the "id" to fetch details about a particular job. Results will contain a listing of both API- and SMTP (email) - initiated outbound faxes.

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/outgoing

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outgoing

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "created": 63626410973,
                "from": "18884732963",
                "id": "{FAX_JOB_ID}",
                "status": "pending",
                "to": "18884732963"
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "start_key": [
            "{START_KEY}"
        ],
        "status": "success"
    }

Fetch details of a queued outgoing fax job
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Get all the details about a fax that is in the outgoing queue.

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/outgoing/{FAX\_JOB\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outgoing/{FAX_JOB_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "attempts": 0,
            "created": 63626410973,
            "delivered": "undefined",
            "document": {
                "method": "get",
                "url": "http://myserver.com/fax.pdf"
            },
            "fax_timezone": "undefined",
            "from_name": "Test Fax",
            "from_number": "18884732963",
            "id": "{FAX_JOB_ID}",
            "retries": 3,
            "status": "pending",
            "to_name": "To Name",
            "to_number": "18884732963",
            "tx_result": {
                "error_message": "",
                "fax_bad_rows": 0,
                "fax_error_correction": false,
                "fax_receiver_id": "",
                "fax_speed": 0,
                "pages_sent": 0,
                "success": false,
                "time_elapsed": 0
            }
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Managing Past Outbound Faxes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fetch all previously sent faxes in the outbox folder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This API retrieves a listing of all outgoing faxes which have already been sent or attempted and are no longer in queue. Results will contain a listing of both API- and SMTP (email) - initiated outbound faxes.

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/outbox

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outbox

Fetch a fax from the outbox folder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/outbox/{FAX\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outbox/{FAX_ID}

Resubmit a fax from the outbox folder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/faxes/outbox/{FAX\_ID}

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"action": "resubmit", "data": {}}'
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outbox/{FAX_ID}

Fetch the fax payload
^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/outbox/{FAX\_ID}/attachment

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outbox/{FAX_ID}/attachment

Fetch logs related to outbound faxes submitted via email
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If a fax job was queued or attempted to be queued as the result of an inbound email, the SMTP log for that fax can be retrieved via this API. This is also useful for helping debug problems with inbound faxes, such as when the domain matched an account for an inbound fax, but not a specific faxbox, and thus failed to process.

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/smtplog

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/smtplog

Fetch a specific log related to email
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/smtplog/{ATTEMPT\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/smtplog/{ATTEMPT_ID}

Remove a fax from the outbox folder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This API allows you to delete an old fax message. For privacy reasons, this may be useful if you wish to remove all evidence of a previously sent outbound fax.

    DELETE /v2/accounts/{ACCOUNT\_ID}/faxes/outbox/{FAX\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outbox/{FAX_ID}

Remove the fax payload
^^^^^^^^^^^^^^^^^^^^^^

In some cases, you may wish to remove the document from a fax (usually for privacy reasons) but keep evidence that the fax transmission occurred. This will remove attachments but not the metadata from a sent fax.

    DELETE /v2/accounts/{ACCOUNT\_ID}/faxes/outbox/{FAX\_ID}/attachment

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/outbox/{FAX_ID}/attachment

Managing Past Inbound Faxes
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fetch all faxes in the inbox folder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Retrieve a list of faxes that have previously been received.

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/inbox

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/inbox

Fetch a fax from the inbox folder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Retrieve all metadata about a particular fax for which you have the fax ID.

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/inbox/{FAX\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/inbox/{FAX_ID}

Fetch the fax payload
^^^^^^^^^^^^^^^^^^^^^

Retrieve the fax document / attachments for a particular inbound fax for which you have the fax ID.

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/inbox/{FAX\_ID}/attachment

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/inbox/{FAX_ID}/attachment

Remove a fax from the inbox folder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Delete an old fax message. For privacy reasons, this may be useful if you wish to remove all evidence of a previously received inbound fax.

    DELETE /v2/accounts/{ACCOUNT\_ID}/faxes/inbox/{FAX\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/inbox/{FAX_ID}

Remove the fax payload
^^^^^^^^^^^^^^^^^^^^^^

In some cases, you may wish to remove the document from a fax (usually for privacy reasons) but keep evidence that the fax receipt occurred. This will remove attachments but not the metadata from a received fax. Useful after you've done post-processing on a fax externally.

    DELETE /v2/accounts/{ACCOUNT\_ID}/faxes/inbox/{FAX\_ID}/attachment

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/inbox/{FAX_ID}/attachment

APIs under active development
-----------------------------

Receiving Inbound Faxes
~~~~~~~~~~~~~~~~~~~~~~~

Fetch
^^^^^

Retrieve a list of faxes that are currently being received or attempted to be received. NOTE: THIS FUNCTION DOES NOT WORK YET AS OF THE WRITING OF THIS DOCUMENT. We'll update this doc once this function is complete. Ticket #

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/incoming

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/incoming

Fetch an incoming fax job
^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/faxes/incoming/{FAX\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/faxes/incoming/{FAX_ID}
