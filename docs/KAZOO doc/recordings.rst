Recordings
~~~~~~~~~~

About Recordings
^^^^^^^^^^^^^^^^

Recordings endpoint provides a way to access call recordings.

Fetch recordings
^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/recordings GET
    /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}/recordings

Lists the call recording with pagination and filtering.

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/recordings

Fetch recording media or document
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/recordings/{RECORDING\_ID}

Gets a specific recording document.

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/recordings/{RECORDING_ID}

Gets a specific recording document attachment if available. Mind the
``Accept`` header in example below. For clients that do not support
setting the ``Accept`` header, a querystring parameter can be included:
``?accept=audio/mpeg``.

Optional parameter ``inline`` can be either ``true`` or ``false``.

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Accept: audio/mpeg" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/recordings/{RECORDING_ID}
