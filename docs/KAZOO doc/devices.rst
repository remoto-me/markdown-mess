Devices
~~~~~~~

About Devices
^^^^^^^^^^^^^

Devices are the endpoints assigned to an account that serve that
account's needs. Devices like fax machines, SIP phones, soft phone
clients, and cell phones (via call fowarding), among others, can be
represented by Kazoo devices.

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
| orwa | calls to     | ..15) |          |           |
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
| ``ca |              | ``#/d |          | ``false`` |
| ll_w |              | efini |          |           |
| aiti |              | tions |          |           |
| ng`` |              | /call |          |           |
|      |              | _wait |          |           |
|      |              | ing`` |          |           |
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
| ``de | Arbitrary    | ``str |          | ``false`` |
| vice | device type  | ing`` |          |           |
| _typ | used by the  |       |          |           |
| e``  | UI and       |       |          |           |
|      | billing      |       |          |           |
|      | system       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``di | A list of    | ``obj | ``{}``   | ``false`` |
| al_p | rules used   | ect`` |          |           |
| lan` | to modify    |       |          |           |
| `    | dialed       |       |          |           |
|      | numbers      |       |          |           |
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
| .ena | this device? |       |          |           |
| bled |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``en | Determines   | ``boo | ``true`` | ``false`` |
| able | if the       | lean` |          |           |
| d``  | device is    | `     |          |           |
|      | currently    |       |          |           |
|      | enabled      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ex | Do not ring  | ``boo | ``false` | ``false`` |
| clud | this device  | lean` | `        |           |
| e_fr | when calling | `     |          |           |
| om_q | user/agent   |       |          |           |
| ueue | in queue     |       |          |           |
| s``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``la | The language | ``str |          | ``false`` |
| ngua | for the      | ing`` |          |           |
| ge`` | device       |       |          |           |
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
| o.co | supports     | 'VP8' |          |           |
| decs |              | , 'H2 |          |           |
| ``   |              | 64',  |          |           |
|      |              | 'H263 |          |           |
|      |              | ', 'H |          |           |
|      |              | 261') |          |           |
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
| ``me | The device   | ``#/d |          | ``false`` |
| tafl | metaflow     | efini |          |           |
| ows` | parameters   | tions |          |           |
| `    |              | /meta |          |           |
|      |              | flows |          |           |
|      |              | ``    |          |           |
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
| ``mw | When true    | ``boo | ``true`` | ``false`` |
| i_un | enables      | lean` |          |           |
| soli | unsolicitate | `     |          |           |
| cita | d            |       |          |           |
| ted_ | mwi          |       |          |           |
| upda | notification |       |          |           |
| tes` | s            |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``na | A friendly   | ``str |          | ``true``  |
| me`` | name for the | ing(1 |          |           |
|      | device       | ..128 |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``ou | List of      | ``arr |          | ``false`` |
| tbou | flags        | ay(st |          |           |
| nd_f | (features)   | ring) |          |           |
| lags | this device  | ``    |          |           |
| ``   | requires     |       |          |           |
|      | when making  |       |          |           |
|      | outbound     |       |          |           |
|      | calls        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ou |              | ``str |          | ``false`` |
| tbou |              | ing`` |          |           |
| nd_f |              |       |          |           |
| lags |              |       |          |           |
| .[]` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ow | The ID of    | ``str |          | ``false`` |
| ner_ | the user     | ing(3 |          |           |
| id`` | object that  | 2)``  |          |           |
|      | 'owns' the   |       |          |           |
|      | device       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | Static       | ``str |          | ``false`` |
| esen | presence ID  | ing`` |          |           |
| ce_i | (used        |       |          |           |
| d``  | instead of   |       |          |           |
|      | SIP          |       |          |           |
|      | username)    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | Provision    | ``obj |          | ``false`` |
| ovis | data         | ect`` |          |           |
| ion` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr |              | ``obj |          | ``false`` |
| ovis |              | ect`` |          |           |
| ion. |              |       |          |           |
| feat |              |       |          |           |
| ure_ |              |       |          |           |
| keys |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr |              | ``obj |          | ``false`` |
| ovis |              | ect`` |          |           |
| ion. |              |       |          |           |
| feat |              |       |          |           |
| ure_ |              |       |          |           |
| keys |              |       |          |           |
| .^[0 |              |       |          |           |
| -9]+ |              |       |          |           |
| $``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | Feature key  | ``str |          | ``true``  |
| ovis | type         | ing(' |          |           |
| ion. |              | prese |          |           |
| feat |              | nce', |          |           |
| ure_ |              |  'par |          |           |
| keys |              | king' |          |           |
| .^[0 |              | , 'pe |          |           |
| -9]+ |              | rsona |          |           |
| $.ty |              | l_par |          |           |
| pe`` |              | king' |          |           |
|      |              | , 'sp |          |           |
|      |              | eed_d |          |           |
|      |              | ial') |          |           |
|      |              | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | Feature key  | ``str |          | ``true``  |
| ovis | value        | ing,  |          |           |
| ion. |              | integ |          |           |
| feat |              | er``  |          |           |
| ure_ |              |       |          |           |
| keys |              |       |          |           |
| .^[0 |              |       |          |           |
| -9]+ |              |       |          |           |
| $.va |              |       |          |           |
| lue` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | When true    | ``boo | ``false` | ``false`` |
| gist | enables      | lean` | `        |           |
| er_o | overwrite    | `     |          |           |
| verw | notification |       |          |           |
| rite | s            |       |          |           |
| _not |              |       |          |           |
| ify` |              |       |          |           |
| `    |              |       |          |           |
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
| ``si |              | ``obj | ``{}``   | ``false`` |
| p``  |              | ect`` |          |           |
+------+--------------+-------+----------+-----------+
| ``si | A property   | ``obj |          | ``false`` |
| p.cu | list of SIP  | ect`` |          |           |
| stom | headers      |       |          |           |
| _sip | beging with  |       |          |           |
| _hea | the prefix   |       |          |           |
| ders | 'X-'         |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``si | The time, in | ``int | ``300``  | ``false`` |
| p.ex | seconds,     | eger` |          |           |
| pire | sent to the  | `     |          |           |
| _sec | provisioner  |       |          |           |
| onds | for the      |       |          |           |
| ``   | registration |       |          |           |
|      | period that  |       |          |           |
|      | the device   |       |          |           |
|      | should be    |       |          |           |
|      | configured   |       |          |           |
|      | with.        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``si | When set to  | ``boo |          | ``false`` |
| p.ig | false the    | lean` |          |           |
| nore | phone should | `     |          |           |
| _com | not consider |       |          |           |
| plet | ring group   |       |          |           |
| ed_e | calls        |       |          |           |
| lsew | answered     |       |          |           |
| here | elsewhere as |       |          |           |
| ``   | missed       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``si | The SIP      | ``str | ``userna | ``false`` |
| p.in | request URI  | ing(' | me``     |           |
| vite | invite       | usern |          |           |
| _for | format       | ame', |          |           |
| mat` |              |  'npa |          |           |
| `    |              | n', ' |          |           |
|      |              | 1npan |          |           |
|      |              | ', 'e |          |           |
|      |              | 164', |          |           |
|      |              |  'rou |          |           |
|      |              | te')` |          |           |
|      |              | `     |          |           |
+------+--------------+-------+----------+-----------+
| ``si | IP address   | ``str |          | ``false`` |
| p.ip | for this     | ing`` |          |           |
| ``   | device       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``si | Method of    | ``str | ``passwo | ``false`` |
| p.me | authenticati | ing(' | rd``     |           |
| thod | on           | passw |          |           |
| ``   |              | ord', |          |           |
|      |              |  'ip' |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``si | The number   | ``str |          | ``false`` |
| p.nu | used if the  | ing`` |          |           |
| mber | invite       |       |          |           |
| ``   | format is    |       |          |           |
|      | 1npan, npan, |       |          |           |
|      | or e164 (if  |       |          |           |
|      | not set the  |       |          |           |
|      | dialed       |       |          |           |
|      | number is    |       |          |           |
|      | used)        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``si | SIP          | ``str |          | ``false`` |
| p.pa | authenticati | ing(5 |          |           |
| sswo | on           | ..32) |          |           |
| rd`` | password     | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``si | The realm    | ``str |          | ``false`` |
| p.re | this device  | ing`` |          |           |
| alm` | should use,  |       |          |           |
| `    | overriding   |       |          |           |
|      | the account  |       |          |           |
|      | realm.       |       |          |           |
|      | Should       |       |          |           |
|      | rarely be    |       |          |           |
|      | necessary.   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``si | The SIP URL  | ``str |          | ``false`` |
| p.ro | used if the  | ing`` |          |           |
| ute` | invite       |       |          |           |
| `    | format is    |       |          |           |
|      | 'route'      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``si | Sends all    | ``str |          | ``false`` |
| p.st | inbound      | ing`` |          |           |
| atic | calls to     |       |          |           |
| _rou | this string  |       |          |           |
| te`` | (instead of  |       |          |           |
|      | dialed       |       |          |           |
|      | number or    |       |          |           |
|      | username)    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``si | SIP          | ``str |          | ``false`` |
| p.us | authenticati | ing(2 |          |           |
| erna | on           | ..32) |          |           |
| me`` | username     | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``su | When true    | ``boo | ``false` | ``false`` |
| ppre | disables     | lean` | `        |           |
| ss_u | deregister   | `     |          |           |
| nreg | notification |       |          |           |
| iste | s            |       |          |           |
| r_no |              |       |          |           |
| tifi |              |       |          |           |
| cati |              |       |          |           |
| ons` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ti | Device's     | ``str |          | ``false`` |
| mezo | timezone     | ing`` |          |           |
| ne`` |              |       |          |           |
+------+--------------+-------+----------+-----------+

Fetch summary of devices in account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/devices

.. code:: shell

    curl -v -X GET \
        -X "X-Auth-Token: {AUTH_TOKEN} \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "device_type": "sip_device",
                "enabled": false,
                "id": "{DEVICE_ID}",
                "mac_address": "00:04:f2:ab:7e:fd",
                "name": "MyPolycom"
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Create a new device
^^^^^^^^^^^^^^^^^^^

See the schema for available fields to include in the data portion

    PUT /v2/accounts/{ACCOUNT\_ID}/devices

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN} \
        -H "Content-Type: application/json" \
        -d '{"data":{"name":"New Device"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "exclude_from_queues": false,
            "id": "{DEVICE_ID}",
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
            "mwi_unsolicitated_updates": true,
            "name": "New Device",
            "register_overwrite_notify": false,
            "ringtones": {},
            "sip": {
                "invite_format": "username",
                "method": "password",
                "registration_expiration": 300
            },
            "suppress_unregister_notifications": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Remove a device
^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/devices/{DEVICE\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/{DEVICE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "exclude_from_queues": false,
            "id": "{DEVICE_ID}",
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
            "mwi_unsolicitated_updates": true,
            "name": "New Device",
            "register_overwrite_notify": false,
            "ringtones": {},
            "sip": {
                "invite_format": "username",
                "method": "password",
                "registration_expiration": 300
            },
            "suppress_unregister_notifications": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch a device
^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/devices/{DEVICE\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/{DEVICE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "exclude_from_queues": false,
            "id": "{DEVICE_ID}",
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
            "mwi_unsolicitated_updates": true,
            "name": "New Device",
            "register_overwrite_notify": false,
            "ringtones": {},
            "sip": {
                "invite_format": "username",
                "method": "password",
                "registration_expiration": 300
            },
            "suppress_unregister_notifications": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Change a device doc
^^^^^^^^^^^^^^^^^^^

Including ``"sync":true`` in the "data" will attempt to reboot the
phone. See the sync section below.

    POST /v2/accounts/{ACCOUNT\_ID}/devices/{DEVICE\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{
            "name": "new device",
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "exclude_from_queues": false,
            "media": {
                "audio": {"codecs": ["PCMU"]},
                "encryption": {"enforce_security": false, "methods": []},
                "video": {"codecs": []}
            },
            "music_on_hold": {},
            "mwi_unsolicitated_updates": true,
            "register_overwrite_notify": false,
            "ringtones": {},
            "sip": {
                "invite_format": "username",
                "method": "password",
                "registration_expiration": 300
            },
            "suppress_unregister_notifications": false,
            "id": "4f3330e78e664bb57f8fb23fbaac2429"
            }}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/{DEVICE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "exclude_from_queues": false,
            "id": "{DEVICE_ID}",
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
            "mwi_unsolicitated_updates": true,
            "name": "new device",
            "register_overwrite_notify": false,
            "ringtones": {},
            "sip": {
                "invite_format": "username",
                "method": "password",
                "registration_expiration": 300
            },
            "suppress_unregister_notifications": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Patch a device
^^^^^^^^^^^^^^

    PATCH /v2/accounts/{ACCOUNT\_ID}/devices/{DEVICE\_ID}

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{"presence_id":"dis_my_device"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/{DEVICE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "exclude_from_queues": false,
            "id": "{DEVICE_ID}",
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
            "mwi_unsolicitated_updates": true,
            "name": "new device",
            "presence_id":"dis_my_device",
            "register_overwrite_notify": false,
            "ringtones": {},
            "sip": {
                "invite_format": "username",
                "method": "password",
                "registration_expiration": 300
            },
            "suppress_unregister_notifications": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch registration statuses of all devices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This will fetch the current registrations of any devices. If no devices
are registered, an empty list will be returned.

    GET /v2/accounts/{ACCOUNT\_ID}/devices/status

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/status

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "device_id": "{DEVICE_ID}",
                "registered": true
            }
        ],
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Reboot a device
^^^^^^^^^^^^^^^

Some devices support receiving SIP NOTIFY packets with ``event`` =
``check-sync``. This is typically used to reboot the phone if the
configuration has changed. Kazoo will generate the NOTIFY packet if the
device is registered.

    POST /v2/accounts/{ACCOUNT\_ID}/devices/{DEVICE\_ID}/sync

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/{DEVICE_ID}/sync

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": "sync request sent",
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Execute a quick call
^^^^^^^^^^^^^^^^^^^^

Ring the device; once answered, connect to ``{PHONE_NUMBER}``

In this scenario, the device is considered the ``callee`` while the
``{PHONE_NUMBER}`` side is considered the caller (helpful to know when
debugging a call!).

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

    GET
    /v2/accounts/{ACCOUNT\_ID}/devices/{DEVICE\_ID}/quickcall/{PHONE\_NUMBER}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/{DEVICE_ID}/quickcall/{PHONE_NUMBER}

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
          "authorizing_id": "{DEVICE_ID}",
          "authorizing_type": "device",
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
              "authorizing_id": "{DEVICE_ID}",
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

Adding Ringtones
^^^^^^^^^^^^^^^^

You can setup internal and external ringtones by adding this:

.. code:: json

    {
        "name": "Device with custom ringtones",
        "ringtones": {
            "internal": "alert info SIP header",
            "external": "alert info SIP header"
        }
    }

See, for instance, the `Polycom
example <https://freeswitch.org/confluence/display/FREESWITCH/Polycom+Internal+Ring>`__

Load a user's devices
^^^^^^^^^^^^^^^^^^^^^

Often you'll want to see what devices belong to a user, or devices that
a user has hot-desked into.

Notice that the first device, ``{DEVICE_ID_1}`` is owned by
``{USER_ID}`` but the second device, ``{DEVICE_ID_2}``, is owned by
``{OWNER_ID}`` **and** is currently hotdesked to ``{USER_ID}`` (see the
``"hotdesked":true`` attribute).

    GET /v2/accounts/{ACCOUNT\_ID}/users/{USER\_ID}/devices

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/users/{USER_ID}/devices

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "device_type": "sip_device",
                "enabled": true,
                "hotdesked": false,
                "id": "{DEVICE_ID_1}",
                "mac_address": "",
                "name": "USER_ID_DEVICE",
                "owner_id": "{USER_ID}"
            },
            {
                "device_type": "sip_device",
                "enabled": true,
                "hotdesked": true,
                "id": "{DEVICE_ID_2}",
                "mac_address": "",
                "name": "OWNER_ID_DEVICE",
                "owner_id": "{OWNER_ID}"
            }
          ],
         "request_id": "{REQUEST_ID}",
         "revision": "{REVISION}",
         "status": "success"
    }

Create an Authn-By-IP Device
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Here is a minimal API request that creates a device that will
authenticate by IP address instead of username/password

    PUT /v2/accounts/{ACCOUNT\_ID}/devices

.. code:: shell

        curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"enabled":true,"name":"authn_by_ip","sip":{"invite_format":"e164", "ip":"{IP_ADDRESS}","method":"ip"}}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "call_restriction": {},
            "caller_id": {},
            "contact_list": {},
            "dial_plan": {},
            "enabled": true,
            "exclude_from_queues": false,
            "id": "{DEVICE_ID}",
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
            "mwi_unsolicitated_updates": true,
            "name": "authn_by_ip",
            "register_overwrite_notify": false,
            "ringtones": {},
            "sip": {
                "invite_format": "e164",
                "ip": "{IP_ADDRESS}",
                "method": "ip",
                "registration_expiration": 300
            },
            "suppress_unregister_notifications": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }
