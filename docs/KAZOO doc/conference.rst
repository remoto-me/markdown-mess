Conferences
~~~~~~~~~~~

About Conferences
^^^^^^^^^^^^^^^^^

Conferences documents are enriched with realtime information, namely: number of members, number of moderators, duration of the conference, conference locked status. The realtime information is added to conference document under \_read\_only key (to avoid accident document update).

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``co | Defines      | ``arr | ``[]``   | ``false`` |
| nfer | conference   | ay(st |          |           |
| ence | numbers that | ring) |          |           |
| _num | can be used  | ``    |          |           |
| bers | by members   |       |          |           |
| ``   | or           |       |          |           |
|      | moderators   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``co |              | ``str |          | ``false`` |
| nfer |              | ing`` |          |           |
| ence |              |       |          |           |
| _num |              |       |          |           |
| bers |              |       |          |           |
| .[]` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fo | This is a    | ``str |          | ``false`` |
| cus` | read-only    | ing`` |          |           |
| `    | property     |       |          |           |
|      | indicating   |       |          |           |
|      | the media    |       |          |           |
|      | server       |       |          |           |
|      | hosting the  |       |          |           |
|      | conference   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Defines the  | ``obj | ``{}``   | ``false`` |
| mber | discovery    | ect`` |          |           |
| ``   | properties   |       |          |           |
|      | for a member |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Determines   | ``boo | ``false` | ``false`` |
| mber | if a member  | lean` | `        |           |
| .joi | will join    | `     |          |           |
| n_de | deaf         |       |          |           |
| af`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Determines   | ``boo | ``true`` | ``false`` |
| mber | if a member  | lean` |          |           |
| .joi | will join    | `     |          |           |
| n_mu | muted        |       |          |           |
| ted` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Defines the  | ``arr | ``[]``   | ``false`` |
| mber | conference   | ay(st |          |           |
| .num | number(s)    | ring) |          |           |
| bers | for members  | ``    |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``str |          | ``false`` |
| mber |              | ing`` |          |           |
| .num |              |       |          |           |
| bers |              |       |          |           |
| .[]` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Defines the  | ``arr | ``[]``   | ``false`` |
| mber | pin          | ay(st |          |           |
| .pin | number(s)    | ring) |          |           |
| s``  | for members  | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``str |          | ``false`` |
| mber |              | ing`` |          |           |
| .pin |              |       |          |           |
| s.[] |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mo | Defines the  | ``obj | ``{}``   | ``false`` |
| dera | discovery    | ect`` |          |           |
| tor` | properties   |       |          |           |
| `    | for a        |       |          |           |
|      | moderator    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mo | Determines   | ``boo | ``false` | ``false`` |
| dera | if a         | lean` | `        |           |
| tor. | moderator    | `     |          |           |
| join | will join    |       |          |           |
| _dea | deaf         |       |          |           |
| f``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mo | Determines   | ``boo | ``false` | ``false`` |
| dera | if a         | lean` | `        |           |
| tor. | moderator    | `     |          |           |
| join | will join    |       |          |           |
| _mut | muted        |       |          |           |
| ed`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mo | Defines the  | ``arr | ``[]``   | ``false`` |
| dera | conference   | ay(st |          |           |
| tor. | number(s)    | ring) |          |           |
| numb | for          | ``    |          |           |
| ers` | moderators   |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mo |              | ``str |          | ``false`` |
| dera |              | ing`` |          |           |
| tor. |              |       |          |           |
| numb |              |       |          |           |
| ers. |              |       |          |           |
| []`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mo | Defines the  | ``arr | ``[]``   | ``false`` |
| dera | pin          | ay(st |          |           |
| tor. | number(s)    | ring) |          |           |
| pins | for          | ``    |          |           |
| ``   | moderators   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mo |              | ``str |          | ``false`` |
| dera |              | ing`` |          |           |
| tor. |              |       |          |           |
| pins |              |       |          |           |
| .[]` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``na | A friendly   | ``str |          | ``false`` |
| me`` | name for the | ing(1 |          |           |
|      | conference   | ..128 |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``ow | The user ID  | ``str |          | ``false`` |
| ner_ | who manages  | ing(3 |          |           |
| id`` | this         | 2)``  |          |           |
|      | conference   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pl | Do we need   | ``boo | ``false` | ``false`` |
| ay_n | to announce  | lean` | `        |           |
| ame` | new          | `     |          |           |
| `    | conference   |       |          |           |
|      | members?     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | The XML      | ``str |          | ``false`` |
| ofil | profile name | ing`` |          |           |
| e``  | used to      |       |          |           |
|      | configure    |       |          |           |
|      | the          |       |          |           |
|      | conference   |       |          |           |
+------+--------------+-------+----------+-----------+

Fetch
^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/conferences

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences

Create
^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/conferences

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences

Remove
^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/conferences/{CONFERENCE\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences/{CONFERENCE_ID}

Fetch
^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/conferences/{CONFERENCE\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences/{CONFERENCE_ID}

Patch
^^^^^

    PATCH /v2/accounts/{ACCOUNT\_ID}/conferences/{CONFERENCE\_ID}

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences/{CONFERENCE_ID}

Change
^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/conferences/{CONFERENCE\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences/{CONFERENCE_ID}

Perform an action on conference
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/conferences/{CONFERENCE\_ID}

.. code:: shell

    curl -v -X PUT \
        -d '{"data": {"action": {CONFERENCE_ACTION}}}' \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences/{CONFERENCE_ID}

CONFERENCE\_ACTION: lock, unlock

Fetch
^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/conferences/{CONFERENCE\_ID}/participants

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences/{CONFERENCE_ID}/participants

Perform an action on participants
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/conferences/{CONFERENCE\_ID}/participants

.. code:: shell

    curl -v -X PUT \
        -d '{"data": {"action": {PARTICIPANTS_ACTION}}}' \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences/{CONFERENCE_ID}/participants

PARTICIPANTS\_ACTION: mute/unmute/deaf/undeaf/kick

Perform an action on participant
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/conferences/{CONFERENCE\_ID}/participants/{PARTICIPANT\_ID}

.. code:: shell

    curl -v -X PUT \
        -d '{"data": {"action": {PARTICIPANT_ACTION}}}' \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/conferences/{CONFERENCE_ID}/participants/{PARTICIPANT_ID}

PARTICIPANT\_ACTION: mute/unmute/deaf/undeaf/kick

List of conferences example
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: json

    [
      {
        "id": "",
        "name": "",
        "owner_id": "",
        "member": {
          "join_muted": false,
          "join_deaf": false,
          "numbers": [],
          "pins": []
        },
        "moderator": {
          "join_deaf": false,
          "join_muted": false,
          "numbers": [],
          "pins": []
        },
        "members": 0,
        "admins": 0,
        "duration": 0,
        "is_locked": false
      },
      ...
    ]

Conference document
^^^^^^^^^^^^^^^^^^^

.. code:: json

    {
      "name": "Conf",
      "id": "",
      "owner_id": "",
      "play_entry_tone": true,
      "play_exit_tone": true,
      "play_name": false,
      "conference_numbers": [],
      "member": {
        "join_muted": false,
        "join_deaf": false,
        "numbers": [],
        "pins": []
      },
      "ui_metadata": {
        "ui": "kazoo-ui"
      },
      "moderator": {
        "join_deaf": false,
        "join_muted": false,
        "numbers": [],
        "pins": []
      },
      "_read_only": {
        "members": 0,
        "admins": 0,
        "duration": 0,
        "is_locked": false,
        "participants": [
            {
              "call_id": "",
              "conference_name": "",
              "conference_uuid": "",
              "switch_hostname": "",
              "floor": false,
              "hear": true,
              "speak": true,
              "talking": false,
              "mute_detect": false,
              "participant_id": 1,
              "energy_level": 20,
              "current_energy": 0,
              "video": false,
              "is_moderator": false,
              "join_time": 63635217275,
              "duration": 10
            },
            ...
        ]
      }
    }

join\_time is participant"s join time as epoch, duration is number of seconds participant participate in conference.

Here we can see values set up for a Member, then for a Moderator.

The last field, **play\_entry\_tone**, is at the root of the document: meaning this field applies to everyone in the conference.

Available fields
^^^^^^^^^^^^^^^^

-  **play\_entry\_tone** and **play\_exit\_tone**: can be either a boolean or a non-empty string.

   -  ``true`` means play the default tone when someone joins (or leaves) the conference
   -  ``false`` disables the tone from being played
   -  A string like a *tone string* or a *URI to a media file* can be inputed.

Actions
^^^^^^^

Actions are JSON objects in format:

.. code:: json

    {
        "action": {action}
    }

Conference actions
^^^^^^^^^^^^^^^^^^

::

    lock: lock conference (prevent participants to join)
    unlock: unlock conference (allow everybody to join)

Participants actions
^^^^^^^^^^^^^^^^^^^^

::

    mute/unmute: mute/unmute all participants except moderators
    deaf/undeaf: deaf/undeaf all participants except moderators
    kick: kick every participant out

Participant actions
^^^^^^^^^^^^^^^^^^^

::

    mute/unmute: mute/unmute participant
    deaf/undeaf: deaf/undeaf participant
    kick: kick participant

Web-socket events
~~~~~~~~~~~~~~~~~

A client may subscribe to conference event using websocket connection. Participant events are published as amqp conference.event.{conference\_id}.{call\_id}, where call\_id is participant"s call.

The list of published events is determined by *publish\_participant\_event* parameter of ecallmgr configuration, if parameter is unset, then all events are published.

Participant events
^^^^^^^^^^^^^^^^^^

::

    add-member
    del-member
    stop-talking
    start-talking
    mute-member
    unmute-member
    deaf-member
    undeaf-member

Example event
^^^^^^^^^^^^^

.. code:: json

    {
      "custom_channel_vars": {
        "account_id": "9d351ad7ffd6f846313af9eed3bb7b85",
        "authorizing_id": "6507f40b09a61fbb8b025dbad9316eb5",
        "authorizing_type": "device",
        "owner_id": "32d8788da9506b4b1991d5bb86d27b0a",
        "presence_id": "1000@kamailio.kazoo",
        "fetch_id": "56507071-a216-4e0a-a28f-ff3bd9c86ac3",
        "bridge_id": "934800819",
        "precedence": 5,
        "realm": "kamailio.kazoo",
        "username": "sip1",
        "call_interaction_id": "63635497023-3e247b2e"
      },
      "channel_presence_id": "1000@kamailio.kazoo",
      "caller_id_number": "sip1",
      "caller_id_name": "sip1",
      "mute_detect": false,
      "video": false,
      "energy_level": 20,
      "current_energy": 0,
      "talking": false,
      "speak": true,
      "hear": true,
      "floor": false,
      "participant_id": 20,
      "instance_id": "d5765180-53d5-4104-860e-b352f3f8e6b1",
      "conference_id": "5edbfdd3b825314a71b0a05957392edb",
      "focus": "freeswitch@freeswitch.kazoo",
      "call_id": "934800819",
      "event": "add-member",
      "node": "kazoo_apps@jh460",
      "msg_id": "a6fbbf034b5cd3af",
      "event_name": "participant_event",
      "event_category": "conference",
      "app_version": "4.0.0",
      "app_name": "ecallmgr",
      "routing_key": "participant_event"
    }
