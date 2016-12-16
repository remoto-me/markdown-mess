CDRs
~~~~

About CDRs
^^^^^^^^^^

CDRs (Call Detail Records) provide a summary view of a call leg.

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``ap | The Kazoo    | ``str |          | ``false`` |
| p_na | application  | ing`` |          |           |
| me`` | that issued  |       |          |           |
|      | the CDR      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ap | The internal | ``str |          | ``false`` |
| p_ve | Kazoo        | ing`` |          |           |
| rsio | version      |       |          |           |
| n``  | number of    |       |          |           |
|      | the          |       |          |           |
|      | application  |       |          |           |
|      | that issued  |       |          |           |
|      | the CDR      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``bi | The number   | ``str |          | ``false`` |
| llin | of seconds   | ing`` |          |           |
| g_se | the call leg |       |          |           |
| cond | can be       |       |          |           |
| s``  | billed for   |       |          |           |
|      | (typically   |       |          |           |
|      | from when    |       |          |           |
|      | the call leg |       |          |           |
|      | is answered  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Direction of | ``str |          | ``false`` |
| ll_d | the call,    | ing(' |          |           |
| irec | relative to  | inbou |          |           |
| tion | the media    | nd',  |          |           |
| ``   | switch       | 'outb |          |           |
|      |              | ound' |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Unique       | ``str |          | ``true``  |
| ll_i | identifier   | ing`` |          |           |
| d``  | of the call  |       |          |           |
|      | leg          |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | The          | ``str |          | ``false`` |
| llee | indicated    | ing`` |          |           |
| _id_ | name of the  |       |          |           |
| name | callee       |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | The          | ``str |          | ``false`` |
| llee | indicated    | ing`` |          |           |
| _id_ | number of    |       |          |           |
| numb | the callee   |       |          |           |
| er`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | The          | ``str |          | ``false`` |
| ller | indicated    | ing`` |          |           |
| _id_ | name of the  |       |          |           |
| name | caller       |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | The          | ``str |          | ``false`` |
| ller | indicated    | ing`` |          |           |
| _id_ | number of    |       |          |           |
| numb | the caller   |       |          |           |
| er`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``cu | Kazoo-specif | ``obj |          | ``false`` |
| stom | ic           | ect`` |          |           |
| _cha | key/value    |       |          |           |
| nnel | pairs set on |       |          |           |
| _var | the channel  |       |          |           |
| s``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``cu | A property   | ``obj |          | ``false`` |
| stom | list of SIP  | ect`` |          |           |
| _sip | headers      |       |          |           |
| _hea | beging with  |       |          |           |
| ders | the prefix   |       |          |           |
| ``   | 'X-'         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``di | All the DTMF | ``str |          | ``false`` |
| gits | tones        | ing`` |          |           |
| _dia | detected on  |       |          |           |
| led` | this leg of  |       |          |           |
| `    | the call     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``di | Who sent the | ``str |          | ``false`` |
| spos | SIP BYE      | ing`` |          |           |
| itio | message      |       |          |           |
| n``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``du | The duration | ``str |          | ``false`` |
| rati | of the call  | ing`` |          |           |
| on_s | leg, in      |       |          |           |
| econ | seconds      |       |          |           |
| ds`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fa |              | ``str |          | ``false`` |
| x_ba |              | ing`` |          |           |
| d_ro |              |       |          |           |
| ws`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fa |              | ``str |          | ``false`` |
| x_ec |              | ing`` |          |           |
| m_us |              |       |          |           |
| ed`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fa |              | ``str |          | ``false`` |
| x_re |              | ing`` |          |           |
| sult |              |       |          |           |
| _cod |              |       |          |           |
| e``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fa |              | ``str |          | ``false`` |
| x_re |              | ing`` |          |           |
| sult |              |       |          |           |
| _tex |              |       |          |           |
| t``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fa |              | ``str |          | ``false`` |
| x_su |              | ing`` |          |           |
| cces |              |       |          |           |
| s``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fa |              | ``str |          | ``false`` |
| x_to |              | ing`` |          |           |
| tal_ |              |       |          |           |
| page |              |       |          |           |
| s``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fa |              | ``str |          | ``false`` |
| x_tr |              | ing`` |          |           |
| ansf |              |       |          |           |
| er_r |              |       |          |           |
| ate` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fa |              | ``str |          | ``false`` |
| x_tr |              | ing`` |          |           |
| ansf |              |       |          |           |
| erre |              |       |          |           |
| d_pa |              |       |          |           |
| ges` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fr | Built by     | ``str |          | ``false`` |
| om`` | Kazoo,       | ing`` |          |           |
|      | depending on |       |          |           |
|      | direction,   |       |          |           |
|      | to represent |       |          |           |
|      | the From     |       |          |           |
|      | user         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fr | The From SIP | ``str |          | ``false`` |
| om_u | URI          | ing`` |          |           |
| ri`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ha | The reason   | ``str |          | ``false`` |
| ngup | for the call | ing`` |          |           |
| _cau | leg's        |       |          |           |
| se`` | termination  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ha | The SIP      | ``str |          | ``false`` |
| ngup | hangup code, | ing`` |          |           |
| _cod | if available |       |          |           |
| e``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``lo | The SDP      | ``str |          | ``false`` |
| cal_ | negotiated   | ing`` |          |           |
| sdp` | by the local |       |          |           |
| `    | agent        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The hostname | ``str |          | ``false`` |
| dia_ | of the media | ing`` |          |           |
| serv | server that  |       |          |           |
| er`` | processed    |       |          |           |
|      | the call     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``no | The ecallmgr | ``str |          | ``false`` |
| de`` | which issued | ing`` |          |           |
|      | the CDR      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ot | If this leg  | ``str |          | ``false`` |
| her_ | was bridged, | ing`` |          |           |
| leg_ | the call-id  |       |          |           |
| call | of the       |       |          |           |
| _id` | opposite leg |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ot | Caller ID    | ``str |          | ``false`` |
| her_ | name of the  | ing`` |          |           |
| leg_ | bridged leg  |       |          |           |
| call |              |       |          |           |
| er_i |              |       |          |           |
| d_na |              |       |          |           |
| me`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ot | Caller ID    | ``str |          | ``false`` |
| her_ | number of    | ing`` |          |           |
| leg_ | the bridged  |       |          |           |
| call | leg          |       |          |           |
| er_i |              |       |          |           |
| d_nu |              |       |          |           |
| mber |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ot | Dialed       | ``str |          | ``false`` |
| her_ | number of    | ing`` |          |           |
| leg_ | the other    |       |          |           |
| dest | leg          |       |          |           |
| inat |              |       |          |           |
| ion_ |              |       |          |           |
| numb |              |       |          |           |
| er`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ot | direction of | ``str |          | ``false`` |
| her_ | the other    | ing`` |          |           |
| leg_ | leg,         |       |          |           |
| dire | relative to  |       |          |           |
| ctio | the media    |       |          |           |
| n``  | server       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | ID used in   | ``str |          | ``false`` |
| esen | NOTIFY SIP   | ing`` |          |           |
| ce_i | messages     |       |          |           |
| d``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | The SDP      | ``str |          | ``false`` |
| mote | negotiated   | ing`` |          |           |
| _sdp | by the       |       |          |           |
| ``   | remote agent |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | Built by     | ``str |          | ``false`` |
| ques | Kazoo this   | ing`` |          |           |
| t``  | is the       |       |          |           |
|      | processed    |       |          |           |
|      | request URI  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ri | How many     | ``str |          | ``false`` |
| ngin | seconds the  | ing`` |          |           |
| g_se | leg was      |       |          |           |
| cond | ringing      |       |          |           |
| s``  | (pre-answer) |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ti | UTC          | ``str |          | ``false`` |
| mest | timestamp,   | ing`` |          |           |
| amp` | in gregorian |       |          |           |
| `    | seconds, of  |       |          |           |
|      | when the CDR |       |          |           |
|      | was          |       |          |           |
|      | generated    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``to | Built by     | ``str |          | ``false`` |
| ``   | Kazoo,       | ing`` |          |           |
|      | depending on |       |          |           |
|      | direction,   |       |          |           |
|      | to represent |       |          |           |
|      | the To user  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``to | The To SIP   | ``str |          | ``false`` |
| _uri | URI          | ing`` |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``us | User agent   | ``str |          | ``false`` |
| er_a | header from  | ing`` |          |           |
| gent | SIP packet   |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+

Fetch a summary of CDRs
^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/cdrs

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/cdrs

Get a time range of CDRs (using gregorian seconds for timestamps):

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/cdrs?created_from={FROM_TIMESTAMP}&created_to={TO_TIMESTAMP}

Get CDRs as CSV:

.. code:: shell

    curl -v -X GET \
        -H "Accept: text/csv" \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/cdrs

Fetch a CDR's details
^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/cdrs/{CDR\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/cdrs/{CDR_ID}

Fetch interaction summary
^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/cdrs/interaction

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/cdrs/interaction

Fetch all legs related to an interaction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Crossbar cdrs was extended to provide simplified interaction call detail
records. It groups all CDRs that interacted with eachouther to form a
list of calls.

    GET /v2/accounts/{ACCOUNT\_ID}/cdrs/legs/{INTERACTION\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/cdrs/legs/{INTERACTION_ID}

Variations
^^^^^^^^^^

You can select CDRs/interactions for a specific user by adding them to
the URI:

    GET /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}/cdrs

Notes on fields
^^^^^^^^^^^^^^^

Some fields need a little more explanation to help you understand what
they are telling you about the call leg.

-  ``call_direction`` - direction of the leg, relative to the media
   switch
-  ``inbound`` - leg came into the media switch (typically the A-leg)
-  ``outbound`` - leg started on the media switch (typically the B-leg)
-  ``hangup_cause`` - The reason why the call leg ended. See the
   `FreeSWITCH Hangup
   Causes <http://wiki.freeswitch.org/wiki/Hangup_causes>`__ page for
   descriptions.
-  ``billing_seconds`` - How many seconds of the call are billable (post
   answer, normally)
-  ``to`` - Depends on the direction of the leg
-  outbound - Uses the presence-id or else it uses the SIP Request
   address
-  inbound - the SIP To header

Kazoo-specific properties
^^^^^^^^^^^^^^^^^^^^^^^^^

These are properties set by Kazoo for internal purposes. These are the
properties found under the ``custom_channel_vars`` property at the
top-level of the CDR JSON object. The non-exhaustive list of properties:

-  ``account_id`` - Account ID this leg belongs to
-  ``authorizing_id`` - Document ID used to authorize this call leg
-  ``authorizing_type`` - Type of ducument used to authorize call
-  ``device`` - the call leg is to/from a known Kazoo device
-  ``resource`` - the call leg is from a known offnet carrier
-  ``outbound_fax``
-  ``bridge_id`` - Typically the A-leg's call-id; helps with tracking
   transfers
-  ``ecallmgr_node`` - Which ecallmgr node is processing the call leg
-  ``fetch_id`` - The dialplan XML fetch ID from FreeSWITCH
-  ``realm`` - the SIP realm of the account
-  ``resource_id`` - Resource ID used for the leg; typically a carrier,
   local or global, that the call was routed to
-  ``username`` - the SIP username of the endpoint that started the leg

Billing-related Properties
''''''''''''''''''''''''''

These properties relate to how the leg was rated and billed. Some of
these properties are not accessible via Crossbar, but may exist on the
CDR

-  ``reseller_billing`` - tag describing what billing was used for the
   reseller
-  ``reseller_id`` - Account ID of the reseller for the account of this
   leg
-  ``account_billing`` - tag describing what billing was used for the
   account
-  ``rate`` - Rate of the call
-  ``base_cost`` - How much the call costs to start (if per-minute)
-  ``rate_name`` - Name of the rate doc used
-  ``surcharge`` - Surcharge added to the leg
-  ``rate_minimum`` - Minimum number of seconds to bill for
-  ``rate_increment`` - Increment of seconds to bill for

Fax-specific Properties
'''''''''''''''''''''''

These properties may exist on a CDR for a fax request (inbound or
outbound):

-  ``fax_transfer_rate`` - Baud of the fax transfer
-  ``fax_bad_rows`` - Number of rows that failed to transfer
-  ``fax_total_pages`` - Number of pages in the fax (see
   ``fax_transferred_pages`` for how many made it)
-  ``fax_transferred_pages`` - Number of pages transferred
-  ``fax_ecm_used`` - Was ECM (error correction mode) used on the fax
-  ``fax_result_text`` - Error String, if any, or 'OK' if successful
-  ``fax_result_code`` - `Result
   code <http://wiki.freeswitch.org/wiki/Variable_fax_result_code>`__ of
   the transmission
-  ``fax_success`` - boolean for whether the fax was considered a
   success
-  ``fax_t38`` - boolean for whether the fax T.38 was used
