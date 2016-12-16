Users
~~~~~

About Users
^^^^^^^^^^^

Users represent just that, your users of the system. You can assign multiple devices to a user, put the user in a callflow, and all devices will ring.

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``ca | The device   | ``obj |          | ``false`` |
| ll_f | call forward | ect`` |          |           |
| orwa | parameters   |       |          |           |
| rd`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Determines   | ``boo | ``false` | ``false`` |
| ll_f | if the calls | lean` | `        |           |
| orwa | that are not | `     |          |           |
| rd.d | directly     |       |          |           |
| irec | sent to the  |       |          |           |
| t_ca | device       |       |          |           |
| lls_ | should be    |       |          |           |
| only | forwarded    |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Determines   | ``boo | ``false` | ``false`` |
| ll_f | if the call  | lean` | `        |           |
| orwa | forwarding   | `     |          |           |
| rd.e | should be    |       |          |           |
| nabl | used         |       |          |           |
| ed`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Enable the   | ``boo | ``false` | ``false`` |
| ll_f | call-forward | lean` | `        |           |
| orwa | ing          | `     |          |           |
| rd.f | parameters   |       |          |           |
| ailo | if the       |       |          |           |
| ver` | device is    |       |          |           |
| `    | offline      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | The option   | ``boo | ``true`` | ``false`` |
| ll_f | to determine | lean` |          |           |
| orwa | if early     | `     |          |           |
| rd.i | media from   |       |          |           |
| gnor | the call     |       |          |           |
| e_ea | forwarded    |       |          |           |
| rly_ | number       |       |          |           |
| medi | should       |       |          |           |
| a``  | ignored      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Determines   | ``boo | ``true`` | ``false`` |
| ll_f | if the       | lean` |          |           |
| orwa | caller id is | `     |          |           |
| rd.k | kept when    |       |          |           |
| eep_ | the call is  |       |          |           |
| call | forwarded,   |       |          |           |
| er_i | if not the   |       |          |           |
| d``  | devices      |       |          |           |
|      | caller id is |       |          |           |
|      | used         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | The number   | ``str |          | ``false`` |
| ll_f | to forward   | ing(0 |          |           |
| orwa | calls to     | ..35) |          |           |
| rd.n |              | ``    |          |           |
| umbe |              |       |          |           |
| r``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Determines   | ``boo | ``true`` | ``false`` |
| ll_f | if the       | lean` |          |           |
| orwa | callee is    | `     |          |           |
| rd.r | prompted to  |       |          |           |
| equi | press 1 to   |       |          |           |
| re_k | accept the   |       |          |           |
| eypr | call         |       |          |           |
| ess` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Determines   | ``boo | ``true`` | ``false`` |
| ll_f | if the call  | lean` |          |           |
| orwa | forwarding   | `     |          |           |
| rd.s | replaces the |       |          |           |
| ubst | device       |       |          |           |
| itut |              |       |          |           |
| e``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Device level | ``obj | ``{}``   | ``false`` |
| ll_r | call         | ect`` |          |           |
| estr | restrictions |       |          |           |
| icti | for each     |       |          |           |
| on`` | available    |       |          |           |
|      | number       |       |          |           |
|      | classificati |       |          |           |
|      | on           |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca |              |       |          | ``false`` |
| ll_w |              |       |          |           |
| aiti |              |       |          |           |
| ng`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | The device   | ``obj | ``{}``   | ``false`` |
| ller | caller ID    | ect`` |          |           |
| _id` | parameters   |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``co |              | ``obj | ``{}``   | ``false`` |
| ntac |              | ect`` |          |           |
| t_li |              |       |          |           |
| st`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``co | If set to    | ``boo |          | ``false`` |
| ntac | true the     | lean` |          |           |
| t_li | device is    | `     |          |           |
| st.e | excluded     |       |          |           |
| xclu | from the     |       |          |           |
| de`` | contact list |       |          |           |
+------+--------------+-------+----------+-----------+
| ``di | A list of    | ``obj | ``{}``   | ``false`` |
| al_p | rules used   | ect`` |          |           |
| lan` | to modify    |       |          |           |
| `    | dialed       |       |          |           |
|      | numbers      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``di | Provides the | ``obj |          | ``false`` |
| rect | mappings for | ect`` |          |           |
| orie | what         |       |          |           |
| s``  | directory    |       |          |           |
|      | the user is  |       |          |           |
|      | a part of    |       |          |           |
|      | (the key),   |       |          |           |
|      | and what     |       |          |           |
|      | callflow     |       |          |           |
|      | (the value)  |       |          |           |
|      | to invoke if |       |          |           |
|      | the user is  |       |          |           |
|      | selected by  |       |          |           |
|      | the caller.  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do |              | ``obj |          | ``false`` |
| _not |              | ect`` |          |           |
| _dis |              |       |          |           |
| turb |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do | Is           | ``boo |          | ``false`` |
| _not | do-not-distu | lean` |          |           |
| _dis | rb           | `     |          |           |
| turb | enabled for  |       |          |           |
| .ena | this user?   |       |          |           |
| bled |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``em | The email of | ``str |          | ``false`` |
| ail` | the user     | ing(1 |          |           |
| `    |              | ..254 |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``en | Determines   | ``boo | ``true`` | ``false`` |
| able | if the user  | lean` |          |           |
| d``  | is currently | `     |          |           |
|      | enabled      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fe | The user     | ``str |          | ``false`` |
| atur | level for    | ing`` |          |           |
| e_le | assigning    |       |          |           |
| vel` | feature sets |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fi | The first    | ``str |          | ``true``  |
| rst_ | name of the  | ing(1 |          |           |
| name | user         | ..128 |          |           |
| ``   |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``ho | The user     | ``obj | ``{}``   | ``false`` |
| tdes | hotdesk      | ect`` |          |           |
| k``  | parameters   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ho | Determines   | ``boo | ``false` | ``false`` |
| tdes | if the user  | lean` | `        |           |
| k.en | has          | `     |          |           |
| able | hotdesking   |       |          |           |
| d``  | enabled      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ho | The users    | ``str |          | ``false`` |
| tdes | hotdesk id   | ing(0 |          |           |
| k.id |              | ..15) |          |           |
| ``   |              | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``ho | Determines   | ``boo | ``false` | ``false`` |
| tdes | if user      | lean` | `        |           |
| k.ke | should be    | `     |          |           |
| ep_l | able to      |       |          |           |
| ogge | login to     |       |          |           |
| d_in | mutliple     |       |          |           |
| _els | phones       |       |          |           |
| ewhe | simultaneous |       |          |           |
| re`` | ly           |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ho | The users    | ``str |          | ``false`` |
| tdes | hotdesk pin  | ing(4 |          |           |
| k.pi | number       | ..15) |          |           |
| n``  |              | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``ho | Determines   | ``boo | ``false` | ``false`` |
| tdes | if user      | lean` | `        |           |
| k.re | requires a   | `     |          |           |
| quir | pin to       |       |          |           |
| e_pi | change the   |       |          |           |
| n``  | hotdesk      |       |          |           |
|      | state        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``la | The language | ``str |          | ``false`` |
| ngua | for this     | ing`` |          |           |
| ge`` | user         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``la | The last     | ``str |          | ``true``  |
| st_n | name of the  | ing(1 |          |           |
| ame` | user         | ..128 |          |           |
| `    |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The device   | ``obj | ``{}``   | ``false`` |
| dia` | media        | ect`` |          |           |
| `    | parameters   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The audio    | ``obj | ``{}``   | ``false`` |
| dia. | media        | ect`` |          |           |
| audi | parameters   |       |          |           |
| o``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | A list of    | ``arr | ``PCMU`` | ``false`` |
| dia. | audio codecs | ay(st |          |           |
| audi | the device   | ring( |          |           |
| o.co | supports     | 'OPUS |          |           |
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
| dia. | bypass media | lean, |          |           |
| bypa | mode         |  stri |          |           |
| ss_m |              | ng('t |          |           |
| edia |              | rue', |          |           |
| ``   |              |  'fal |          |           |
|      |              | se',  |          |           |
|      |              | 'auto |          |           |
|      |              | ')``  |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``obj | ``{}``   | ``false`` |
| dia. |              | ect`` |          |           |
| encr |              |       |          |           |
| ypti |              |       |          |           |
| on`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``boo | ``false` | ``false`` |
| dia. |              | lean` | `        |           |
| encr |              | `     |          |           |
| ypti |              |       |          |           |
| on.e |              |       |          |           |
| nfor |              |       |          |           |
| ce_s |              |       |          |           |
| ecur |              |       |          |           |
| ity` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``arr | ``[]``   | ``false`` |
| dia. |              | ay(st |          |           |
| encr |              | ring( |          |           |
| ypti |              | 'zrtp |          |           |
| on.m |              | ', 's |          |           |
| etho |              | rtp') |          |           |
| ds`` |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``str |          | ``false`` |
| dia. |              | ing`` |          |           |
| encr |              |       |          |           |
| ypti |              |       |          |           |
| on.m |              |       |          |           |
| etho |              |       |          |           |
| ds.[ |              |       |          |           |
| ]``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Support T.38 | ``boo |          | ``false`` |
| dia. |              | lean` |          |           |
| fax_ |              | `     |          |           |
| opti |              |       |          |           |
| on`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The option   | ``boo |          | ``false`` |
| dia. | to determine | lean` |          |           |
| igno | if early     | `     |          |           |
| re_e | media from   |       |          |           |
| arly | the device   |       |          |           |
| _med | should       |       |          |           |
| ia`` | always be    |       |          |           |
|      | ignored      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The progress | ``int |          | ``false`` |
| dia. | timeout to   | eger` |          |           |
| prog | apply to the | `     |          |           |
| ress | device       |       |          |           |
| _tim |              |       |          |           |
| eout |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | The video    | ``obj | ``{}``   | ``false`` |
| dia. | media        | ect`` |          |           |
| vide | parameters   |       |          |           |
| o``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | A list of    | ``arr | ``[]``   | ``false`` |
| dia. | video codecs | ay(st |          |           |
| vide | the device   | ring( |          |           |
| o.co | supports     | 'H261 |          |           |
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
| ``me | The device   |       |          | ``false`` |
| tafl | metaflow     |       |          |           |
| ows` | parameters   |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mu | The music on | ``obj | ``{}``   | ``false`` |
| sic_ | hold         | ect`` |          |           |
| on_h | parameters   |       |          |           |
| old` | used if not  |       |          |           |
| `    | a property   |       |          |           |
|      | of the       |       |          |           |
|      | device owner |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mu | The ID of a  | ``str |          | ``false`` |
| sic_ | media object | ing(0 |          |           |
| on_h | that should  | ..128 |          |           |
| old. | be used as   | )``   |          |           |
| medi | the music on |       |          |           |
| a_id | hold         |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | Static       | ``str |          | ``false`` |
| esen | presence ID  | ing`` |          |           |
| ce_i | (used        |       |          |           |
| d``  | instead of   |       |          |           |
|      | SIP          |       |          |           |
|      | username)    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | The          | ``str | ``user`` | ``false`` |
| iv_l | privilege    | ing(' |          |           |
| evel | level of the | user' |          |           |
| ``   | user         | , 'ad |          |           |
|      |              | min') |          |           |
|      |              | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | User's       | ``obj | ``{}``   | ``false`` |
| ofil | profile data | ect`` |          |           |
| e``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | Name         | ``obj |          | ``false`` |
| onou | pronounced   | ect`` |          |           |
| nced | by user to   |       |          |           |
| _nam | introduce    |       |          |           |
| e``  | himself to   |       |          |           |
|      | conference   |       |          |           |
|      | members      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | The ID of a  | ``str |          | ``false`` |
| onou | media object | ing(0 |          |           |
| nced | that should  | ..128 |          |           |
| _nam | be used as   | )``   |          |           |
| e.me | the music on |       |          |           |
| dia_ | hold         |       |          |           |
| id`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | UI flag that | ``boo | ``false` | ``false`` |
| quir | the user     | lean` | `        |           |
| e_pa | should       | `     |          |           |
| sswo | update their |       |          |           |
| rd_u | password.    |       |          |           |
| pdat |              |       |          |           |
| e``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ri |              | ``obj | ``{}``   | ``false`` |
| ngto |              | ect`` |          |           |
| nes` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ri | The alert    | ``str |          | ``false`` |
| ngto | info SIP     | ing(0 |          |           |
| nes. | header added | ..256 |          |           |
| exte | when the     | )``   |          |           |
| rnal | call is from |       |          |           |
| ``   | internal     |       |          |           |
|      | sources      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ri | The alert    | ``str |          | ``false`` |
| ngto | info SIP     | ing(0 |          |           |
| nes. | header added | ..256 |          |           |
| inte | when the     | )``   |          |           |
| rnal | call is from |       |          |           |
| ``   | external     |       |          |           |
|      | sources      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ti | User's       | ``str |          | ``false`` |
| mezo | timezone     | ing`` |          |           |
| ne`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``us | The GUI      | ``str |          | ``false`` |
| erna | login        | ing(1 |          |           |
| me`` | username -   | ..256 |          |           |
|      | alpha-numeri | )``   |          |           |
|      | c,           |       |          |           |
|      | dashes, at   |       |          |           |
|      | symbol,      |       |          |           |
|      | periods,     |       |          |           |
|      | plusses, and |       |          |           |
|      | underscores  |       |          |           |
|      | allowed      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ve | Determines   | ``boo | ``false` | ``false`` |
| rifi | if the user  | lean` | `        |           |
| ed`` | has been     | `     |          |           |
|      | verified     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``vm | Determines   | ``boo | ``true`` | ``false`` |
| _to_ | if the user  | lean` |          |           |
| emai | would like   | `     |          |           |
| l_en | voicemails   |       |          |           |
| able | emailed to   |       |          |           |
| d``  | them         |       |          |           |
+------+--------------+-------+----------+-----------+

Fetch summary of users in account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/users

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN} \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users
    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "email": "user1@account_realm.com",
                "features": [
                    "caller_id",
                    "vm_to_email"
                ],
                "first_name": "User",
                "id": "{USER_ID}",
                "last_name": "One",
                "priv_level": "admin",
                "timezone": "America/Los_Angeles",
                "username": "user1@account_realm.com"
            },
            {
                "email": "user2@account_realm.com",
                "features": [
                    "caller_id",
                    "vm_to_email"
                ],
                "first_name": "User",
                "id": "{USER_ID}",
                "last_name": "Two",
                "priv_level": "user",
                "timezone": "America/Los_Angeles",
                "username": "user2@account_realm.com"
            }
        ],
        "page_size": 2,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Create a new user
^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/users

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN} \
        -H "Content-Type: application/json" \
        -d '{"data":{"first_name":"User", "last_name":"Three"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users
    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "first_name": "User",
            "hotdesk": {
                "enabled": false,
                "keep_logged_in_elsewhere": false,
                "require_pin": false
            },
            "id": "{USER_ID}",
            "last_name": "Three",
            "media": {
                "audio": {
                    "codecs": [
                        "PCMU"
                    ]
                },
                "encryption": {
                    "enforce_security": false,
                    "methods": []
                },
                "video": {
                    "codecs": []
                }
            },
            "music_on_hold": {},
            "priv_level": "user",
            "profile": {},
            "require_password_update": false,
            "ringtones": {},
            "verified": false,
            "vm_to_email_enabled": true
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Remove a user
^^^^^^^^^^^^^

This request will return the current JSON object of the now-deleted user.

    DELETE /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}
    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": false,
            "first_name": "User",
            "hotdesk": {
                "enabled": false,
                "keep_logged_in_elsewhere": false,
                "require_pin": false
            },
            "id": "{USER_ID}",
            "last_name": "Three",
            "media": {
                "audio": {
                    "codecs": [
                        "PCMU"
                    ]
                },
                "encryption": {
                    "enforce_security": false,
                    "methods": []
                },
                "video": {
                    "codecs": []
                }
            },
            "music_on_hold": {},
            "priv_level": "user",
            "profile": {},
            "require_password_update": false,
            "ringtones": {},
            "verified": false,
            "vm_to_email_enabled": true
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch a user
^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN} \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}
    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "first_name": "User",
            "hotdesk": {
                "enabled": false,
                "keep_logged_in_elsewhere": false,
                "require_pin": false
            },
            "id": "{USER_ID}",
            "last_name": "Three",
            "media": {
                "audio": {
                    "codecs": [
                        "PCMU"
                    ]
                },
                "encryption": {
                    "enforce_security": false,
                    "methods": []
                },
                "video": {
                    "codecs": []
                }
            },
            "music_on_hold": {},
            "priv_level": "user",
            "profile": {},
            "require_password_update": false,
            "ringtones": {},
            "verified": false,
            "vm_to_email_enabled": true
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Patch a user's doc
^^^^^^^^^^^^^^^^^^

    PATCH /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"enabled":false}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}
    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": false,
            "first_name": "User",
            "hotdesk": {
                "enabled": false,
                "keep_logged_in_elsewhere": false,
                "require_pin": false
            },
            "id": "{USER_ID}",
            "last_name": "Three",
            "media": {
                "audio": {
                    "codecs": [
                        "PCMU"
                    ]
                },
                "encryption": {
                    "enforce_security": false,
                    "methods": []
                },
                "video": {
                    "codecs": []
                }
            },
            "music_on_hold": {},
            "priv_level": "user",
            "profile": {},
            "require_password_update": false,
            "ringtones": {},
            "verified": false,
            "vm_to_email_enabled": true
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Change the user doc
^^^^^^^^^^^^^^^^^^^

This requires posting the full user's document in the request body

**Sync**: See `the documentation on device sync <#sync>`__ for more info on ``check-sync``. One can add the field ``"sync": true`` to the JSON document in order to attempt a ``check-sync`` on every registered device this user has.

    POST /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"first_name":"User","last_name":"Three","call_restriction":{},"caller_id":{},"contact_list":{},"dial_plan":{},"enabled":false,"hotdesk":{"enabled":false,"keep_logged_in_elsewhere":false,"require_pin":false},"media":{"audio":{"codecs":["PCMU"]},"encryption":{"enforce_security":false,"methods":[]},"video":{"codecs":[]}},"music_on_hold":{},"priv_level":"user","profile":{},"require_password_update":false,"ringtones":{},"verified":false,"vm_to_email_enabled":true}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}
    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": false,
            "first_name": "User",
            "hotdesk": {
                "enabled": false,
                "keep_logged_in_elsewhere": false,
                "require_pin": false
            },
            "id": "{USER_ID}",
            "last_name": "Three",
            "media": {
                "audio": {
                    "codecs": [
                        "PCMU"
                    ]
                },
                "encryption": {
                    "enforce_security": false,
                    "methods": []
                },
                "video": {
                    "codecs": []
                }
            },
            "music_on_hold": {},
            "priv_level": "user",
            "profile": {},
            "require_password_update": false,
            "ringtones": {},
            "verified": false,
            "vm_to_email_enabled": true
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch (or create) a vCard
^^^^^^^^^^^^^^^^^^^^^^^^^

`vCard <https://en.wikipedia.org/wiki/VCard>`__ is a file format typically used in emails as a form of business card. Kazoo currently generates a 3.0 compatible vCard.

    GET /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}/vcard

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN} \
        -H "Accept: text/x-vcard"
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}/vcard
    BEGIN:VCARD
    VERSION:3.0
    FN:User Three
    N:Three;User
    END:VCARD

Remove the photo from the user
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}/photo

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN} \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}/photo

Fetch the user's photo, if any
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Set the ``Accept`` header to either ``application/base64`` or ``application/octet-stream`` to retrieve the picture's contents.

If the result is successful, you will want to pipe the response into a file.

    GET /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}/photo

.. code:: shell

    curl -v -X GET \
        -H "Accept: application/base64" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}/photo
    [binary data]

Create or change the user's photo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Use ``application/octet-stream`` as the content type.

    POST /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}/photo

.. code:: shell

    curl -v -X POST \
        -H "Content-Type: application/octet-stream" \
        --data-binary @/path/to/image.jpg \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}/photo
    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {},
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Execute a quick call
^^^^^^^^^^^^^^^^^^^^

Ring user's devices; once answered, connect to ``{PHONE_NUMBER}``

In this scenario, the user's devices are considered the ``callee`` while the ``{PHONE_NUMBER}`` side is considered the caller (helpful to know when debugging a call!).

Query string options:

+------+-------+--------------+
| Key  | Type  | Description  |
+======+=======+==============+
| ``au | ``boo | Tells the    |
| to_a | lean( | SIP phone to |
| nswe | )``   | auto-answer  |
| r``  |       | the call, if |
|      |       | supported    |
+------+-------+--------------+
| ``ci | ``str | Set the      |
| d-na | ing() | caller ID    |
| me`` | ``    | name         |
|      |       | (defaults to |
|      |       | "Device      |
|      |       | QuickCall")  |
+------+-------+--------------+
| ``ci | ``str | Set the      |
| d-nu | ing() | caller ID    |
| mber | ``    | number       |
| ``   |       | (defaults to |
|      |       | the          |
|      |       | ``{PHONE_NUM |
|      |       | BER}``)      |
+------+-------+--------------+
| ``ig | ``boo | Toggle       |
| nore | lean( | whether to   |
| -ear | )``   | ignore       |
| ly-m |       | `early       |
| edia |       | media <https |
| ``   |       | ://freeswitc |
|      |       | h.org/conflu |
|      |       | ence/display |
|      |       | /FREESWITCH/ |
|      |       | Early+Media> |
|      |       | `__          |
+------+-------+--------------+
| ``me | ``str | Toggle       |
| dia` | ing(' | whether to   |
| `    | bypas | go           |
|      | s', ' | peer-to-peer |
|      | proce | (\ `bypass < |
|      | ss')` | https://free |
|      | `     | switch.org/c |
|      |       | onfluence/di |
|      |       | splay/FREESW |
|      |       | ITCH/Bypass+ |
|      |       | Media+Overvi |
|      |       | ew>`__       |
|      |       | with the RTP |
+------+-------+--------------+
| ``nu | ``boo | If true,     |
| mber | lean( | remove       |
| _fil | )``,  | non-alphanum |
| ter` | ``reg | eric         |
| `    | ex()` | characters.  |
|      | `     | If a regex,  |
|      |       | use the      |
|      |       | first        |
|      |       | capture      |
|      |       | group as the |
|      |       | "number" to  |
|      |       | dial.        |
+------+-------+--------------+
| ``ti | ``int | In seconds,  |
| meou | eger( | how long to  |
| t``  | 3..)` | ring the     |
|      | `     | device(s)    |
|      |       | (defaults to |
|      |       | 30)          |
+------+-------+--------------+

    GET /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}/quickcall/{PHONE\_NUMBER}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}/quickcall/{PHONE_NUMBER}

.. code:: json

    {
      "auth_token": "{AUTH_TOKEN}",
      "data": {
        "export_custom_channel_vars": [
          "Account-ID",
          "Retain-CID",
          "Authorizing-ID",
          "Authorizing-Type"
        ],
        "custom_channel_vars": {
          "authorizing_id": "{USER_ID}",
          "authorizing_type": "user",
          "inherit_codec": "false",
          "retain_cid": "true",
          "account_id": "{ACCOUNT_ID}"
        },
        "continue_on_fail": false,
        "dial_endpoint_method": "simultaneous",
        "outbound_callee_id_number": "{DEVICE_CALLER_ID_NUMBER}",
        "outbound_callee_id_name": "{DEVICE_CALLER_ID_NAME}",
        "outbound_caller_id_number": "{E164_NUMBER}",
        "outbound_caller_id_name": "Device QuickCall",
        "media": "process",
        "ignore_early_media": true,
        "timeout": 30,
        "endpoints": [
          {
            "outbound_call_id": "{CALL_ID}-quickcall",
            "custom_channel_vars": {
              "auto_answer": true,
              "authorizing_id": "{USER_ID}",
              "owner_id": "{USER_ID}",
              "account_id": "{ACCOUNT_ID}",
              "media_encryption_enforce_security": false,
              "sip_invite_domain": "{ACCOUNT_REALM}"
            },
            "custom_sip_headers": {
              "x_kazoo_aor": "sip:{DEVICE_SIP_USER}@{ACCOUNT_REALM}"
            },
            "presence_id": "{PRESENCE_ID}",
            "codecs": [
              "PCMU",
              "PCMA"
            ],
            "endpoint_id": "{DEVICE_ID}",
            "to_did": "{E164_NUMBER}",
            "to_realm": "{ACCOUNT_REALM}",
            "to_username": "{DEVICE_SIP_USER}",
            "to_user": "{DEVICE_SIP_USER}",
            "invite_format": "username"
          }
        ],
        "application_data": {
          "route": "{PHONE_NUMBER}"
        },
        "application_name": "transfer"
      },
      "status": "success",
      "request_id": "{REQUEST_ID}",
      "revision": "{REVISION}"
    }
