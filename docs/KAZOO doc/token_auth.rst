Token\_auth
~~~~~~~~~~~

Authentication tokens are generated using one of the authentication endpoints exposed by Crossbar. See `User Authentication <./user_authentication.md>`__ and `API Authentication <./api_authentication.md>`__ as examples of generating authentication tokens.

About Token\_auth
^^^^^^^^^^^^^^^^^

Once you have an authentication token, you can access various Crossbar resource endpoints to manipulate the system or your account (provided you have the access).

Authentication tokens refresh their pvt\_modified timestamp each time they are used in an API request. Once an authentication token's pvt\_modified timestamp has passed a configurable timeout (usually one hour), it is automatically cleaned up by the system and no longer valid.

Token Restrictions
^^^^^^^^^^^^^^^^^^

The authentication token can be created with restrictions on what resource URIs (and HTTP methods) can be accessed by the requestor. This payload is added to the authentication payload used in any of the authentication methods provided (`User <./user_authentication.md>`__,
`API <./api_authentication.md>`__, etc).

For example, when creating an authentication token via `API key <./api_authentication.md>`__, include the following object to restrict the resultant authentication token to read-only:

.. code:: json

    {
        "data": {
            "api_key": "{API_KEY}",
            "restrictions": {
                "get": [
                    "#"
                ]
            }
        }
    }

AMQP binding tokens are used (``#`` and ``*``) to denote wildcards. An example with more fine-grained restrictions:

.. code:: json

    {
        "data": {
            "api_key": "{API_KEY}",
            "restrictions": {
                "delete": [
                    "accounts/{ACCOUNT_ID}/users/*"
                ],
                "get": [
                    "accounts/{ACCOUNT_ID}/users",
                    "accounts/{ACCOUNT_ID}/users/*",
                    "accounts/{ACCOUNT_ID}/users/*/*"
                ],
                "post": [
                    "accounts/{ACCOUNT_ID}/users/*"
                ],
                "put": [
                    "accounts/{ACCOUNT_ID}/users"
                ]
            }
        }
    }

This would restrict the authentication token to only be able to access {ACCOUNT\_ID}'s users resource and perform all of the CRUD actions (as well as quickcall and channel listings for a user). We can simply this restrictions object by using ``*`` for the method and ``#`` to match any URI with
``/users``:

.. code:: json

    {
        "data": {
            "api_key": "{API_KEY}",
            "restrictions": {
                "*": [
                    "accounts/{ACCOUNT_ID}/users/#"
                ]
            }
        }
    }

Here the ``#`` matches 0 or more segments after ``/users``.

Delete an authentication token
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    DELETE /v2/token\_auth

If you'd like to invalidate an authentication token programmatically (versus letting the system expire the token), you can issue a ``DELETE``:

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/token_auth

.. code:: json

    {
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Check auth token validity
^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/token\_auth

This will tell you whether the auth token constitutes valid credentials.

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/token_auth

Response when invalid
'''''''''''''''''''''

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "message": "invalid credentials"
        },
        "error": "401",
        "message": "invalid_credentials",
        "request_id": "{REQUEST_ID}",
        "status": "error"
    }

Response when OK
''''''''''''''''

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "account_id": "{ACCOUNT_ID}",
            "account_name": "{ACCOUNT_NAME}",
            "apps": [
            ],
            "id": "{AUTH_TOKEN}",
            "is_reseller": false,
            "language": "en-us",
            "method": "cb_user_auth",
            "owner_id": "8e248327b85591955749e53ea45b6baa",
            "reseller_id": "6b71cb72c876b5b1396a335f8f8a2594"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }
