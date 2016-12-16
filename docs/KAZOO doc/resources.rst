Resources
~~~~~~~~~

About Resources
^^^^^^^^^^^^^^^

Resources represent external assets such as TDM hardware, SIP trunks,
transcoders, and other remote termination/originating call services or
equipment.

There are two levels of resources, global (or system-wide), and
per-account (bring your own carrier). The JSON format for both is
identical; only their location in the Kazoo database structure defines
whether they are globally available or not.

When interacting with an account's resources, the URL structure is as
one would expect: ``/v2/accounts/{ACCOUNT_ID}/resources/{RESOURCE_ID}``.
To modify the global resources, simply omit ``/accounts/{ACCOUNT_ID}``
from the URL (your auth token must have super-duper admin privileges).

There are two deprecated API endpoints, ``global_resources`` and
``local_resources``. These should continue to work as before, but it is
recommended to use ``resources`` instead, using the presence of an
account id to toggle whether the resource is global or not.

About Adding Bulk Numbers
^^^^^^^^^^^^^^^^^^^^^^^^^

It is possible to add numbers, in bulk, to an account using the Jobs API
below. If a job fails to run, there is a recovery process that runs
periodically to attempt to resume stalled jobs.

You can configure how frequently the system checks for failed jobs in
``system_config/crossbar.resources``, using the
``job_recover_timeout_s`` key (defaults to 6 hours).

You can configure how what is considered a 'stalled' job by defining how
old the job is (the last time the job document was modified) relative to
the current time. Configure in ``system_config/crossbar.resources``,
using the ``job_recover_threshold_s`` key (defaults to 1 hour). If a job
is not completed, and hasn't been modified in over an hour, there's a
good chance the job executor died. A new job executor will be started to
pick up where the old one left off.

Resources Schema
^^^^^^^^^^^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``em | Determines   | ``boo | ``false` | ``false`` |
| erge | if the       | lean` | `        |           |
| ncy` | resource     | `     |          |           |
| `    | represents   |       |          |           |
|      | emergency    |       |          |           |
|      | services     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``en | Determines   | ``boo | ``true`` | ``false`` |
| able | if the       | lean` |          |           |
| d``  | resource is  | `     |          |           |
|      | currently    |       |          |           |
|      | enabled      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fl | A list of    | ``arr | ``[]``   | ``false`` |
| ags` | flags that   | ay(st |          |           |
| `    | can be       | ring) |          |           |
|      | provided on  | ``    |          |           |
|      | the request  |       |          |           |
|      | and must     |       |          |           |
|      | match for    |       |          |           |
|      | the resource |       |          |           |
|      | to be        |       |          |           |
|      | eligible     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fl |              | ``str |          | ``false`` |
| ags. |              | ing`` |          |           |
| []`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fo | When set to  | ``boo |          | ``false`` |
| rmat | true         | lean` |          |           |
| _fro | requests to  | `     |          |           |
| m_ur | this         |       |          |           |
| i``  | resource     |       |          |           |
|      | will have a  |       |          |           |
|      | re-formated  |       |          |           |
|      | SIP From     |       |          |           |
|      | Header       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fr | When         | ``str |          | ``false`` |
| om_u | formating    | ing`` |          |           |
| ri_r | SIP From on  |       |          |           |
| ealm | outbound     |       |          |           |
| ``   | requests     |       |          |           |
|      | this can be  |       |          |           |
|      | used to      |       |          |           |
|      | override the |       |          |           |
|      | realm        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | A list of    | ``arr |          | ``true``  |
| tewa | gateways     | ay(ob |          |           |
| ys`` | avaliable    | ject) |          |           |
|      | for this     | ``    |          |           |
|      | resource     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | The resource | ``boo |          | ``false`` |
| tewa | gateway      | lean` |          |           |
| ys.[ | bypass media | `     |          |           |
| ].by | mode         |       |          |           |
| pass |              |       |          |           |
| _med |              |       |          |           |
| ia`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | The type of  | ``str |          | ``false`` |
| tewa | caller id to | ing(' |          |           |
| ys.[ | use          | inter |          |           |
| ].ca |              | nal', |          |           |
| ller |              |  'ext |          |           |
| _id_ |              | ernal |          |           |
| type |              | ', 'e |          |           |
| ``   |              | merge |          |           |
|      |              | ncy') |          |           |
|      |              | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | Automatic    | ``str | ``ascend | ``false`` |
| tewa | selection of | ing(' | ing``    |           |
| ys.[ | the channel  | ascen |          |           |
| ].ch | within the   | ding' |          |           |
| anne | span:        | , 'de |          |           |
| l_se | ascending    | scend |          |           |
| lect | starts at 1  | ing') |          |           |
| ion` | and moves    | ``    |          |           |
| `    | up;          |       |          |           |
|      | descending   |       |          |           |
|      | is the       |       |          |           |
|      | opposite     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | A list of    | ``arr |          | ``false`` |
| tewa | single list  | ay(st |          |           |
| ys.[ | codecs       | ring( |          |           |
| ].co | supported by | 'G729 |          |           |
| decs | this gateway | ', 'P |          |           |
| ``   | (to support  | CMU', |          |           |
|      | backward     |  'PCM |          |           |
|      | compatibilty | A', ' |          |           |
|      | )            | G722_ |          |           |
|      |              | 16',  |          |           |
|      |              | 'G722 |          |           |
|      |              | _32', |          |           |
|      |              |  'CEL |          |           |
|      |              | T_48' |          |           |
|      |              | , 'CE |          |           |
|      |              | LT_64 |          |           |
|      |              | ', 'S |          |           |
|      |              | peex' |          |           |
|      |              | , 'GS |          |           |
|      |              | M', ' |          |           |
|      |              | OPUS' |          |           |
|      |              | , 'H2 |          |           |
|      |              | 61',  |          |           |
|      |              | 'H263 |          |           |
|      |              | ', 'H |          |           |
|      |              | 264', |          |           |
|      |              |  'VP8 |          |           |
|      |              | '))`` |          |           |
+------+--------------+-------+----------+-----------+
| ``ga |              | ``str |          | ``false`` |
| tewa |              | ing`` |          |           |
| ys.[ |              |       |          |           |
| ].co |              |       |          |           |
| decs |              |       |          |           |
| .[]` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga |              | ``obj | ``{}``   | ``false`` |
| tewa |              | ect`` |          |           |
| ys.[ |              |       |          |           |
| ].cu |              |       |          |           |
| stom |              |       |          |           |
| _sip |              |       |          |           |
| _hea |              |       |          |           |
| ders |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | The name of  | ``str |          | ``false`` |
| tewa | a custom SIP | ing`` |          |           |
| ys.[ | interface    |       |          |           |
| ].cu |              |       |          |           |
| stom |              |       |          |           |
| _sip |              |       |          |           |
| _int |              |       |          |           |
| erfa |              |       |          |           |
| ce`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | Determines   | ``boo | ``true`` | ``false`` |
| tewa | if the       | lean` |          |           |
| ys.[ | resource     | `     |          |           |
| ].en | gateway is   |       |          |           |
| able | currently    |       |          |           |
| d``  | enabled      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | What type of | ``str | ``sip``  | ``false`` |
| tewa | endpoint is  | ing(' |          |           |
| ys.[ | this gateway | sip', |          |           |
| ].en |              |  'fre |          |           |
| dpoi |              | etdm' |          |           |
| nt_t |              | , 'sk |          |           |
| ype` |              | ype', |          |           |
| `    |              |  'amq |          |           |
|      |              | p')`` |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | Allow        | ``boo | ``false` | ``false`` |
| tewa | request only | lean` | `        |           |
| ys.[ | from this    | `     |          |           |
| ].fo | port         |       |          |           |
| rce_ |              |       |          |           |
| port |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | When set to  | ``boo |          | ``false`` |
| tewa | true         | lean` |          |           |
| ys.[ | requests to  | `     |          |           |
| ].fo | this         |       |          |           |
| rmat | resource     |       |          |           |
| _fro | gateway will |       |          |           |
| m_ur | have a       |       |          |           |
| i``  | re-formated  |       |          |           |
|      | SIP From     |       |          |           |
|      | Header       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | When         | ``str |          | ``false`` |
| tewa | formating    | ing`` |          |           |
| ys.[ | SIP From on  |       |          |           |
| ].fr | outbound     |       |          |           |
| om_u | requests     |       |          |           |
| ri_r | this can be  |       |          |           |
| ealm | used to      |       |          |           |
| ``   | override the |       |          |           |
|      | realm        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | The format   | ``str | ``route` | ``false`` |
| tewa | of the DID   | ing(' | `        |           |
| ys.[ | needed by    | route |          |           |
| ].in | the          | ', 'u |          |           |
| vite | underlying   | serna |          |           |
| _for | hardware/gat | me',  |          |           |
| mat` | eway         | 'e164 |          |           |
| `    |              | ', 'n |          |           |
|      |              | pan', |          |           |
|      |              |  '1np |          |           |
|      |              | an')` |          |           |
|      |              | `     |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | The media    | ``obj |          | ``false`` |
| tewa | parameters   | ect`` |          |           |
| ys.[ | for the      |       |          |           |
| ].me | resource     |       |          |           |
| dia` | gateway      |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | Support T.38 | ``boo |          | ``false`` |
| tewa |              | lean` |          |           |
| ys.[ |              | `     |          |           |
| ].me |              |       |          |           |
| dia. |              |       |          |           |
| fax_ |              |       |          |           |
| opti |              |       |          |           |
| on`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | SIP          | ``str |          | ``false`` |
| tewa | authenticati | ing(0 |          |           |
| ys.[ | on           | ..32) |          |           |
| ].pa | password     | ``    |          |           |
| sswo |              |       |          |           |
| rd`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | This         | ``int | ``5060`` | ``false`` |
| tewa | resource     | eger` |          |           |
| ys.[ | gateway port | `     |          |           |
| ].po |              |       |          |           |
| rt`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | A string to  | ``str |          | ``false`` |
| tewa | prepend to   | ing(0 |          |           |
| ys.[ | the dialed   | ..64) |          |           |
| ].pr | number or    | ``    |          |           |
| efix | capture      |       |          |           |
| ``   | group of the |       |          |           |
|      | matching     |       |          |           |
|      | rule         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | The progress | ``int |          | ``false`` |
| tewa | timeout to   | eger` |          |           |
| ys.[ | apply to the | `     |          |           |
| ].pr | resource     |       |          |           |
| ogre | gateway      |       |          |           |
| ss_t |              |       |          |           |
| imeo |              |       |          |           |
| ut`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | This         | ``str |          | ``false`` |
| tewa | resource     | ing(0 |          |           |
| ys.[ | gateway      | ..64) |          |           |
| ].re | authenticati | ``    |          |           |
| alm` | on           |       |          |           |
| `    | realm        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | A staticly   | ``str |          | ``false`` |
| tewa | configured   | ing`` |          |           |
| ys.[ | SIP URI to   |       |          |           |
| ].ro | route all    |       |          |           |
| ute` | call to      |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | This         | ``str |          | ``true``  |
| tewa | resource     | ing(1 |          |           |
| ys.[ | gateway      | ..64) |          |           |
| ].se | server       | ``    |          |           |
| rver |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | The name of  | ``str |          | ``false`` |
| tewa | the Skype    | ing`` |          |           |
| ys.[ | interface to |       |          |           |
| ].sk | route the    |       |          |           |
| ype_ | call over    |       |          |           |
| inte |              |       |          |           |
| rfac |              |       |          |           |
| e``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | Determines   | ``boo | ``true`` | ``false`` |
| tewa | whether to   | lean` |          |           |
| ys.[ | round-robin  | `     |          |           |
| ].sk | calls        |       |          |           |
| ype_ | amongst all  |       |          |           |
| rr`` | interfaces   |       |          |           |
|      | (overrides   |       |          |           |
|      | "skype\_inte |       |          |           |
|      | rface"       |       |          |           |
|      | setting)     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | The identity | ``str |          | ``false`` |
| tewa | of the       | ing`` |          |           |
| ys.[ | hardware on  |       |          |           |
| ].sp | the media    |       |          |           |
| an`` | server       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | A string to  | ``str |          | ``false`` |
| tewa | append to    | ing(0 |          |           |
| ys.[ | the dialed   | ..64) |          |           |
| ].su | number or    | ``    |          |           |
| ffix | capture      |       |          |           |
| ``   | group of the |       |          |           |
|      | matching     |       |          |           |
|      | rule         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ga | SIP          | ``str |          | ``false`` |
| tewa | authenticati | ing(0 |          |           |
| ys.[ | on           | ..32) |          |           |
| ].us | username     | ``    |          |           |
| erna |              |       |          |           |
| me`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``gr | The amount   | ``int | ``5``    | ``false`` |
| ace_ | of time, in  | eger` |          |           |
| peri | seconds, to  | `     |          |           |
| od`` | wait before  |       |          |           |
|      | starting     |       |          |           |
|      | another      |       |          |           |
|      | resource     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The default  | ``obj | ``{}``   | ``false`` |
| dia` | resouce      | ect`` |          |           |
| `    | media        |       |          |           |
|      | parameters   |       |          |           |
|      | applied if   |       |          |           |
|      | not present  |       |          |           |
|      | to all       |       |          |           |
|      | specified    |       |          |           |
|      | gateways     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The default  | ``obj | ``{}``   | ``false`` |
| dia. | audio media  | ect`` |          |           |
| audi | parameters   |       |          |           |
| o``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | A list of    | ``arr | ``PCMU`` | ``false`` |
| dia. | default      | ay(st |          |           |
| audi | codecs to    | ring( |          |           |
| o.co | use          | 'OPUS |          |           |
| decs |              | ', 'C |          |           |
| ``   |              | ELT@3 |          |           |
|      |              | 2000h |          |           |
|      |              | ', 'G |          |           |
|      |              | 7221@ |          |           |
|      |              | 32000 |          |           |
|      |              | h', ' |          |           |
|      |              | G7221 |          |           |
|      |              | @1600 |          |           |
|      |              | 0h',  |          |           |
|      |              | 'G722 |          |           |
|      |              | ', 's |          |           |
|      |              | peex@ |          |           |
|      |              | 32000 |          |           |
|      |              | h', ' |          |           |
|      |              | speex |          |           |
|      |              | @1600 |          |           |
|      |              | 0h',  |          |           |
|      |              | 'PCMU |          |           |
|      |              | ', 'P |          |           |
|      |              | CMA', |          |           |
|      |              |  'G72 |          |           |
|      |              | 9', ' |          |           |
|      |              | GSM', |          |           |
|      |              |  'CEL |          |           |
|      |              | T@480 |          |           |
|      |              | 00h', |          |           |
|      |              |  'CEL |          |           |
|      |              | T@640 |          |           |
|      |              | 00h', |          |           |
|      |              |  'G72 |          |           |
|      |              | 2_16' |          |           |
|      |              | , 'G7 |          |           |
|      |              | 22_32 |          |           |
|      |              | ', 'C |          |           |
|      |              | ELT_4 |          |           |
|      |              | 8', ' |          |           |
|      |              | CELT_ |          |           |
|      |              | 64',  |          |           |
|      |              | 'Spee |          |           |
|      |              | x', ' |          |           |
|      |              | speex |          |           |
|      |              | '))`` |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``str |          | ``false`` |
| dia. |              | ing`` |          |           |
| audi |              |       |          |           |
| o.co |              |       |          |           |
| decs |              |       |          |           |
| .[]` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Default      | ``boo |          | ``false`` |
| dia. | bypass media | lean` |          |           |
| bypa | mode         | `     |          |           |
| ss_m |              |       |          |           |
| edia |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Support T.38 | ``boo |          | ``false`` |
| dia. |              | lean` |          |           |
| fax_ |              | `     |          |           |
| opti |              |       |          |           |
| on`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The default  | ``obj | ``{}``   | ``false`` |
| dia. | video media  | ect`` |          |           |
| vide | parameters   |       |          |           |
| o``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | A list of    | ``arr | ``[]``   | ``false`` |
| dia. | default      | ay(st |          |           |
| vide | codecs to    | ring( |          |           |
| o.co | use          | 'H261 |          |           |
| decs |              | ', 'H |          |           |
| ``   |              | 263', |          |           |
|      |              |  'H26 |          |           |
|      |              | 4', ' |          |           |
|      |              | VP8') |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``str |          | ``false`` |
| dia. |              | ing`` |          |           |
| vide |              |       |          |           |
| o.co |              |       |          |           |
| decs |              |       |          |           |
| .[]` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``na | A friendly   | ``str |          | ``true``  |
| me`` | name for the | ing(1 |          |           |
|      | resource     | ..128 |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``re | When set to  | ``boo |          | ``false`` |
| quir | true this    | lean` |          |           |
| e_fl | resource is  | `     |          |           |
| ags` | ignored if   |       |          |           |
| `    | the request  |       |          |           |
|      | does not     |       |          |           |
|      | specify      |       |          |           |
|      | outbound     |       |          |           |
|      | flags        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ru | A list of    | ``arr | ``[]``   | ``false`` |
| les` | regular      | ay(st |          |           |
| `    | expressions  | ring) |          |           |
|      | of which one | ``    |          |           |
|      | must match   |       |          |           |
|      | for the rule |       |          |           |
|      | to be        |       |          |           |
|      | eligible,    |       |          |           |
|      | they can     |       |          |           |
|      | optionally   |       |          |           |
|      | contain      |       |          |           |
|      | capture      |       |          |           |
|      | groups       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ru |              | ``str |          | ``false`` |
| les. |              | ing`` |          |           |
| []`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``we | A value      | ``int | ``50``   | ``false`` |
| ight | between 0    | eger` |          |           |
| _cos | and 100 that | `     |          |           |
| t``  | determines   |       |          |           |
|      | the order of |       |          |           |
|      | resources    |       |          |           |
|      | when         |       |          |           |
|      | multiple can |       |          |           |
|      | be used      |       |          |           |
+------+--------------+-------+----------+-----------+

Fetch an account's resources
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/resources

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
             {"enabled": true,
              "id": "{RESOURCE_ID}",
              "name": "Carrier1",
              "weight": "50"
             },
             {"enabled": true,
              "id": "{RESOURCE_ID}",
              "name": "Carrier2",
              "weight": "50"
             }
        ],
        "page_size": 2,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION_ID}",
        "status": "success"
    }

Create a new resource
^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/resources

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"name":"Carrier 3", "gateways":[]}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "emergency": false,
            "enabled": true,
            "flags": [],
            "gateways": [],
            "grace_period": 5,
            "id": "{RESOURCE_ID}",
            "media": {
                "audio": {
                    "codecs": ["PCMU"]
                 },
                 "video": {
                     "codecs": []
                 }
             },
             "name": "Carrier 3",
             "rules": [],
             "weight_cost": 50
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION_ID}",
        "status": "success"
    }

Remove a resource
^^^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/resources/{RESOURCE\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources/{RESOURCE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "caller_id_options": {
                "type": "external"
            },
            "emergency": false,
            "enabled": true,
            "flags": [],
            "gateways": [
                {
                    "channel_selection": "ascending",
                    "codecs": ["PCMU", "PCMA"],
                    "custom_sip_headers": {},
                    "emergency": false,
                    "enabled": true,
                    "endpoint_type": "sip",
                    "format_from_uri": false,
                    "invite_format": "route",
                    "password": "DrWoody",
                    "prefix": "+1",
                    "progress_timeout": "6",
                    "realm": "carrier1.com",
                    "server": "carrier1.com",
                    "skype_rr": true,
                    "suffix": "100",
                    "username": "blazemore"
                }
            ],
            "grace_period": 5,
            "id": "{RESOURCE_ID}",
            "media": {
                "audio": {
                    "codecs": ["PCMU"]
                },
                "video": {
                    "codecs": []
                }
            },
            "name": "Carrier 3",
            "peer": false,
            "rules": [
                "^\\+{0,1}1{0,1}(\\d{10})$"
            ],
            "type": "local",
            "weight_cost": "50"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION_ID}",
        "status": "success"
    }

Fetch a resource
^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/resources/{RESOURCE\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources/{RESOURCE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "caller_id_options": {
                "type": "external"
            },
            "emergency": false,
            "enabled": true,
            "flags": [],
            "gateways": [
                {
                    "channel_selection": "ascending",
                    "codecs": ["PCMU", "PCMA"],
                    "custom_sip_headers": {},
                    "emergency": false,
                    "enabled": true,
                    "endpoint_type": "sip",
                    "format_from_uri": false,
                    "invite_format": "route",
                    "password": "DrWoody",
                    "prefix": "+1",
                    "progress_timeout": "6",
                    "realm": "carrier1.com",
                    "server": "carrier1.com",
                    "skype_rr": true,
                    "suffix": "100",
                    "username": "blazemore"
                }
            ],
            "grace_period": 5,
            "id": "{RESOURCE_ID}",
            "media": {
                "audio": {
                    "codecs": ["PCMU"]
                },
                "video": {
                    "codecs": []
                }
            },
            "name": "Carrier 3",
            "peer": false,
            "rules": [
                "^\\+{0,1}1{0,1}(\\d{10})$"
            ],
            "type": "local",
            "weight_cost": "50"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION_ID}",
        "status": "success"
    }

Change a resource
^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/resources/{RESOURCE\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{...ResourceData...}}'
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources/{RESOURCE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "caller_id_options": {
                "type": "external"
            },
            "emergency": false,
            "enabled": true,
            "flags": [],
            "gateways": [
                {
                    "channel_selection": "ascending",
                    "codecs": ["PCMU", "PCMA"],
                    "custom_sip_headers": {},
                    "emergency": false,
                    "enabled": true,
                    "endpoint_type": "sip",
                    "format_from_uri": false,
                    "invite_format": "route",
                    "password": "DrWoody",
                    "prefix": "+1",
                    "progress_timeout": "6",
                    "realm": "carrier1.com",
                    "server": "carrier1.com",
                    "skype_rr": true,
                    "suffix": "100",
                    "username": "blazemore"
                }
            ],
            "grace_period": 5,
            "id": "{RESOURCE_ID}",
            "media": {
                "audio": {
                    "codecs": ["PCMU"]
                },
                "video": {
                    "codecs": []
                }
            },
            "name": "Carrier 3",
            "peer": false,
            "rules": [
                "^\\+{0,1}1{0,1}(\\d{10})$"
            ],
            "type": "local",
            "weight_cost": "50"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION_ID}",
        "status": "success"
    }

Fetch a listing of jobs
^^^^^^^^^^^^^^^^^^^^^^^

Do note you can use the ``created_from`` and ``created_to`` flags to
change to time period queried.

The keys ``failures`` and ``successes`` represent the count of how many
numbers failed and succeeded, respectively.

    GET /v2/accounts/{ACCOUNT\_ID}/resources/jobs

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources/jobs

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "failures": 0,
                "successes": 2,
                "id": "201408-394de70ecf6f8252",
                "status": "pending",
                "timestamp": 63575950041,
                "resource_id":{RESOURCE_ID}
            },
            {
                "failures": 0,
                "successes": 1,
                "id": "201408-70766ed00a24",
                "status": "pending",
                "timestamp": 63575878379,
                "resource_id":{RESOURCE_ID}
            }
        ]
        "page_size": 2,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "start_key": 63573276761,
        "status": "success"
    }

Create a new job
^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/resources/jobs

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"numbers":["+12223334444", "+23334445555"], "resource_id":"{RESOURCE_ID}"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources/jobs

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "errors": {},
            "id": "201408-39512771f9d2d499",
            "resource_id":"{RESOURCE_ID}",
            "numbers": [
                "+12223334444"
            ],
            "successes": {}
         },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Change a collection
^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/resources/collection

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"numbers":["+12223334444", "+23334445555"], "resource_id":"{RESOURCE_ID}"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources/collection

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data":{
            "errors":{
                "{RESOURCE_ID}":"{ERROR_MESSAGE}"
            },
            "successes":{
                "{RESOURCE_ID}":{RESOURCE_DOC}
            }
        }
    }

Create a new collection of resources
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/resources/collection

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":[{...RESOURCE...}, {...RESOURCE...}]}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources/collection

Fetch a job's status
^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/resources/jobs/{JOB\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/resources/jobs/{JOB_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "resource_id": "{RESOURCE_ID}",
            "errors": {},
            "id": "201408-394de70ecf6f8252",
            "numbers": [
                "3148096310"
            ],
            "status": "pending",
            "successes": {},
            "timestamp": 63575950041
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }
